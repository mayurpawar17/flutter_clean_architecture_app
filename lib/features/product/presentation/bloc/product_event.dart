import 'package:clean_architecture_app/features/product/domain/entities/product.dart';
import 'package:equatable/equatable.dart';

abstract class ProductEvent extends Equatable{

}

class GetProductsEvent extends ProductEvent{
  @override
  List<Object?> get props => [];
}

class AddProductEvent extends ProductEvent {
  final Product product;

  AddProductEvent(this.product);

  @override
  List<Object?> get props => [product];
}
