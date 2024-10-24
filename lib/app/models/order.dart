import 'package:freezed_annotation/freezed_annotation.dart';

part 'order.freezed.dart';

part 'order.g.dart';

@freezed
class Order with _$Order {
  const factory Order({
    required int id,
    required String createdAt,
    required String placeName,
    required int placeId,
    @Default(0) double totalPrice,
    required int isActive,
  }) = _Order;

  factory Order.fromJson(Map<String, dynamic> json) =>
      _$OrderFromJson(json);
}