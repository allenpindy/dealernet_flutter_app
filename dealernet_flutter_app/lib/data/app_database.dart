import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

part 'app_database.g.dart';

class Users extends Table {
  IntColumn get id => integer().autoIncrement()();

  // login username
  TextColumn get username => text().withLength(min: 1, max: 50)();

  // display name
  TextColumn get fullName => text().withLength(min: 1, max: 100)();

  // company name
  TextColumn get companyName => text().withLength(min: 1, max: 100)();
}

@DriftDatabase(tables: [Users])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(driftDatabase(name: 'dealernet_db')); // drift_flutter helper [4](https://pub.dev/packages/drift_flutter)

  @override
  int get schemaVersion => 1;

  /// Seed a known test user if it doesn't already exist.
  Future<void> seedTestData() async {
    final existing = await (select(users)
          ..where((u) => u.username.equals('jqinstaller')))
        .getSingleOrNull();

    if (existing == null) {
      await into(users).insert(
        UsersCompanion.insert(
          username: 'jqinstaller',
          fullName: 'John Q. Installer',
          companyName: 'ABC Security Co.',
        ),
      );
    }
  }

  Future<void> updateUserCompany({
    required String username,
    required String newCompanyName,
  }) async {
    await (update(users)
          ..where((u) => u.username.equals(username)))
        .write(
      UsersCompanion(
        companyName: Value(newCompanyName),
      ),
    );
  }

  Future<void> upsertUser({
  required String username,
  required String fullName,
  required String companyName,
}) async {
  final existing = await getUserByUsername(username);

  if (existing == null) {
    await into(users).insert(
      UsersCompanion.insert(
        username: username,
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

Future<void> deleteUserByUsername(String username) async {
  await (delete(users)..where((u) => u.username.equals(username))).go();
}

  /// Lookup by username
  Future<User?> getUserByUsername(String username) {
    return (select(users)..where((u) => u.username.equals(username)))
        .getSingleOrNull();
  }
}