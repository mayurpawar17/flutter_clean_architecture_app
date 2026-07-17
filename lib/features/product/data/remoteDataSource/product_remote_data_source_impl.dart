import 'package:clean_architecture_app/core/network/api_constants.dart';
import 'package:clean_architecture_app/features/product/data/models/product_model.dart';
import 'package:clean_architecture_app/features/product/data/remoteDataSource/product_remote_data_source.dart';

import '../../../../core/network/api_client.dart';

class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  final ApiClient _apiClient;

  ProductRemoteDataSourceImpl({required this._apiClient});

  @override
  Future<List<ProductModel>> getProducts() async {
    final response = await _apiClient.get(ApiConstants.productEndPoint);

    final List<dynamic> productList = response.data;
    return productList
        .map((product) => ProductModel.fromJson(product))
        .toList();
  }
}
