import 'package:auto_route/auto_route.dart';
import 'package:delivery_app/user_interfaces/splash_screen/splash_screen.dart';
import 'package:delivery_app/user_interfaces/user_interfaces.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: SplashScreen, initial: true),
    AutoRoute(page: LoginPage),
    AutoRoute(page: RegisterPage),
  ],
)
class $AppRouter {}
