import 'package:flutter/material.dart';
import 'package:flutter_application_socialhub/app/router/app_router.dart';
import 'package:flutter_application_socialhub/core/theme/app_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  final appRouter = AppRouter();

  runApp(MyApp(appRouter: appRouter));
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
