import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/features/order_screen/bloc/cart_bloc.dart';

class ProductInCard extends StatelessWidget {
  const ProductInCard({
    super.key,
    required this.cartProductId,
    required this.title,
    required this.price,
    required this.amount,
  });

  final int cartProductId;
  final String title;
  final double price;
  final int amount;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(left: 20, top: 10, bottom: 10),
                child: Text(
                  title,
                  style: const TextStyle(fontSize: 16),
                  maxLines: 2,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () {
                      context.read<CartBloc>().add(CartUpdateProduct(cartProductId, amount + 1));
                    },
                    icon: const Icon(
                      Icons.add_circle_outline,
                      color: Colors.green,
                    )),
                Container(
                  alignment: Alignment.center,
                  width: 40,
                  padding: const EdgeInsets.all(10.0),
                  child: Text(amount.toString()),
                ),
                IconButton(
                    onPressed: () {
                      context.read<CartBloc>().add(CartUpdateProduct(cartProductId, amount - 1));
                    },
                    icon: const Icon(
                      Icons.remove_circle_outline,
                      color: Colors.red,
                    )),
              ],
            ),
          ],
        )
      ],
    );
  }
}
