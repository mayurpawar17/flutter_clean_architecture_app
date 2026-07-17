import 'package:clean_architecture_app/features/product/domain/entities/product.dart';

abstract class ProductRepository {
  Future<List<Product>> getProducts();
}