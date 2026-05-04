import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'auth.dart';

part 'app_database.g.dart';

// ================= USERS =================

class Users extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get username => text().withLength(min: 1, max: 50)();

  TextColumn get passwordHash => text()();
  TextColumn get passwordSalt => text()();

  TextColumn get fullName => text().withLength(min: 1, max: 100)();
  TextColumn get companyName => text().withLength(min: 1, max: 100)();
}

// ================= JOBS ==================

class Jobs extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get jobId => text()(); // business ID
  TextColumn get customerName => text()();
  TextColumn get address => text()();

  DateTimeColumn get arrivedAt => dateTime().nullable()();
}

// ================= EQUIPMENT ==================

class Equipment extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get sku => text().withLength(min: 1, max: 50)();
  TextColumn get name => text().withLength(min: 1, max: 100)();
  TextColumn get category => text().withLength(min: 1, max: 50)();

  BoolColumn get active =>
      boolean().withDefault(const Constant(true))();
}

// ================= JOB-EQUIPMENT =================

class JobEquipment extends Table {
  IntColumn get jobId =>
      integer().references(Jobs, #id, onDelete: KeyAction.cascade)();

  IntColumn get equipmentId =>
      integer().references(Equipment, #id)();

  IntColumn get quantity =>
      integer().withDefault(const Constant(1))();

  @override
  Set<Column> get primaryKey => {jobId, equipmentId};
}

// ================= SIGNATURES =================

class ProposalSignatures extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get proposalId => integer()();

  BlobColumn get signaturePng => blob()();

  DateTimeColumn get signedAt =>
      dateTime().withDefault(currentDateAndTime)();
}


class RecommendedItem {
  final String equipmentName;
  final String category;
  final int quantity;

  RecommendedItem({
    required this.equipmentName,
    required this.category,
    required this.quantity,
  });
}

// ================= DATABASE =================

@DriftDatabase(tables: [Users, Jobs, Equipment, JobEquipment, ProposalSignatures])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(driftDatabase(name: 'dealernet_db_v6'));

  @override
int get schemaVersion => 5;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (m) async {
          await m.createAll();
        },
        onUpgrade: (m, from, to) async {
          if (from == 1) {
            await m.addColumn(users, users.passwordHash);
            await m.addColumn(users, users.passwordSalt);
          }
          if (from < 3) {
            await m.createTable(jobs);
          }
          if (from < 4) {
            await m.createTable(equipment);
            await m.createTable(jobEquipment);
          }
          if (from < 5) {
            await m.addColumn(jobEquipment, jobEquipment.quantity);
          }
        },
      );

  // ================= AUTH =================

  Future<User?> authenticate(String username, String password) async {
    final user = await getUserByUsername(username);
    if (user == null) return null;

    final attempt = hashPassword(password, user.passwordSalt);
    if (attempt != user.passwordHash) return null;

    return user;
  }

  // ================= JOB HELPERS =================

  Future<Job?> getJobByJobId(String jobId) {
    return (select(jobs)..where((j) => j.jobId.equals(jobId)))
        .getSingleOrNull();
  }

  Future<void> upsertJob({
    required String jobId,
    required String customerName,
    required String address,
  }) async {
    final existing = await getJobByJobId(jobId);
    if (existing == null) {
      await into(jobs).insert(
        JobsCompanion.insert(
          jobId: jobId,
          customerName: customerName,
          address: address,
        ),
      );
    } else {
      await (update(jobs)..where((j) => j.jobId.equals(jobId))).write(
        JobsCompanion(
          customerName: Value(customerName),
          address: Value(address),
        ),
      );
    }
  }

  Future<void> markArrived({
    required String jobId,
    required DateTime arrivedAt,
    required String customerName,
    required String address,
  }) async {
    await upsertJob(
      jobId: jobId,
      customerName: customerName,
      address: address,
    );

    await (update(jobs)..where((j) => j.jobId.equals(jobId))).write(
      JobsCompanion(arrivedAt: Value(arrivedAt)),
    );
  }

  Future<void> upsertUser({
    required String username,
    required String fullName,
    required String companyName,
  }) async {
    final existing = await getUserByUsername(username);

    if (existing == null) {
      final salt = makeSalt();
      final hash = hashPassword('password123', salt);

      await into(users).insert(
        UsersCompanion.insert(
          username: username,
          passwordHash: hash,
          passwordSalt: salt,
          fullName: fullName,
          companyName: companyName,
        ),
      );
    } else {
      await (update(users)..where((u) => u.username.equals(username))).write(
        UsersCompanion(
          fullName: Value(fullName),
          companyName: Value(companyName),
        ),
      );
    }
  }

  Future<void> saveEquipmentSelections({
  required int jobDbId,
  required Map<int, int> equipmentQtyById,
}) async {
  await batch((b) {
    // Clear existing selections
    b.deleteWhere(
      jobEquipment,
      (je) => je.jobId.equals(jobDbId),
    );

    // Insert current selections
    for (final entry in equipmentQtyById.entries) {
      b.insert(
        jobEquipment,
        JobEquipmentCompanion.insert(
          jobId: jobDbId,
          equipmentId: entry.key,
          quantity: Value(entry.value), // ✅ fixed
        ),
      );
    }
  });
}

Future<List<RecommendedItem>> getRecommendedItemsForJob(int jobDbId) async {
  final query = select(jobEquipment).join([
    innerJoin(
      equipment,
      equipment.id.equalsExp(jobEquipment.equipmentId),
    ),
  ])
    ..where(jobEquipment.jobId.equals(jobDbId));

  final rows = await query.get();

  return rows.map((row) {
    final eq = row.readTable(equipment);
    final je = row.readTable(jobEquipment);

    return RecommendedItem(
      equipmentName: eq.name,
      category: eq.category,
      quantity: je.quantity,
    );
  }).toList();
}

// ================= SIGNATURE HELPERS ===================

Future<ProposalSignature?> getSignatureForProposal(int proposalId) {
  return (select(proposalSignatures)
        ..where((tbl) => tbl.proposalId.equals(proposalId)))
      .getSingleOrNull();
}

Future<void> saveSignature({
  required int proposalId,
  required Uint8List signatureBytes,
}) async {
  await into(proposalSignatures).insertOnConflictUpdate(
    ProposalSignaturesCompanion(
      proposalId: Value(proposalId),
      signaturePng: Value(signatureBytes),
    ),
  );
}

  // ================= TABLE DATA HELPERS =================

  Future<void> seedTestData() async {
    final existing = await (select(users)
          ..where((u) => u.username.equals('jqdealer')))
        .getSingleOrNull();

    if (existing == null) {
      final salt = makeSalt();
      final hash = hashPassword('password123', salt);

      await into(users).insert(
        UsersCompanion.insert(
          username: 'jqdealer',
          passwordHash: hash,
          passwordSalt: salt,
          fullName: 'John Q. dealer',
          companyName: 'ABC Security Co.',
        ),
      );

      await upsertJob(
        jobId: 'JOB-0001',
        customerName: 'John Smith',
        address: '638 Maple Ct, Brownsburg, IN 46112',
      );

      await batch((b) {
        b.insertAll(equipment, [
          EquipmentCompanion.insert(
            sku: 'CAM-1080',
            name: '1080p Dome Camera',
            category: 'Camera',
          ),
          EquipmentCompanion.insert(
            sku: 'CAM-4K',
            name: '4K Bullet Camera',
            category: 'Camera',
          ),
          EquipmentCompanion.insert(
            sku: 'ALM-PANEL',
            name: 'Professional Alarm Panel',
            category: 'Alarm',
          ),
          EquipmentCompanion.insert(
            sku: 'SENS-DW',
            name: 'Door/Window Sensor',
            category: 'Sensor',
          ),
          EquipmentCompanion.insert(
            sku: 'SENS-SHOCK',
            name: 'Shock Sensor',
            category: 'Sensor',
          ),
        ]);
      });
    }
  }

  Future<User?> getUserByUsername(String username) {
    return (select(users)..where((u) => u.username.equals(username)))
        .getSingleOrNull();
  }

  Future<void> updateUserCompany({
    required String username,
    required String newCompanyName,
  }) async {
    await (update(users)..where((u) => u.username.equals(username))).write(
      UsersCompanion(companyName: Value(newCompanyName)),
    );
  }

  Future<void> deleteUserByUsername(String username) async {
    await (delete(users)..where((u) => u.username.equals(username))).go();
  }

  // ---------- EQUIPMENT + SELECTIONS ----------

  Future<List<EquipmentData>> getAllEquipment() {
    return (select(equipment)..where((e) => e.active.equals(true))).get();
  }

  Future<Set<int>> getSelectedEquipmentIdsForJob(int jobDbId) async {
    final rows = await (select(jobEquipment)
          ..where((je) => je.jobId.equals(jobDbId)))
        .get();
    return rows.map((r) => r.equipmentId).toSet();
  }

  Future<void> toggleEquipmentForJob({
    required int jobDbId,
    required int equipmentDbId,
    required bool selected,
  }) async {
    if (selected) {
      await into(jobEquipment).insert(
        JobEquipmentCompanion.insert(
          jobId: jobDbId,
          equipmentId: equipmentDbId,
        ),
        mode: InsertMode.insertOrIgnore,
      );
    } else {
      await (delete(jobEquipment)
            ..where((je) =>
                je.jobId.equals(jobDbId) & je.equipmentId.equals(equipmentDbId)))
          .go();
    }
  }

}