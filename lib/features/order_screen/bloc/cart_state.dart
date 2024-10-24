part of 'cart_bloc.dart';

sealed class CartState extends Equatable {
  const CartState();
}

/// initial state
class CartInitial extends CartState {
  const CartInitial() : super();

  @override
  List<Object> get props => [];
}

/// loading state
final class CartLoading extends CartState {
  const CartLoading();

  @override
  List<Object> get props => [];
}

/// main data state
final class CartData extends CartState {
  final List<ProductInOrder> data;

  const CartData({required this.data});

  @override
  List<Object> get props => [data];
}

/// error state
final class CartError extends CartState {
  final String message;

  const CartError({required this.message}) : super();

  @override
  List<Object> get props => [message];
}
