// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i12;
import 'package:flutter/cupertino.dart' as _i14;
import 'package:flutter/material.dart' as _i13;

import '../user_interfaces/authentication_screens/reset_password_page.dart'
    as _i9;
import '../user_interfaces/delivery/customer_verification.dart' as _i7;
import '../user_interfaces/delivery/directions_to_address/directions_to_address.dart'
    as _i8;
import '../user_interfaces/delivery/main_home_delivery_executive_page.dart'
    as _i4;
import '../user_interfaces/delivery/ready_for_delivery.dart' as _i6;
import '../user_interfaces/home/main_home_page.dart' as _i3;
import '../user_interfaces/packing/my_orders_packing_person/order_details_page.dart'
    as _i10;
import '../user_interfaces/packing/my_orders_packing_person/single_order_page.dart'
    as _i5;
import '../user_interfaces/packing/scanner/crates_page.dart' as _i11;
import '../user_interfaces/splash_screen/splash_screen.dart' as _i1;
import '../user_interfaces/user_interfaces.dart' as _i2;

class AppRouter extends _i12.RootStackRouter {
  AppRouter([_i13.GlobalKey<_i13.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i12.PageFactory> pagesMap = {
    SplashScreen.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.SplashScreen());
    },
    LoginRoute.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.LoginPage());
    },
    RegisterRoute.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.RegisterPage());
    },
    MainHomeRoute.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.MainHomePage());
    },
    MainHomeDeliveryExecutiveRoute.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
          routeData: routeData,
          child: const _i4.MainHomeDeliveryExecutivePage());
    },
    SingleOrderRoute.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.SingleOrderPage());
    },
    ReadyForDelivery.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.ReadyForDelivery());
    },
    CustomerVerification.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i7.CustomerVerification());
    },
    DirectionsToAddress.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i8.DirectionsToAddress());
    },
    ResetPasswordRoute.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i9.ResetPasswordPage());
    },
    OrderDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<OrderDetailsRouteArgs>();
      return _i12.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i10.OrderDetailsPage(key: args.key, orderId: args.orderId));
    },
    CratesRoute.name: (routeData) {
      final args = routeData.argsAs<CratesRouteArgs>();
      return _i12.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i11.CratesPage(key: args.key, orderId: args.orderId));
    }
  };

  @override
  List<_i12.RouteConfig> get routes => [
        _i12.RouteConfig(SplashScreen.name, path: '/'),
        _i12.RouteConfig(LoginRoute.name, path: '/login-page'),
        _i12.RouteConfig(RegisterRoute.name, path: '/register-page'),
        _i12.RouteConfig(MainHomeRoute.name, path: '/main-home-page'),
        _i12.RouteConfig(MainHomeDeliveryExecutiveRoute.name,
            path: '/main-home-delivery-executive-page'),
        _i12.RouteConfig(SingleOrderRoute.name, path: '/single-order-page'),
        _i12.RouteConfig(ReadyForDelivery.name, path: '/ready-for-delivery'),
        _i12.RouteConfig(CustomerVerification.name,
            path: '/customer-verification'),
        _i12.RouteConfig(DirectionsToAddress.name,
            path: '/directions-to-address'),
        _i12.RouteConfig(ResetPasswordRoute.name, path: '/reset-password-page'),
        _i12.RouteConfig(OrderDetailsRoute.name, path: '/order-details-page'),
        _i12.RouteConfig(CratesRoute.name, path: '/crates-page')
      ];
}

/// generated route for
/// [_i1.SplashScreen]
class SplashScreen extends _i12.PageRouteInfo<void> {
  const SplashScreen() : super(SplashScreen.name, path: '/');

  static const String name = 'SplashScreen';
}

/// generated route for
/// [_i2.LoginPage]
class LoginRoute extends _i12.PageRouteInfo<void> {
  const LoginRoute() : super(LoginRoute.name, path: '/login-page');

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i2.RegisterPage]
class RegisterRoute extends _i12.PageRouteInfo<void> {
  const RegisterRoute() : super(RegisterRoute.name, path: '/register-page');

  static const String name = 'RegisterRoute';
}

/// generated route for
/// [_i3.MainHomePage]
class MainHomeRoute extends _i12.PageRouteInfo<void> {
  const MainHomeRoute() : super(MainHomeRoute.name, path: '/main-home-page');

  static const String name = 'MainHomeRoute';
}

/// generated route for
/// [_i4.MainHomeDeliveryExecutivePage]
class MainHomeDeliveryExecutiveRoute extends _i12.PageRouteInfo<void> {
  const MainHomeDeliveryExecutiveRoute()
      : super(MainHomeDeliveryExecutiveRoute.name,
            path: '/main-home-delivery-executive-page');

  static const String name = 'MainHomeDeliveryExecutiveRoute';
}

/// generated route for
/// [_i5.SingleOrderPage]
class SingleOrderRoute extends _i12.PageRouteInfo<void> {
  const SingleOrderRoute()
      : super(SingleOrderRoute.name, path: '/single-order-page');

  static const String name = 'SingleOrderRoute';
}

/// generated route for
/// [_i6.ReadyForDelivery]
class ReadyForDelivery extends _i12.PageRouteInfo<void> {
  const ReadyForDelivery()
      : super(ReadyForDelivery.name, path: '/ready-for-delivery');

  static const String name = 'ReadyForDelivery';
}

/// generated route for
/// [_i7.CustomerVerification]
class CustomerVerification extends _i12.PageRouteInfo<void> {
  const CustomerVerification()
      : super(CustomerVerification.name, path: '/customer-verification');

  static const String name = 'CustomerVerification';
}

/// generated route for
/// [_i8.DirectionsToAddress]
class DirectionsToAddress extends _i12.PageRouteInfo<void> {
  const DirectionsToAddress()
      : super(DirectionsToAddress.name, path: '/directions-to-address');

  static const String name = 'DirectionsToAddress';
}

/// generated route for
/// [_i9.ResetPasswordPage]
class ResetPasswordRoute extends _i12.PageRouteInfo<void> {
  const ResetPasswordRoute()
      : super(ResetPasswordRoute.name, path: '/reset-password-page');

  static const String name = 'ResetPasswordRoute';
}

/// generated route for
/// [_i10.OrderDetailsPage]
class OrderDetailsRoute extends _i12.PageRouteInfo<OrderDetailsRouteArgs> {
  OrderDetailsRoute({_i14.Key? key, required int orderId})
      : super(OrderDetailsRoute.name,
            path: '/order-details-page',
            args: OrderDetailsRouteArgs(key: key, orderId: orderId));

  static const String name = 'OrderDetailsRoute';
}

class OrderDetailsRouteArgs {
  const OrderDetailsRouteArgs({this.key, required this.orderId});

  final _i14.Key? key;

  final int orderId;

  @override
  String toString() {
    return 'OrderDetailsRouteArgs{key: $key, orderId: $orderId}';
  }
}

/// generated route for
/// [_i11.CratesPage]
class CratesRoute extends _i12.PageRouteInfo<CratesRouteArgs> {
  CratesRoute({_i14.Key? key, required int orderId})
      : super(CratesRoute.name,
            path: '/crates-page',
            args: CratesRouteArgs(key: key, orderId: orderId));

  static const String name = 'CratesRoute';
}

class CratesRouteArgs {
  const CratesRouteArgs({this.key, required this.orderId});

  final _i14.Key? key;

  final int orderId;

  @override
  String toString() {
    return 'CratesRouteArgs{key: $key, orderId: $orderId}';
  }
}
