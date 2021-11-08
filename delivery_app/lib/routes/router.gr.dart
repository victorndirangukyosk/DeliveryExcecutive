// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;

import '../user_interfaces/home/main_home_page.dart' as _i3;
import '../user_interfaces/splash_screen/splash_screen.dart' as _i1;
import '../user_interfaces/user_interfaces.dart' as _i2;

class AppRouter extends _i4.RootStackRouter {
  AppRouter([_i5.GlobalKey<_i5.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    SplashScreen.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.SplashScreen());
    },
    LoginRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.LoginPage());
    },
    RegisterRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.RegisterPage());
    },
    MainHomeRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.MainHomePage());
    }
  };

  @override
  List<_i4.RouteConfig> get routes => [
        _i4.RouteConfig(SplashScreen.name, path: '/'),
        _i4.RouteConfig(LoginRoute.name, path: '/login-page'),
        _i4.RouteConfig(RegisterRoute.name, path: '/register-page'),
        _i4.RouteConfig(MainHomeRoute.name, path: '/main-home-page')
      ];
}

/// generated route for [_i1.SplashScreen]
class SplashScreen extends _i4.PageRouteInfo<void> {
  const SplashScreen() : super(name, path: '/');

  static const String name = 'SplashScreen';
}

/// generated route for [_i2.LoginPage]
class LoginRoute extends _i4.PageRouteInfo<void> {
  const LoginRoute() : super(name, path: '/login-page');

  static const String name = 'LoginRoute';
}

/// generated route for [_i2.RegisterPage]
class RegisterRoute extends _i4.PageRouteInfo<void> {
  const RegisterRoute() : super(name, path: '/register-page');

  static const String name = 'RegisterRoute';
}

/// generated route for [_i3.MainHomePage]
class MainHomeRoute extends _i4.PageRouteInfo<void> {
  const MainHomeRoute() : super(name, path: '/main-home-page');

  static const String name = 'MainHomeRoute';
}
