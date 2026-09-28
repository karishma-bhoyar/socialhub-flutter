import 'package:flutter_application_socialhub/feature/posts/domain/entities/post_entity.dart';

abstract class PostRepository {
  Future<List<PostEntity>> getPosts();
}
