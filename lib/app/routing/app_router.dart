import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:test_app/features/main/main_screen.dart';
import 'package:test_app/features/order_screen/order_screen.dart';
import 'package:test_app/features/orders_screen/orders_screen.dart';
import 'package:test_app/features/places_screen/places_screen.dart';

part 'app_router.gr.dart';

GlobalKey<NavigatorState> globalNavigatorKey = GlobalKey<NavigatorState>();

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
@singleton
class AppRouter extends _$AppRouter {
  AppRouter() : super(navigatorKey: globalNavigatorKey);

  @override
  RouteType get defaultRouteType => const RouteType.adaptive();

  @override
  final List<AutoRoute> routes = [
    AutoRoute(
      page: MainRoute.page,
      path: '/',
      children: [
        AutoRoute(
          path: 'places',
          page: MainTab1.page,
          children: [
            AutoRoute(
              path: '',
              page: PlacesRoute.page,
            ),
            AutoRoute(
              path: 'order',
              page: OrderRoute.page,
            ),
          ],
        ),
        AutoRoute(
          path: 'orders',
          page: OrdersRoute.page,
          maintainState: false,
        ),
        RedirectRoute(path: '', redirectTo: 'places'),
      ],
    ),
    RedirectRoute(path: '*', redirectTo: '/'),
  ];
}

@RoutePage(name: 'MainTab1')
class MainTabPage1 extends AutoRouter {
  const MainTabPage1({super.key});
}
