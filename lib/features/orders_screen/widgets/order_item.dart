import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class OrderItem extends StatelessWidget {
  const OrderItem({
    super.key,
    required this.id,
    required this.createdAt,
    required this.priceSummary,
    required this.place,
    required this.isActive,
  });

  final int id;
  final DateTime createdAt;
  final double priceSummary;
  final String place;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {

      },
      title: isActive ? const Text('Активный заказ') : const Text('Оплаченный заказ'),
      leading: isActive ? const Icon(Icons.check_box_outline_blank): const Icon(Icons.check_box),
      subtitle: Padding(
        padding: const EdgeInsets.only(top: 5),
        child: Text(
          place,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
      ),
      trailing: Column(
        children: [
          Text(
            '№${id.toString().padLeft(2, '0')}  ${DateFormat('HH:mm').format(createdAt)}',
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 2,
          ),
          Text(
            '₽${priceSummary.toStringAsFixed(2)}',
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}
