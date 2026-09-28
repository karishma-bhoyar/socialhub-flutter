import 'package:flutter_application_socialhub/core/state/app_state.dart';
import 'package:flutter_application_socialhub/feature/posts/domain/entities/post_entity.dart';
import 'package:flutter_application_socialhub/feature/posts/domain/repositories/post_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostCubit extends Cubit<AppState<List<PostEntity>>> {
  final PostRepository postRepository;

  PostCubit({required this.postRepository}) : super(AppState.initial());
  Future<void> getPosts() async {
    emit(AppState.loading());
    try {
      final posts = await postRepository.getPosts();
      emit(AppState.success(posts));
    } catch (e) {
      emit(AppState.failure(e.toString()));
    }
  }
}
