import 'package:equatable/equatable.dart';

import '../../domain/entities/product.dart';

abstract class ProductState extends Equatable {}

class ProductInitial extends ProductState {
  @override
  List<Object?> get props => [];
}

class ProductLoading extends ProductState {
  @override
  List<Object?> get props => [];
}

class ProductSuccess extends ProductState {
  final List<Product> products;

  ProductSuccess(this.products);

  @override
  List<Object?> get props => [products];
}

class ProductFailure extends ProductState {
  final String error;

  ProductFailure(this.error);

  @override
  List<Object?> get props => [error];
}
