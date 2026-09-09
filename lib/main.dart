import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_socialhub/app/di/injection.dart';
import 'package:flutter_application_socialhub/app/router/app_router.dart';
import 'package:flutter_application_socialhub/core/theme/app_theme.dart';
import 'package:flutter_application_socialhub/feature/auth/presentation/viewmodel/auth_cubit.dart';
import 'package:flutter_application_socialhub/firebase_options.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await setupDependencies();

  final appRouter = AppRouter();

  runApp(
    MultiBlocProvider(
      providers: [BlocProvider<AuthCubit>(create: (_) => sl<AuthCubit>())],
      child: MyApp(appRouter: appRouter),
    ),
  );
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;
  const MyApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'SocialHub',
      theme: AppTheme.light,
      routerConfig: appRouter.config(),
    );
  }
}
