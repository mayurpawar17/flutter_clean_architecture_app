import 'package:clean_architecture_app/features/product/presentation/pages/product_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/network/api_client.dart';
import 'features/product/data/remoteDataSource/product_remote_data_source.dart';
import 'features/product/data/remoteDataSource/product_remote_data_source_impl.dart';
import 'features/product/data/repo/product_repository_imp.dart';
import 'features/product/domain/repo/product_repository.dart';
import 'features/product/domain/usecases/get_products_use_case.dart';
import 'features/product/presentation/bloc/product_bloc.dart';

void main() {
  final ApiClient apiClient = ApiClient();
  final ProductRemoteDataSource productRemoteDataSource =
      ProductRemoteDataSourceImpl(apiClient: apiClient);
  final ProductRepository productRepository = ProductRepositoryImp(
    productRemoteDataSource: productRemoteDataSource,
  );
  final GetProductsUseCase getProductsUseCase = GetProductsUseCase(
    productRepository: productRepository,
  );

  runApp(MyApp(getProductsUseCase: getProductsUseCase));
}

class MyApp extends StatelessWidget {
  final GetProductsUseCase getProductsUseCase;

  const MyApp({super.key, required this.getProductsUseCase});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              ProductBloc(getProductsUseCase: getProductsUseCase),
        ),
      ],

      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: const ProductScreen()),
    );
  }
}
