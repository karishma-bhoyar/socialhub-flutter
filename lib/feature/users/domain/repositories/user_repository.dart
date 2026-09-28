import 'package:flutter_application_socialhub/feature/users/domain/entities/user_entity.dart';

abstract class UserRepository {
  Future<List<UserEntity>> getUsers();
}
