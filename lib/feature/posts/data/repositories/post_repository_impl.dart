import 'package:flutter_application_socialhub/feature/posts/data/datasource/post_remote_data_source.dart';
import 'package:flutter_application_socialhub/feature/posts/domain/entities/post_entity.dart';
import 'package:flutter_application_socialhub/feature/posts/domain/repositories/post_repository.dart';

class PostRepositoryImpl implements PostRepository {
  final PostRemoteDataSource remoteDataSource;

  PostRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<PostEntity>> getPosts() async {
    return await remoteDataSource.getPost();
  }
}
