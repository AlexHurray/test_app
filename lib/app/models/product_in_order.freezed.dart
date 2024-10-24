// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_in_order.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProductInOrder _$ProductInOrderFromJson(Map<String, dynamic> json) {
  return _ProductInOrder.fromJson(json);
}

/// @nodoc
mixin _$ProductInOrder {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  int get amount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductInOrderCopyWith<ProductInOrder> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductInOrderCopyWith<$Res> {
  factory $ProductInOrderCopyWith(
          ProductInOrder value, $Res Function(ProductInOrder) then) =
      _$ProductInOrderCopyWithImpl<$Res, ProductInOrder>;
  @useResult
  $Res call({int id, String name, String image, double price, int amount});
}

/// @nodoc
class _$ProductInOrderCopyWithImpl<$Res, $Val extends ProductInOrder>
    implements $ProductInOrderCopyWith<$Res> {
  _$ProductInOrderCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? image = null,
    Object? price = null,
    Object? amount = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductInOrderImplCopyWith<$Res>
    implements $ProductInOrderCopyWith<$Res> {
  factory _$$ProductInOrderImplCopyWith(_$ProductInOrderImpl value,
          $Res Function(_$ProductInOrderImpl) then) =
      __$$ProductInOrderImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name, String image, double price, int amount});
}

/// @nodoc
class __$$ProductInOrderImplCopyWithImpl<$Res>
    extends _$ProductInOrderCopyWithImpl<$Res, _$ProductInOrderImpl>
    implements _$$ProductInOrderImplCopyWith<$Res> {
  __$$ProductInOrderImplCopyWithImpl(
      _$ProductInOrderImpl _value, $Res Function(_$ProductInOrderImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? image = null,
    Object? price = null,
    Object? amount = null,
  }) {
    return _then(_$ProductInOrderImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductInOrderImpl implements _ProductInOrder {
  const _$ProductInOrderImpl(
      {required this.id,
      required this.name,
      required this.image,
      required this.price,
      required this.amount});

  factory _$ProductInOrderImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductInOrderImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String image;
  @override
  final double price;
  @override
  final int amount;

  @override
  String toString() {
    return 'ProductInOrder(id: $id, name: $name, image: $image, price: $price, amount: $amount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductInOrderImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.amount, amount) || other.amount == amount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, image, price, amount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductInOrderImplCopyWith<_$ProductInOrderImpl> get copyWith =>
      __$$ProductInOrderImplCopyWithImpl<_$ProductInOrderImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductInOrderImplToJson(
      this,
    );
  }
}

abstract class _ProductInOrder implements ProductInOrder {
  const factory _ProductInOrder(
      {required final int id,
      required final String name,
      required final String image,
      required final double price,
      required final int amount}) = _$ProductInOrderImpl;

  factory _ProductInOrder.fromJson(Map<String, dynamic> json) =
      _$ProductInOrderImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get image;
  @override
  double get price;
  @override
  int get amount;
  @override
  @JsonKey(ignore: true)
  _$$ProductInOrderImplCopyWith<_$ProductInOrderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
