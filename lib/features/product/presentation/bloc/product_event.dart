import 'package:equatable/equatable.dart';

abstract class ProductEvent extends Equatable{

}

class GetProductsEvent extends ProductEvent{
  @override
  List<Object?> get props => [];
}
