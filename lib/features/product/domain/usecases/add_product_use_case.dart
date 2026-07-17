import 'package:clean_architecture_app/features/product/domain/entities/product.dart';
import 'package:clean_architecture_app/features/product/domain/repo/product_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class AddProductUseCase {
  final ProductRepository productRepository;
  AddProductUseCase({required this.productRepository});

  Future<Product> execute(Product product) async {
    return await productRepository.addProduct(product);
  }
}
