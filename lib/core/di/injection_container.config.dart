// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/product/data/remoteDataSource/product_remote_data_source.dart'
    as _i123;
import '../../features/product/data/remoteDataSource/product_remote_data_source_impl.dart'
    as _i533;
import '../../features/product/data/repo/product_repository_imp.dart' as _i985;
import '../../features/product/domain/repo/product_repository.dart' as _i447;
import '../../features/product/domain/usecases/get_products_use_case.dart'
    as _i936;
import '../../features/product/presentation/bloc/product_bloc.dart' as _i415;
import '../network/api_client.dart' as _i557;
import 'register_external_dependencies.dart' as _i339;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final registerExternalDependencies = _$RegisterExternalDependencies();
    gh.lazySingleton<_i557.ApiClient>(
      () => registerExternalDependencies.apiClient,
    );
    gh.lazySingleton<_i123.ProductRemoteDataSource>(
      () => _i533.ProductRemoteDataSourceImpl(apiClient: gh<_i557.ApiClient>()),
    );
    gh.lazySingleton<_i447.ProductRepository>(
      () => _i985.ProductRepositoryImp(
        productRemoteDataSource: gh<_i123.ProductRemoteDataSource>(),
      ),
    );
    gh.lazySingleton<_i936.GetProductsUseCase>(
      () => _i936.GetProductsUseCase(
        productRepository: gh<_i447.ProductRepository>(),
      ),
    );
    gh.factory<_i415.ProductBloc>(
      () =>
          _i415.ProductBloc(getProductsUseCase: gh<_i936.GetProductsUseCase>()),
    );
    return this;
  }
}

class _$RegisterExternalDependencies
    extends _i339.RegisterExternalDependencies {}
