import '../models/product_model.dart';

abstract class ProductRemoteDataSource {
  Future<List<ProductModel>> getProducts() ;
  Future<ProductModel> addProduct(ProductModel product) ;
}