import 'package:flutter_application_socialhub/feature/auth/domain/entities/auth_user_entity.dart';
//this an interface class

abstract class AuthRepository {
  Future<AuthUserEntity> login({
    required String email,
    required String password,
  });
  Future<AuthUserEntity> signUp({
    required String email,
    required String password,
  });
  Future<void> logout();
  AuthUserEntity? get currentUser;
}
