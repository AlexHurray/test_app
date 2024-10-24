part of 'cart_bloc.dart';

sealed class CartEvent extends Equatable {
  const CartEvent();
}

class CartStarted extends CartEvent {
  const CartStarted();

  @override
  List<Object?> get props => [];
}

class CartInit extends CartEvent {
  const CartInit();

  @override
  List<Object?> get props => [];
}

class CartAddProduct extends CartEvent {
  final int productId;

  const CartAddProduct(this.productId);

  @override
  List<Object?> get props => [productId];
}

class CartUpdateProduct extends CartEvent {
  final int productId;
  final int amount;

  const CartUpdateProduct(this.productId, this.amount);

  @override
  List<Object?> get props => [productId, amount];
}

class CloseOrder extends CartEvent {
  final int placeId;

  const CloseOrder(this.placeId);

  @override
  List<Object?> get props => [placeId];
}
