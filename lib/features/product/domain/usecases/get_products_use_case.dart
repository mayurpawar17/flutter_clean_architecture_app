import 'package:clean_architecture_app/features/product/domain/entities/product.dart';
import 'package:clean_architecture_app/features/product/domain/repo/product_repository.dart';

class GetProductsUseCase {
  final ProductRepository productRepository;
  GetProductsUseCase({required this.productRepository});

  Future<List<Product>> execute() async {
    // This is the use case containing pure business logic
    return await productRepository.getProducts();
  }

}