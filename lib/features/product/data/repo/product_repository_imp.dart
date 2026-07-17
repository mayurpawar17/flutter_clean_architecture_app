import 'dart:developer';

import 'package:clean_architecture_app/features/product/data/models/product_model.dart';
import 'package:clean_architecture_app/features/product/data/remoteDataSource/product_remote_data_source.dart';
import 'package:clean_architecture_app/features/product/domain/entities/product.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repo/product_repository.dart';

// This tells Injectable: "When someone asks GetIt for UserRepository, return UserRepositoryImpl"
@LazySingleton(as: ProductRepository)
class ProductRepositoryImp implements ProductRepository {
  final ProductRemoteDataSource _productRemoteDataSource;

  ProductRepositoryImp({required this._productRemoteDataSource});

  @override
  Future<List<Product>> getProducts() {
    try {
      final productModel = _productRemoteDataSource.getProducts();
      return productModel;
    } catch (e) {
      log(e.toString());
      throw UnimplementedError();
    }
  }

  @override
  Future<Product> addProduct(Product product) async {
    final productModel = ProductModel(
      id: product.id,
      title: product.title,
      price: product.price,
      description: product.description,
      category: product.category,
      image: product.image,
    );
    return await _productRemoteDataSource.addProduct(productModel);
  }
}
