import 'package:clean_architecture_app/core/constants/api_constants.dart';
import 'package:clean_architecture_app/core/network/api_client.dart';
import 'package:clean_architecture_app/features/user/data/models/user_model.dart';

class UserRepository {
  final ApiClient _apiClient;

  UserRepository(this._apiClient);

  Future<List<UserModel>> fetchUsers() async {
    final response = await _apiClient.get(ApiConstants.usersEndpoint);

    final List<dynamic> userList = response.data;

    return userList.map((user) => UserModel.fromJson(user)).toList();
  }
}
