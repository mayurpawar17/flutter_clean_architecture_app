import 'package:clean_architecture_app/features/product/domain/entities/product.dart';
import 'package:clean_architecture_app/features/product/domain/repo/product_repository.dart';
import 'package:injectable/injectable.dart';


// This will be registered as: sl.registerLazySingleton(() => GetUserUseCase(sl<UserRepository>()));
@lazySingleton
class GetProductsUseCase {
  final ProductRepository productRepository;
  GetProductsUseCase({required this.productRepository});// Injectable automatically resolves "repository"

  Future<List<Product>> execute() async {
    // This is the use case containing pure business logic
    return await productRepository.getProducts();
  }

}