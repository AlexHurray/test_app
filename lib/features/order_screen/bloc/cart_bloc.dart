import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/app/models/product_in_order.dart';
import 'package:test_app/app/repository/products_in_order_repository.dart';

part 'cart_event.dart';

part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final ProductsInOrderRepository _repository;
  final int placeId;
  int? _orderId;

  CartBloc(this.placeId, this._repository) : super(const CartInitial()) {
    on<CartEvent>((event, emit) => switch (event) {
          CartStarted() => _started(event, emit),
          CartInit() => _init(event, emit),
          CartAddProduct() => _addProduct(event, emit),
          CartUpdateProduct() => _updateProduct(event, emit),
          CloseOrder() => _closeOrder(event, emit),
        });
  }

  Future<void> _started(CartStarted event, Emitter<CartState> emit) async {
    if (_orderId != null) {
      try {
        emit(const CartInitial());
        final response = await _repository.getProductsInOrder(_orderId!);
        emit(CartData(data: response));
      } catch (e) {
        emit(CartError(message: e.toString()));
      }
    }
  }

  Future<void> _init(CartInit event, Emitter<CartState> emit) async {
    try {
      emit(const CartInitial());
      _orderId = (await _repository.getActiveOrder(placeId))?.id;
      if (_orderId != null) {
        final response = await _repository.getProductsInOrder(_orderId!);
        emit(CartData(data: response));
      } else {
        emit(const CartData(data: []));
      }
    } catch (e) {
      emit(CartError(message: e.toString()));
    }
  }

  Future<void> _addProduct(CartAddProduct event, Emitter<CartState> emit) async {
    try {
      _orderId ??= await _repository.createOrder(placeId);
      await _repository.insertProduct(event.productId, _orderId!);

      final response = await _repository.getProductsInOrder(_orderId!);
      emit(CartData(data: response));
    } catch (e) {
      emit(CartError(message: e.toString()));
    }
  }

  Future<void> _updateProduct(CartUpdateProduct event, Emitter<CartState> emit) async {
    try {
      _orderId ??= await _repository.createOrder(placeId);
      await _repository.updateProduct(event.productId, event.amount, _orderId!);

      final response = await _repository.getProductsInOrder(_orderId!);
      emit(CartData(data: response));
    } catch (e) {
      emit(CartError(message: e.toString()));
    }
  }

  Future<void> _closeOrder(CloseOrder event, Emitter<CartState> emit) async {
    try {
      await _repository.closeOrder(placeId);
      emit(const CartData(data: []));
    } catch (e) {
      emit(CartError(message: e.toString()));
    }
  }
}
