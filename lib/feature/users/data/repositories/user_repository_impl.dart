import 'package:flutter_application_socialhub/feature/users/data/datasources/user_remote_data_source.dart';
import 'package:flutter_application_socialhub/feature/users/domain/entities/user_entity.dart';
import 'package:flutter_application_socialhub/feature/users/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource userRemoteDataSource;

  UserRepositoryImpl({required this.userRemoteDataSource});
  @override
  Future<List<UserEntity>> getUsers() async {
    return await userRemoteDataSource.getUsers();
  }
}
