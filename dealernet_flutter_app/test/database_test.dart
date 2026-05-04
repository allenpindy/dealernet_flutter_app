import 'package:flutter_test/flutter_test.dart';
import 'package:drift/native.dart';
import 'package:dealernet_flutter_app/data/app_database.dart';

void main() {
  late AppDatabase db;

  setUp(() {
    db = AppDatabase(
      DatabaseConnection(
        NativeDatabase.memory(),
        closeStreamsSynchronously: true,
      ),
    );
  });

  tearDown(() async {
    await db.close();
  });

  test('Can create a user', () async {
    await db.upsertUser(
      username: 'testuser',
      fullName: 'Test User',
      companyName: 'Test Co',
    );

    final user = await db.getUserByUsername('testuser');
    expect(user, isNotNull);
    expect(user!.fullName, 'Test User');
  });

  test('Can insert and retrieve a job', () async {
    await db.upsertJob(
      jobId: 'JOB-TEST',
      customerName: 'Jane Doe',
      address: '123 Main St',
    );

    final job = await db.getJobByJobId('JOB-TEST');
    expect(job, isNotNull);
    expect(job!.customerName, 'Jane Doe');
  });

  test('Can store and retrieve signature bytes', () async {
    final bytes = Uint8List.fromList([1, 2, 3, 4]);

    await db.saveSignature(
      proposalId: 1,
      signatureBytes: bytes,
    );

    final sig = await db.getSignatureForProposal(1);
    expect(sig, isNotNull);
    expect(sig!.signaturePng, bytes);
  });
}
