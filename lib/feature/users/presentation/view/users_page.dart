import 'package:flutter/material.dart';
import 'package:flutter_application_socialhub/app/di/injection.dart';
import 'package:flutter_application_socialhub/core/constants/app_enums.dart';
import 'package:flutter_application_socialhub/core/state/app_state.dart';
import 'package:flutter_application_socialhub/feature/users/domain/entities/user_entity.dart';
import 'package:flutter_application_socialhub/feature/users/presentation/viewmodel/user_cubit.dart';
import 'package:flutter_application_socialhub/feature/users/presentation/widget/user_list.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:auto_route/annotations.dart';

@RoutePage()
class UsersPage extends StatelessWidget {
  const UsersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<UserCubit>()..getUsers(),
      child: Scaffold(
        appBar: AppBar(title: Text('Users'), centerTitle: true),
        body: BlocBuilder<UserCubit, AppState<List<UserEntity>>>(
          builder: (context, state) {
            if (state.status == AppStatus.loading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state.status == AppStatus.failure) {
              return Center(
                child: Text(state.errorMessage ?? 'Something went wrong'),
              );
            }
            if (state.status == AppStatus.success) {
              return UserList(users: state.data ?? []);
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
