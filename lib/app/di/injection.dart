import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_socialhub/core/network/api_client.dart';
import 'package:flutter_application_socialhub/core/network/dio_client.dart';
import 'package:flutter_application_socialhub/feature/auth/data/datasources/firebase_auth_service.dart';
import 'package:flutter_application_socialhub/feature/auth/data/repositories/auth_repository_impl.dart';
import 'package:flutter_application_socialhub/feature/auth/domain/repositories/auth_repository.dart';
import 'package:flutter_application_socialhub/feature/auth/presentation/viewmodel/auth_cubit.dart';
import 'package:flutter_application_socialhub/feature/posts/data/datasource/post_remote_data_source.dart';
import 'package:flutter_application_socialhub/feature/posts/data/repositories/post_repository_impl.dart';
import 'package:flutter_application_socialhub/feature/posts/domain/repositories/post_repository.dart';
import 'package:flutter_application_socialhub/feature/posts/presentation/viewmodel/post_cubit.dart';
import 'package:flutter_application_socialhub/feature/users/data/datasources/user_remote_data_source.dart';
import 'package:flutter_application_socialhub/feature/users/data/repositories/user_repository_impl.dart';
import 'package:flutter_application_socialhub/feature/users/domain/repositories/user_repository.dart';
import 'package:flutter_application_socialhub/feature/users/presentation/viewmodel/user_cubit.dart';
import 'package:get_it/get_it.dart';

final GetIt sl = GetIt.instance;
Future<void> setupDependencies() async {
  //network
  sl.registerLazySingleton<DioClient>(() => DioClient());
  sl.registerLazySingleton<ApiClient>(
    () => ApiClient(dio: sl<DioClient>().dio),
  );
  //posts datasource
  sl.registerLazySingleton<PostRemoteDataSource>(
    () => PostRemoteDataSource(apiClient: sl<ApiClient>()),
  );
  //post repository
  sl.registerLazySingleton<PostRepository>(
    () => PostRepositoryImpl(remoteDataSource: sl<PostRemoteDataSource>()),
  );
  //cubit
  sl.registerFactory<PostCubit>(
    () => PostCubit(postRepository: sl<PostRepository>()),
  );
  //user datasource
  sl.registerLazySingleton<UserRemoteDataSource>(
    () => UserRemoteDataSource(apiClient: sl<ApiClient>()),
  );
  //user repository
  sl.registerLazySingleton<UserRepository>(
    () => UserRepositoryImpl(userRemoteDataSource: sl<UserRemoteDataSource>()),
  );
  //user cubit
  sl.registerFactory<UserCubit>(
    () => UserCubit(userRepository: sl<UserRepository>()),
  );
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
