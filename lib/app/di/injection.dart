import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_socialhub/feature/auth/data/datasources/firebase_auth_service.dart';
import 'package:flutter_application_socialhub/feature/auth/data/repositories/auth_repository_impl.dart';
import 'package:flutter_application_socialhub/feature/auth/domain/repositories/auth_repository.dart';
import 'package:flutter_application_socialhub/feature/auth/presentation/viewmodel/auth_cubit.dart';
import 'package:get_it/get_it.dart';

final GetIt sl = GetIt.instance;
Future<void> setupDependencies() async {
  //firebase
  sl.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);
  //datasource
  sl.registerLazySingleton<FirebaseAuthService>(
    () => FirebaseAuthService(firebaseAuth: sl<FirebaseAuth>()),
  );
  // repository
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(authService: sl<FirebaseAuthService>()),
  );
  //cubit
  sl.registerFactory<AuthCubit>(
    () => AuthCubit(authRepository: sl<AuthRepository>()),
  );
}
