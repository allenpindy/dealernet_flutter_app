import 'package:drift/drift.dart';

class ProposalSignatures extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get proposalId => integer()();

  // ✅ THIS IS THE LINE YOU ASKED ABOUT
  BlobColumn get signaturePng => blob()();

  DateTimeColumn get signedAt =>
      dateTime().withDefault(currentDateAndTime)();
}
