import 'dart:async';

import 'package:flutter/material.dart';
import 'package:test_app/app.dart';
import 'package:test_app/app_init.dart';

FutureOr<void> main() async {
  await appInit();

  runApp(const App());
}
