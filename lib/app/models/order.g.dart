// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderImpl _$$OrderImplFromJson(Map<String, dynamic> json) => _$OrderImpl(
      id: json['id'] as int,
      createdAt: json['createdAt'] as String,
      placeName: json['placeName'] as String,
      placeId: json['placeId'] as int,
      totalPrice: (json['totalPrice'] as num?)?.toDouble() ?? 0,
      isActive: json['isActive'] as int,
    );

Map<String, dynamic> _$$OrderImplToJson(_$OrderImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt,
      'placeName': instance.placeName,
      'placeId': instance.placeId,
      'totalPrice': instance.totalPrice,
      'isActive': instance.isActive,
    };
