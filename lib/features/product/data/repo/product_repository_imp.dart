import 'dart:developer';

import 'package:clean_architecture_app/features/product/data/remoteDataSource/product_remote_data_source.dart';
import 'package:clean_architecture_app/features/product/domain/entities/product.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repo/product_repository.dart';

// This tells Injectable: "When someone asks GetIt for UserRepository, return UserRepositoryImpl"
@LazySingleton(as: ProductRepository)
class ProductRepositoryImp implements ProductRepository {
  final ProductRemoteDataSource _productRemoteDataSource;

  ProductRepositoryImp({required ProductRemoteDataSource productRemoteDataSource})
      : _productRemoteDataSource = productRemoteDataSource;

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
}
