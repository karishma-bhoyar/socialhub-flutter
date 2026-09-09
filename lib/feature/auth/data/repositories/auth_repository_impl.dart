import 'package:flutter_application_socialhub/feature/auth/data/datasources/firebase_auth_service.dart';
import 'package:flutter_application_socialhub/feature/auth/domain/entities/auth_user_entity.dart';
import 'package:flutter_application_socialhub/feature/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final FirebaseAuthService authService;

  AuthRepositoryImpl({required this.authService});
  @override
  AuthUserEntity? get currentUser {
    final user = authService.currentUser;
    if (user == null) {
      return null;
    }
    return AuthUserEntity(
      uid: user.uid,
      email: user.email,
      displayName: user.displayName,
    );
  }

  @override
  Future<AuthUserEntity> login({
    required String email,
    required String password,
  }) async {
    final credential = await authService.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    final user = credential.user!;
    return AuthUserEntity(
      uid: user.uid,
      email: user.email,
      displayName: user.displayName,
    );
  }

  @override
  Future<void> logout() async {
    await authService.signOut();
  }

  @override
  Future<AuthUserEntity> signUp({
    required String email,
    required String password,
  }) async {
    final credential = await authService.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    final user = credential.user!;
    return AuthUserEntity(
      uid: user.uid,
      email: user.email,
      displayName: user.displayName,
    );
  }
}
