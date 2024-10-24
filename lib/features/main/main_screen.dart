import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/app/routing/app_router.dart';
import 'package:test_app/features/places_screen/bloc/places_bloc.dart';
import 'package:test_app/injectable_init.dart';

@RoutePage()
class MainScreen extends StatefulWidget implements AutoRouteWrapper {
  const MainScreen({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => getIt.get<PlacesBloc>()..add(const PlacesStarted()),
        ),
      ],
      child: this,
    );
  }

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter.tabBar(
      physics: const NeverScrollableScrollPhysics(),
      routes: const [
        PlacesRoute(),
        OrdersRoute(),
      ],
      builder: (context, child, controller) {
        final tabsRouter = AutoTabsRouter.of(context);

        return Scaffold(
          body: child,
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.white,
            currentIndex: tabsRouter.activeIndex,
            onTap: (index) {
              if (tabsRouter.activeIndex != index) {
                tabsRouter.setActiveIndex(index);
              }
            },
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.table_restaurant),
                label: 'Столики',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.calculate_outlined),
                label: 'Заказы',
              ),
            ],
          ),
        );
      },
    );
  }
}
