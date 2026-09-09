import 'package:flutter_application_socialhub/core/state/app_state.dart';
import 'package:flutter_application_socialhub/feature/auth/domain/entities/auth_user_entity.dart';
import 'package:flutter_application_socialhub/feature/auth/domain/repositories/auth_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AppState<AuthUserEntity>> {
  final AuthRepository authRepository;
  AuthCubit({required this.authRepository}) : super(const AppState.initial());
  Future<void> login({required String email, required String password}) async {
    emit(const AppState.loading());
    try {
      final user = await authRepository.login(email: email, password: password);
      emit(AppState.success(user));
    } catch (e) {
      emit(AppState.failure(e.toString()));
    }
  }

  Future<void> signUp({required String email, required String password}) async {
    emit(const AppState.loading());
    try {
      final user = await authRepository.signUp(
        email: email,
        password: password,
      );
      emit(AppState.success(user));
    } catch (e) {
      emit(AppState.failure(e.toString()));
    }
  }

  Future<void> logout() async {
    emit(const AppState.loading());
    try {
      await authRepository.logout();
      emit(AppState.initial());
    } catch (e) {
      emit(AppState.failure(e.toString()));
    }
  }
}
