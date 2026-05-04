import 'package:flutter/foundation.dart';
import 'app_database.dart';

export 'app_database.dart'; // 👈 makes EquipmentData, Job, User, etc. available

final AppDatabase appDb = AppDatabase();

Future<void> initDb() async {
  debugPrint('initDb: starting');
  await appDb.seedTestData();
  debugPrint('initDb: completed');
}