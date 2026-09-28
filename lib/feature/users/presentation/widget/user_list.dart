import 'package:flutter/widgets.dart';
import 'package:flutter_application_socialhub/feature/users/domain/entities/user_entity.dart';
import 'package:flutter_application_socialhub/feature/users/presentation/widget/user_card.dart';

class UserList extends StatelessWidget {
  final List<UserEntity> users;
  const UserList({super.key, required this.users});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(16),
      itemCount: users.length,
      itemBuilder: (context, index) {
        final user = users[index];
        return UserCard(user: user);
      },
    );
  }
}
