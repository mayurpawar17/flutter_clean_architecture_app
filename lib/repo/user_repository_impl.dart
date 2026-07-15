import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/user_model.dart';
import 'user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final http.Client client;

  // Passing the HTTP client via constructor makes this class highly testable!
  UserRepositoryImpl({required this.client});

  @override
  Future<List<UserModel>> fetchUsers() async {
    final url = Uri.parse('https://jsonplaceholder.typicode.com/users');

    try {
      final response = await client.get(url);

      if (response.statusCode == 200) {
        final List<dynamic> jsonList = json.decode(response.body);
        return jsonList.map((json) => UserModel.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load users: Server responded with status ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Network error occurred: $e');
    }
  }
}