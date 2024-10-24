import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/features/orders_screen/bloc/orders_bloc.dart';
import 'package:test_app/features/orders_screen/widgets/order_item.dart';
import 'package:test_app/injectable_init.dart';

@RoutePage()
class OrdersScreen extends StatelessWidget implements AutoRouteWrapper {
  const OrdersScreen({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => getIt.get<OrdersBloc>()..add(const OrdersStarted()),
        ),
      ],
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Заказы'),
      ),
      body: BlocBuilder<OrdersBloc, OrdersState>(
        builder: (context, state) {
          if (state is! OrdersData) {
            return const SizedBox.shrink();
          }

          return ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            itemBuilder: (context, index) => OrderItem(
              id: state.data[index].id,
              createdAt: DateTime.parse(state.data[index].createdAt),
              priceSummary: state.data[index].totalPrice,
              place: state.data[index].placeName,
              isActive: state.data[index].isActive == 1,
            ),
            separatorBuilder: (context, index) => const SizedBox(height: 16),
            itemCount: state.data.length,
          );
        },
      ),

      /*BlocBuilder<OrderBloc, OrderState>(
          bloc: orderBloc,
          builder: (context, state) {
            if (state is OrderStateLoading) {
              return Center(
                  child: SizedBox.square(
                      dimension: 50, child: CircularProgressIndicator()));
            }
            if (state is OrderStateCompleted) {
              return SingleChildScrollView(
                padding: EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    state.orders.length,
                        (index) {
                      final order = state.orders[index];
                      return OrderTile(
                        id: order['id'],
                        createdAt: order['created_at'],
                        priceSummary: order['price_summary'],
                        place: order['place'],
                      );
                    },
                  ),
                ),
              );
            }
            return Text(
              'Ничего нет',
              style: TextStyle(fontSize: 20, color: Colors.black26),
            );
          }),*/
    );
  }
}
