// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i10;
import 'package:flutter/material.dart' as _i11;

import '../user_interfaces/authentication_screens/reset_password_page.dart'
    as _i8;
import '../user_interfaces/delivery/customer_verification.dart' as _i6;
import '../user_interfaces/delivery/directions_to_address/directions_to_address.dart'
    as _i7;
import '../user_interfaces/delivery/ready_for_delivery.dart' as _i5;
import '../user_interfaces/home/main_home_page.dart' as _i3;
import '../user_interfaces/packing/my_orders_packing_person/order_details_page.dart'
    as _i9;
import '../user_interfaces/packing/my_orders_packing_person/single_order_page.dart'
    as _i4;
import '../user_interfaces/splash_screen/splash_screen.dart' as _i1;
import '../user_interfaces/user_interfaces.dart' as _i2;

class AppRouter extends _i10.RootStackRouter {
  AppRouter([_i11.GlobalKey<_i11.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i10.PageFactory> pagesMap = {
    SplashScreen.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.SplashScreen());
    },
    LoginRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.LoginPage());
    },
    RegisterRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.RegisterPage());
    },
    MainHomeRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.MainHomePage());
    },
    SingleOrderRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.SingleOrderPage());
    },
    ReadyForDelivery.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.ReadyForDelivery());
    },
    CustomerVerification.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.CustomerVerification());
    },
    DirectionsToAddress.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i7.DirectionsToAddress());
    },
    ResetPasswordRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i8.ResetPasswordPage());
    },
    OrderDetailsRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i9.OrderDetailsPage());
    }
  };

  @override
  List<_i10.RouteConfig> get routes => [
        _i10.RouteConfig(SplashScreen.name, path: '/'),
        _i10.RouteConfig(LoginRoute.name, path: '/login-page'),
        _i10.RouteConfig(RegisterRoute.name, path: '/register-page'),
        _i10.RouteConfig(MainHomeRoute.name, path: '/main-home-page'),
        _i10.RouteConfig(SingleOrderRoute.name, path: '/single-order-page'),
        _i10.RouteConfig(ReadyForDelivery.name, path: '/ready-for-delivery'),
        _i10.RouteConfig(CustomerVerification.name,
            path: '/customer-verification'),
        _i10.RouteConfig(DirectionsToAddress.name,
            path: '/directions-to-address'),
        _i10.RouteConfig(ResetPasswordRoute.name, path: '/reset-password-page'),
        _i10.RouteConfig(OrderDetailsRoute.name, path: '/order-details-page')
      ];
}

/// generated route for
/// [_i1.SplashScreen]
class SplashScreen extends _i10.PageRouteInfo<void> {
  const SplashScreen() : super(SplashScreen.name, path: '/');

  static const String name = 'SplashScreen';
}

/// generated route for
/// [_i2.LoginPage]
class LoginRoute extends _i10.PageRouteInfo<void> {
  const LoginRoute() : super(LoginRoute.name, path: '/login-page');

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i2.RegisterPage]
class RegisterRoute extends _i10.PageRouteInfo<void> {
  const RegisterRoute() : super(RegisterRoute.name, path: '/register-page');

  static const String name = 'RegisterRoute';
}

/// generated route for
/// [_i3.MainHomePage]
class MainHomeRoute extends _i10.PageRouteInfo<void> {
  const MainHomeRoute() : super(MainHomeRoute.name, path: '/main-home-page');

  static const String name = 'MainHomeRoute';
}

/// generated route for
/// [_i4.SingleOrderPage]
class SingleOrderRoute extends _i10.PageRouteInfo<void> {
  const SingleOrderRoute()
      : super(SingleOrderRoute.name, path: '/single-order-page');

  static const String name = 'SingleOrderRoute';
}

/// generated route for
/// [_i5.ReadyForDelivery]
class ReadyForDelivery extends _i10.PageRouteInfo<void> {
  const ReadyForDelivery()
      : super(ReadyForDelivery.name, path: '/ready-for-delivery');

  static const String name = 'ReadyForDelivery';
}

/// generated route for
/// [_i6.CustomerVerification]
class CustomerVerification extends _i10.PageRouteInfo<void> {
  const CustomerVerification()
      : super(CustomerVerification.name, path: '/customer-verification');

  static const String name = 'CustomerVerification';
}

/// generated route for
/// [_i7.DirectionsToAddress]
class DirectionsToAddress extends _i10.PageRouteInfo<void> {
  const DirectionsToAddress()
      : super(DirectionsToAddress.name, path: '/directions-to-address');

  static const String name = 'DirectionsToAddress';
}

/// generated route for
/// [_i8.ResetPasswordPage]
class ResetPasswordRoute extends _i10.PageRouteInfo<void> {
  const ResetPasswordRoute()
      : super(ResetPasswordRoute.name, path: '/reset-password-page');

  static const String name = 'ResetPasswordRoute';
}

/// generated route for
/// [_i9.OrderDetailsPage]
class OrderDetailsRoute extends _i10.PageRouteInfo<void> {
  const OrderDetailsRoute()
      : super(OrderDetailsRoute.name, path: '/order-details-page');

  static const String name = 'OrderDetailsRoute';
}
