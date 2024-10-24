import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:test_app/app/routing/app_router.dart';


class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final appRouter = GetIt.I<AppRouter>();
    return MaterialApp.router(
      routerConfig: appRouter.config(),
      locale: const Locale('ru'),
      debugShowCheckedModeBanner: false,
    );
  }
}
