import 'package:auto_route/auto_route.dart';
import 'package:delivery_app/user_interfaces/splash_screen/splash_screen.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: SplashScreen, initial: true),
  ],
)
class $AppRouter {}
