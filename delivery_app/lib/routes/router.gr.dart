// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i8;
import 'package:flutter/material.dart' as _i9;

import '../user_interfaces/delivery/customer_verification.dart' as _i6;
import '../user_interfaces/delivery/directions_to_address/directions_to_address.dart'
    as _i7;
import '../user_interfaces/delivery/ready_for_delivery.dart' as _i5;
import '../user_interfaces/home/main_home_page.dart' as _i3;
import '../user_interfaces/my_orders/single_order_page.dart' as _i4;
import '../user_interfaces/splash_screen/splash_screen.dart' as _i1;
import '../user_interfaces/user_interfaces.dart' as _i2;

class AppRouter extends _i8.RootStackRouter {
  AppRouter([_i9.GlobalKey<_i9.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i8.PageFactory> pagesMap = {
    SplashScreen.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.SplashScreen());
    },
    LoginRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.LoginPage());
    },
    RegisterRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.RegisterPage());
    },
    MainHomeRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.MainHomePage());
    },
    SingleOrderRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.SingleOrderPage());
    },
    ReadyForDelivery.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.ReadyForDelivery());
    },
    CustomerVerification.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.CustomerVerification());
    },
    DirectionsToAddress.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i7.DirectionsToAddress());
    }
  };

  @override
  List<_i8.RouteConfig> get routes => [
        _i8.RouteConfig(SplashScreen.name, path: '/'),
        _i8.RouteConfig(LoginRoute.name, path: '/login-page'),
        _i8.RouteConfig(RegisterRoute.name, path: '/register-page'),
        _i8.RouteConfig(MainHomeRoute.name, path: '/main-home-page'),
        _i8.RouteConfig(SingleOrderRoute.name, path: '/single-order-page'),
        _i8.RouteConfig(ReadyForDelivery.name, path: '/ready-for-delivery'),
        _i8.RouteConfig(CustomerVerification.name,
            path: '/customer-verification'),
        _i8.RouteConfig(DirectionsToAddress.name,
            path: '/directions-to-address')
      ];
}

/// generated route for [_i1.SplashScreen]
class SplashScreen extends _i8.PageRouteInfo<void> {
  const SplashScreen() : super(name, path: '/');

  static const String name = 'SplashScreen';
}

/// generated route for [_i2.LoginPage]
class LoginRoute extends _i8.PageRouteInfo<void> {
  const LoginRoute() : super(name, path: '/login-page');

  static const String name = 'LoginRoute';
}

/// generated route for [_i2.RegisterPage]
class RegisterRoute extends _i8.PageRouteInfo<void> {
  const RegisterRoute() : super(name, path: '/register-page');

  static const String name = 'RegisterRoute';
}

/// generated route for [_i3.MainHomePage]
class MainHomeRoute extends _i8.PageRouteInfo<void> {
  const MainHomeRoute() : super(name, path: '/main-home-page');

  static const String name = 'MainHomeRoute';
}

/// generated route for [_i4.SingleOrderPage]
class SingleOrderRoute extends _i8.PageRouteInfo<void> {
  const SingleOrderRoute() : super(name, path: '/single-order-page');

  static const String name = 'SingleOrderRoute';
}

/// generated route for [_i5.ReadyForDelivery]
class ReadyForDelivery extends _i8.PageRouteInfo<void> {
  const ReadyForDelivery() : super(name, path: '/ready-for-delivery');

  static const String name = 'ReadyForDelivery';
}

/// generated route for [_i6.CustomerVerification]
class CustomerVerification extends _i8.PageRouteInfo<void> {
  const CustomerVerification() : super(name, path: '/customer-verification');

  static const String name = 'CustomerVerification';
}

/// generated route for [_i7.DirectionsToAddress]
class DirectionsToAddress extends _i8.PageRouteInfo<void> {
  const DirectionsToAddress() : super(name, path: '/directions-to-address');

  static const String name = 'DirectionsToAddress';
}
