// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_in_order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductInOrderImpl _$$ProductInOrderImplFromJson(Map<String, dynamic> json) =>
    _$ProductInOrderImpl(
      id: json['id'] as int,
      name: json['name'] as String,
      image: json['image'] as String,
      price: (json['price'] as num).toDouble(),
      amount: json['amount'] as int,
    );

Map<String, dynamic> _$$ProductInOrderImplToJson(
        _$ProductInOrderImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
      'price': instance.price,
      'amount': instance.amount,
    };
