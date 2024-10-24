
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:test_app/app/models/product.dart';
import 'package:test_app/app/repository/products_repository.dart';

part 'products_event.dart';

part 'products_state.dart';

@injectable
class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final ProductsRepository _repository;

  ProductsBloc(this._repository) : super(const ProductsInitial()) {
    on<ProductsEvent>((event, emit) => switch (event) {
      ProductsStarted() => _started(event, emit),
        });
  }

  Future<void> _started(ProductsStarted event, Emitter<ProductsState> emit) async {
    try {
      emit(const ProductsInitial());
      final response = await _repository.getProductsMap();
      emit(ProductsData(data: response));
    } catch (e) {
      emit(ProductsError(message: e.toString()));
    }
  }
}
