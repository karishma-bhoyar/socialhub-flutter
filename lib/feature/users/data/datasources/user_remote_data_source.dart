import 'package:flutter_application_socialhub/core/network/api_client.dart';
import 'package:flutter_application_socialhub/core/network/api_endpoint.dart';
import 'package:flutter_application_socialhub/feature/users/data/models/user_model.dart';

class UserRemoteDataSource {
  final ApiClient apiClient;

  UserRemoteDataSource({required this.apiClient});

  Future<List<UserModel>> getUsers() async {
    final response = await apiClient.get<List<dynamic>>(ApiEndpoint.users);
    final data = response.data ?? [];
    return data
        .map((json) => UserModel.fromJson(json as Map<String, dynamic>))
        .toList();
  }
}
