import 'package:freezed_annotation/freezed_annotation.dart';

part 'product.freezed.dart';

part 'product.g.dart';

@freezed
class Product with _$Product {
  const factory Product({
    required int id,
    required String name,
    required String image,
    required String groupName,
    required double price,
  }) = _Product;

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
}