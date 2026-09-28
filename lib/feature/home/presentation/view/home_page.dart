import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_socialhub/app/di/injection.dart';
import 'package:flutter_application_socialhub/app/router/app_router.dart';
import 'package:flutter_application_socialhub/core/constants/app_enums.dart';
import 'package:flutter_application_socialhub/core/state/app_state.dart';
import 'package:flutter_application_socialhub/feature/auth/domain/entities/auth_user_entity.dart';
import 'package:flutter_application_socialhub/feature/auth/presentation/viewmodel/auth_cubit.dart';
import 'package:flutter_application_socialhub/feature/home/presentation/widgets/home_header.dart';
import 'package:flutter_application_socialhub/feature/home/presentation/widgets/post_filter.dart';
import 'package:flutter_application_socialhub/feature/posts/domain/entities/post_entity.dart';
import 'package:flutter_application_socialhub/feature/posts/presentation/viewmodel/post_cubit.dart';
import 'package:flutter_application_socialhub/feature/posts/presentation/widgets/post_card.dart';
import 'package:flutter_application_socialhub/feature/users/domain/entities/user_entity.dart';
import 'package:flutter_application_socialhub/feature/users/presentation/viewmodel/user_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedFilterIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => sl<PostCubit>()..getPosts()),
        BlocProvider<UserCubit>(create: (_) => sl<UserCubit>()..getUsers()),
      ],
      child: BlocListener<AuthCubit, AppState<AuthUserEntity>>(
        listener: (context, state) {
          if (state.status == AppStatus.initial) {
            context.router.replace(const LoginRoute());
          }
          if (state.status == AppStatus.failure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.errorMessage ?? 'Logout failed')),
            );
          }
        },
        child: Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  const HomeHeader(),
                  const SizedBox(height: 20),
                  PostFilter(
                    selectedIndex: selectedFilterIndex,
                    onChanged: (int value) {
                      setState(() {
                        selectedFilterIndex = value;
                      });
                    },
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: BlocBuilder<UserCubit, AppState<List<UserEntity>>>(
                      builder: (context, userState) {
                        if (userState.status == AppStatus.loading) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        if (userState.status == AppStatus.failure) {
                          return Center(
                            child: Text(
                              userState.errorMessage ?? ' something went wrong',
                            ),
                          );
                        }
                        if (userState.status == AppStatus.success) {
                          final users = userState.data ?? [];
                          return BlocBuilder<
                            PostCubit,
                            AppState<List<PostEntity>>
                          >(
                            builder: (context, postState) {
                              if (postState.status == AppStatus.loading) {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                              if (postState.status == AppStatus.failure) {
                                return Center(
                                  child: Text(
                                    postState.errorMessage ??
                                        'failed to load pots',
                                  ),
                                );
                              }
                              if (postState.status == AppStatus.success) {
                                final post = postState.data ?? [];
                                return ListView.separated(
                                  separatorBuilder: (_, _) =>
                                      const SizedBox(height: 12),
                                  itemCount: post.length,
                                  itemBuilder: (context, index) {
                                    final posts = post[index];
                                    final matchingUsers = users.where(
                                      (user) => user.id == posts.userId,
                                    );
                                    if (matchingUsers.isEmpty) {
                                      return const SizedBox.shrink();
                                    }
                                    final user = matchingUsers.first;
                                    return PostCard(post: posts, user: user);
                                  },
                                );
                              }
                              return SizedBox.shrink();
                            },
                          );
                        }
                        return const SizedBox.shrink();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
