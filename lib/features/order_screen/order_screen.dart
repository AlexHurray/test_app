import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/app/repository/products_in_order_repository.dart';
import 'package:test_app/features/order_screen/bloc/cart_bloc.dart';
import 'package:test_app/features/order_screen/bloc/products_bloc.dart';
import 'package:test_app/features/order_screen/widgets/product_in_card.dart';
import 'package:test_app/features/order_screen/widgets/product_item.dart';
import 'package:test_app/injectable_init.dart';
import 'package:test_app/utils/widget_ext.dart';

@RoutePage()
class OrderScreen extends StatelessWidget implements AutoRouteWrapper {
  final String placeName;
  final int placeId;

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => getIt.get<ProductsBloc>()..add(const ProductsStarted()),
        ),
        BlocProvider(
          create: (_) =>
              CartBloc(placeId, getIt.get<ProductsInOrderRepository>())..add(const CartInit()),
        ),
      ],
      child: this,
    );
  }

  const OrderScreen({super.key, required this.placeName, required this.placeId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(placeName),
      ),
      body: BlocBuilder<ProductsBloc, ProductsState>(
        builder: (context, state) {
          if (state is! ProductsData) return const Center(child: CircularProgressIndicator());

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                BlocBuilder<CartBloc, CartState>(builder: (context, cartState) {
                  if (cartState is! CartData) {
                    return const SizedBox.shrink();
                  }

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ...cartState.data.map((e) => ProductInCard(
                            cartProductId: e.id,
                            title: e.name,
                            price: e.price,
                            amount: e.amount,
                          )),
                      if (cartState.data.isNotEmpty)
                        GestureDetector(
                          onTap: () {
                            context.read<CartBloc>().add(CloseOrder(placeId));
                            context.router.pop();
                          },
                          child: const Padding(
                            padding: EdgeInsets.symmetric(vertical: 8.0),
                            child: Text(
                              'Рассчитать',
                              style: TextStyle(fontSize: 20),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                    ],
                  );
                }),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: state.data.keys
                      .map((k) => Expanded(
                              child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              _HeaderCard(title: k),
                              const SizedBox(height: 16),
                              ...state.data[k]!
                                  .map(
                                    (v) => ProductItem(
                                      title: v.name,
                                      price: v.price,
                                      imagePath: v.image,
                                      inStock: 999,
                                      productId: v.id,
                                    ),
                                  )
                                  .interleave(context, (_) => const SizedBox(height: 8)),
                            ],
                          )))
                      .interleave(context, (_) => const SizedBox(width: 8)),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _HeaderCard extends StatelessWidget {
  const _HeaderCard({
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        color: Color.fromRGBO(255, 215, 173, 1.0),
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      height: 110,
      padding: const EdgeInsets.all(10),
      child: Text(
        title,
        style: const TextStyle(fontSize: 20),
      ),
    );
  }
}
