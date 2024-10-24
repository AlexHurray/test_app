import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:test_app/app/repository/orders_repository.dart';
import 'package:test_app/app/models/order.dart' as o;

part 'orders_event.dart';

part 'orders_state.dart';

@injectable
class OrdersBloc extends Bloc<OrdersEvent, OrdersState> {
  final OrdersRepository _repository;

  OrdersBloc(this._repository) : super(const OrdersInitial()) {
    on<OrdersEvent>((event, emit) => switch (event) {
          OrdersStarted() => _started(event, emit),
        });
  }

  Future<void> _started(OrdersStarted event, Emitter<OrdersState> emit) async {
    try {
      emit(const OrdersInitial());
      final response = await _repository.getOrders();
      emit(OrdersData(data: response));
    } catch (e) {
      emit(OrdersError(message: e.toString()));
    }
  }
}
