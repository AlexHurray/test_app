import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_in_order.freezed.dart';

part 'product_in_order.g.dart';

@freezed
class ProductInOrder with _$ProductInOrder {
  const factory ProductInOrder({
    required int id,
    required String name,
    required String image,
    required double price,
    required int amount,
  }) = _ProductInOrder;

  factory ProductInOrder.fromJson(Map<String, dynamic> json) =>
      _$ProductInOrderFromJson(json);
}