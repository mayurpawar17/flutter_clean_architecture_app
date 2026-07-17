import 'package:clean_architecture_app/core/network/api_client.dart';
import 'package:clean_architecture_app/features/product/data/remoteDataSource/product_remote_data_source_impl.dart';
import 'package:clean_architecture_app/features/product/data/repo/product_repository_imp.dart';
import 'package:clean_architecture_app/features/product/domain/repo/product_repository.dart';
import 'package:clean_architecture_app/features/product/presentation/bloc/product_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../features/product/data/remoteDataSource/product_remote_data_source.dart';
import '../../features/product/domain/usecases/get_products_use_case.dart';

final sl = GetIt.instance;

void init() {
  //STEP 1: External / Third-Party Drivers

  // Lazy Singleton: ApiClient (Dio) has no async setup, keep it in memory
  sl.registerLazySingleton<ApiClient>(() => ApiClient());

  // STEP 2: Data Sources & Repositories (Data Layer)
  // Data Source: Depends on http.Client (which we get from sl)
  sl.registerLazySingleton<ProductRemoteDataSource>(
    () => ProductRemoteDataSourceImpl(apiClient: sl<ApiClient>()),
  );

  // Repository: Binds the abstract class to the concrete implementation
  sl.registerLazySingleton<ProductRepository>(
    () => ProductRepositoryImp(
      productRemoteDataSource: sl<ProductRemoteDataSource>(),
    ),
  );

  // STEP 3: Use Cases (Domain Layer)

  // Use Cases: Depend on the abstract Repository interface
  sl.registerLazySingleton(
    () => GetProductsUseCase(productRepository: sl<ProductRepository>()),
  );

  // STEP 4: Blocs / ViewModels (Presentation Layer)

  // Blocs: Registered as factory so states are cleanly recreated upon screen re-entry
  sl.registerFactory(
    () => ProductBloc(getProductsUseCase: sl<GetProductsUseCase>()),
  );
}
