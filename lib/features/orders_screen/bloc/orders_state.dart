part of 'orders_bloc.dart';

sealed class OrdersState extends Equatable {
  const OrdersState();
}

/// initial state
class OrdersInitial extends OrdersState {
  const OrdersInitial() : super();

  @override
  List<Object> get props => [];
}

/// loading state
final class OrdersLoading extends OrdersState {
  const OrdersLoading();

  @override
  List<Object> get props => [];
}

/// main data state
final class OrdersData extends OrdersState {
  final List<o.Order> data;

  const OrdersData({required this.data});

  @override
  List<Object> get props => [data];
}

/// error state
final class OrdersError extends OrdersState {
  final String message;

  const OrdersError({required this.message}) : super();

  @override
  List<Object> get props => [message];
}
