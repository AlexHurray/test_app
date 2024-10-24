part of 'products_bloc.dart';

sealed class ProductsState extends Equatable {
  const ProductsState();
}

/// initial state
class ProductsInitial extends ProductsState {
  const ProductsInitial() : super();

  @override
  List<Object> get props => [];
}

/// loading state
final class ProductsLoading extends ProductsState {
  const ProductsLoading();

  @override
  List<Object> get props => [];
}

/// main data state
final class ProductsData extends ProductsState {
  final Map<String, List<Product>> data;

  const ProductsData({required this.data});

  @override
  List<Object> get props => [data];
}

/// error state
final class ProductsError extends ProductsState {
  final String message;

  const ProductsError({required this.message}) : super();

  @override
  List<Object> get props => [message];
}
