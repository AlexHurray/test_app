part of 'orders_bloc.dart';

sealed class OrdersEvent extends Equatable {
  const OrdersEvent();
}

class OrdersStarted extends OrdersEvent {
  const OrdersStarted();

  @override
  List<Object?> get props => [];
}
