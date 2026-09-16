import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_socialhub/app/router/app_router.dart';
import 'package:flutter_application_socialhub/core/constants/app_enums.dart';
import 'package:flutter_application_socialhub/core/state/app_state.dart';
import 'package:flutter_application_socialhub/feature/auth/domain/entities/auth_user_entity.dart';
import 'package:flutter_application_socialhub/feature/auth/presentation/viewmodel/auth_cubit.dart';
import 'package:flutter_application_socialhub/feature/home/presentation/widgets/home_header.dart';
import 'package:flutter_application_socialhub/feature/home/presentation/widgets/post_filter.dart';
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
    return BlocListener<AuthCubit, AppState<AuthUserEntity>>(
      listener: (context, state) {
        if (state.status == AppStatus.initial) {
          context.router.replace(LoginRoute());
        }
        if (state.status == AppStatus.failure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.errorMessage ?? 'Logout failed')),
          );
        }
      },
      child: Scaffold(
        // appBar: AppBar(
        //   title: Text('SocialHub'),
        //   actions: [
        //     IconButton(
        //       onPressed: () {
        //         context.read<AuthCubit>().logout();
        //       },
        //       icon: Icon(Icons.logout),
        //     ),
        //   ],
        // ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                HomeHeader(),
                SizedBox(height: 20),
                PostFilter(
                  selectedIndex: selectedFilterIndex,
                  onChanged: (int value) {
                    setState(() {
                      selectedFilterIndex = value;
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
