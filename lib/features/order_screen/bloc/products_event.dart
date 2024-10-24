part of 'products_bloc.dart';

sealed class ProductsEvent extends Equatable {
  const ProductsEvent();
}

class ProductsStarted extends ProductsEvent {
  const ProductsStarted();

  @override
  List<Object?> get props => [];
}
