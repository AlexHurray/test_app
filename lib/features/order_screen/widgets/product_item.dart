import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/features/order_screen/bloc/cart_bloc.dart';

class ProductItem extends StatefulWidget {
  const ProductItem({
    required this.title,
    required this.price,
    required this.imagePath,
    required this.inStock,
    required this.productId,
    super.key,
  });

  final String title;
  final double price;
  final String imagePath;
  final int inStock;
  final int productId;

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<CartBloc>().add(CartAddProduct(widget.productId));
      },
      child: Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        width: 170,
        height: 110,
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox.square(
                  dimension: 50,
                  child: Image.asset(
                    'assets/${widget.imagePath}',
                  ),
                ),
                Column(
                  children: [
                    Text(
                      '₽${widget.price.toStringAsFixed(2)}',
                      style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Склад: ${widget.inStock}',
                      style: const TextStyle(fontSize: 10),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.title,
                  style: const TextStyle(fontSize: 16),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
