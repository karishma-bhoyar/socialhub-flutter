import 'package:auto_route/auto_route.dart';
import 'package:flutter_application_socialhub/feature/auth/presentation/view/login_page.dart';
import 'package:flutter_application_socialhub/feature/home/presentation/view/home_page.dart';
import 'package:flutter_application_socialhub/feature/users/presentation/view/users_page.dart';
part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: LoginRoute.page, initial: true),
    AutoRoute(page: HomeRoute.page),
    AutoRoute(page: UsersRoute.page),
  ];
}
