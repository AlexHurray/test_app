import 'package:flutter/material.dart';
import 'package:test_app/app/db/local_database.dart';
import 'package:test_app/injectable_init.dart';

/// Application initialisation logic
Future<void> appInit() async {
  /// This is required so that libraries could get some dependencies like application directory
  WidgetsFlutterBinding.ensureInitialized();

  /// Init Injectable
  configureDependencies();

  await getIt.get<LocalDatabase>().init();
}
