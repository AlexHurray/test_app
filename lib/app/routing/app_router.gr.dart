// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    MainRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child: const MainScreen()),
      );
    },
    MainTab1.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MainTabPage1(),
      );
    },
    OrderRoute.name: (routeData) {
      final args = routeData.argsAs<OrderRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(
            child: OrderScreen(
          key: args.key,
          placeName: args.placeName,
          placeId: args.placeId,
        )),
      );
    },
    OrdersRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const OrdersScreen(),
      );
    },
    PlacesRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const PlacesScreen(),
      );
    },
  };
}

/// generated route for
/// [MainScreen]
class MainRoute extends PageRouteInfo<void> {
  const MainRoute({List<PageRouteInfo>? children})
      : super(
          MainRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MainTabPage1]
class MainTab1 extends PageRouteInfo<void> {
  const MainTab1({List<PageRouteInfo>? children})
      : super(
          MainTab1.name,
          initialChildren: children,
        );

  static const String name = 'MainTab1';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [OrderScreen]
class OrderRoute extends PageRouteInfo<OrderRouteArgs> {
  OrderRoute({
    Key? key,
    required String placeName,
    required int placeId,
    List<PageRouteInfo>? children,
  }) : super(
          OrderRoute.name,
          args: OrderRouteArgs(
            key: key,
            placeName: placeName,
            placeId: placeId,
          ),
          initialChildren: children,
        );

  static const String name = 'OrderRoute';

  static const PageInfo<OrderRouteArgs> page = PageInfo<OrderRouteArgs>(name);
}

class OrderRouteArgs {
  const OrderRouteArgs({
    this.key,
    required this.placeName,
    required this.placeId,
  });

  final Key? key;

  final String placeName;

  final int placeId;

  @override
  String toString() {
    return 'OrderRouteArgs{key: $key, placeName: $placeName, placeId: $placeId}';
  }
}

/// generated route for
/// [OrdersScreen]
class OrdersRoute extends PageRouteInfo<void> {
  const OrdersRoute({List<PageRouteInfo>? children})
      : super(
          OrdersRoute.name,
          initialChildren: children,
        );

  static const String name = 'OrdersRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [PlacesScreen]
class PlacesRoute extends PageRouteInfo<void> {
  const PlacesRoute({List<PageRouteInfo>? children})
      : super(
          PlacesRoute.name,
          initialChildren: children,
        );

  static const String name = 'PlacesRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
