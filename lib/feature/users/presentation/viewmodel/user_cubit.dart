import 'package:flutter_application_socialhub/core/state/app_state.dart';
import 'package:flutter_application_socialhub/feature/users/domain/entities/user_entity.dart';
import 'package:flutter_application_socialhub/feature/users/domain/repositories/user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserCubit extends Cubit<AppState<List<UserEntity>>> {
  final UserRepository userRepository;
  UserCubit({required this.userRepository}) : super(AppState.initial());
  Future<void> getUsers() async {
    emit(const AppState.loading());
    try {
      final users = await userRepository.getUsers();
      emit(AppState.success(users));
    } catch (e) {
      emit(AppState.failure(e.toString()));
    }
  }
}
