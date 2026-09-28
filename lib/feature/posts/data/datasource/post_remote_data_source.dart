import 'package:flutter_application_socialhub/core/network/api_client.dart';
import 'package:flutter_application_socialhub/core/network/api_endpoint.dart';
import 'package:flutter_application_socialhub/feature/posts/data/models/post_model.dart';

class PostRemoteDataSource {
  final ApiClient apiClient;
  PostRemoteDataSource({required this.apiClient});
  Future<List<PostModel>> getPost() async {
    final response = await apiClient.get<List<dynamic>>(ApiEndpoint.posts);
    final data = response.data ?? [];
    return data.map((json) {
      return PostModel.fromJson(json as Map<String, dynamic>);
    }).toList();
  }
}
