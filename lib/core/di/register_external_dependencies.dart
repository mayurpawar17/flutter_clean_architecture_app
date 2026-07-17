import 'package:clean_architecture_app/core/network/api_client.dart';
import 'package:injectable/injectable.dart';

@module
abstract class RegisterExternalDependencies {

  // Registers ApiClient (Dio) as a LazySingleton in GetIt
  @lazySingleton
  ApiClient get apiClient => ApiClient();
}