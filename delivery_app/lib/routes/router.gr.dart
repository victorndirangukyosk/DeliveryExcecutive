// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i15;
import 'package:flutter/cupertino.dart' as _i17;
import 'package:flutter/material.dart' as _i16;

import '../user_interfaces/authentication_screens/reset_password_page.dart'
    as _i10;
import '../user_interfaces/delivery/customer_verification.dart' as _i8;
import '../user_interfaces/delivery/directions_to_address/directions_to_address.dart'
    as _i9;
import '../user_interfaces/delivery/invoice.dart' as _i14;
import '../user_interfaces/delivery/main_home_delivery_executive_page.dart'
    as _i5;
import '../user_interfaces/delivery/ready_for_delivery.dart' as _i7;
import '../user_interfaces/delivery/summary_page.dart' as _i11;
import '../user_interfaces/home/main_home_page.dart' as _i3;
import '../user_interfaces/packing/my_orders_packing_person/order_details_page.dart'
    as _i12;
import '../user_interfaces/packing/my_orders_packing_person/single_order_page.dart'
    as _i6;
import '../user_interfaces/packing/scanner/crates_page.dart' as _i13;
import '../user_interfaces/settings/settings_page.dart' as _i4;
import '../user_interfaces/splash_screen/splash_screen.dart' as _i1;
import '../user_interfaces/user_interfaces.dart' as _i2;

class AppRouter extends _i15.RootStackRouter {
  AppRouter([_i16.GlobalKey<_i16.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i15.PageFactory> pagesMap = {
    SplashScreen.name: (routeData) {
      return _i15.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.SplashScreen());
    },
    LoginRoute.name: (routeData) {
      return _i15.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.LoginPage());
    },
    RegisterRoute.name: (routeData) {
      return _i15.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.RegisterPage());
    },
    MainHomeRoute.name: (routeData) {
      return _i15.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.MainHomePage());
    },
    SettingsRoute.name: (routeData) {
      return _i15.MaterialPageX<dynamic>(
          routeData: routeData, child: _i4.SettingsPage());
    },
    MainHomeDeliveryExecutiveRoute.name: (routeData) {
      return _i15.MaterialPageX<dynamic>(
          routeData: routeData,
          child: const _i5.MainHomeDeliveryExecutivePage());
    },
    SingleOrderRoute.name: (routeData) {
      return _i15.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.SingleOrderPage());
    },
    ReadyForDelivery.name: (routeData) {
      return _i15.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i7.ReadyForDelivery());
    },
    CustomerVerification.name: (routeData) {
      final args = routeData.argsAs<CustomerVerificationArgs>();
      return _i15.MaterialPageX<dynamic>(
          routeData: routeData,
          child:
              _i8.CustomerVerification(key: args.key, orderId: args.orderId));
    },
    DirectionsToAddress.name: (routeData) {
      final args = routeData.argsAs<DirectionsToAddressArgs>();
      return _i15.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i9.DirectionsToAddress(key: args.key, orderId: args.orderId));
    },
    ResetPasswordRoute.name: (routeData) {
      return _i15.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i10.ResetPasswordPage());
    },
    SummaryRoute.name: (routeData) {
      final args = routeData.argsAs<SummaryRouteArgs>();
      return _i15.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i11.SummaryPage(key: args.key, orderId: args.orderId));
    },
    OrderDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<OrderDetailsRouteArgs>();
      return _i15.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i12.OrderDetailsPage(key: args.key, orderId: args.orderId));
    },
    CratesRoute.name: (routeData) {
      final args = routeData.argsAs<CratesRouteArgs>();
      return _i15.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i13.CratesPage(key: args.key, orderId: args.orderId));
    },
    InvoiceRoute.name: (routeData) {
      return _i15.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i14.InvoicePage());
    }
  };

  @override
  List<_i15.RouteConfig> get routes => [
        _i15.RouteConfig(SplashScreen.name, path: '/'),
        _i15.RouteConfig(LoginRoute.name, path: '/login-page'),
        _i15.RouteConfig(RegisterRoute.name, path: '/register-page'),
        _i15.RouteConfig(MainHomeRoute.name, path: '/main-home-page'),
        _i15.RouteConfig(SettingsRoute.name, path: '/settings-page'),
        _i15.RouteConfig(MainHomeDeliveryExecutiveRoute.name,
            path: '/main-home-delivery-executive-page'),
        _i15.RouteConfig(SingleOrderRoute.name, path: '/single-order-page'),
        _i15.RouteConfig(ReadyForDelivery.name, path: '/ready-for-delivery'),
        _i15.RouteConfig(CustomerVerification.name,
            path: '/customer-verification'),
        _i15.RouteConfig(DirectionsToAddress.name,
            path: '/directions-to-address'),
        _i15.RouteConfig(ResetPasswordRoute.name, path: '/reset-password-page'),
        _i15.RouteConfig(SummaryRoute.name, path: '/summary-page'),
        _i15.RouteConfig(OrderDetailsRoute.name, path: '/order-details-page'),
        _i15.RouteConfig(CratesRoute.name, path: '/crates-page'),
        _i15.RouteConfig(InvoiceRoute.name, path: '/invoice-page')
      ];
}

/// generated route for
/// [_i1.SplashScreen]
class SplashScreen extends _i15.PageRouteInfo<void> {
  const SplashScreen() : super(SplashScreen.name, path: '/');

  static const String name = 'SplashScreen';
}

/// generated route for
/// [_i2.LoginPage]
class LoginRoute extends _i15.PageRouteInfo<void> {
  const LoginRoute() : super(LoginRoute.name, path: '/login-page');

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i2.RegisterPage]
class RegisterRoute extends _i15.PageRouteInfo<void> {
  const RegisterRoute() : super(RegisterRoute.name, path: '/register-page');

  static const String name = 'RegisterRoute';
}

/// generated route for
/// [_i3.MainHomePage]
class MainHomeRoute extends _i15.PageRouteInfo<void> {
  const MainHomeRoute() : super(MainHomeRoute.name, path: '/main-home-page');

  static const String name = 'MainHomeRoute';
}

/// generated route for
/// [_i4.SettingsPage]
class SettingsRoute extends _i15.PageRouteInfo<void> {
  const SettingsRoute() : super(SettingsRoute.name, path: '/settings-page');

  static const String name = 'SettingsRoute';
}

/// generated route for
/// [_i5.MainHomeDeliveryExecutivePage]
class MainHomeDeliveryExecutiveRoute extends _i15.PageRouteInfo<void> {
  const MainHomeDeliveryExecutiveRoute()
      : super(MainHomeDeliveryExecutiveRoute.name,
            path: '/main-home-delivery-executive-page');

  static const String name = 'MainHomeDeliveryExecutiveRoute';
}

/// generated route for
/// [_i6.SingleOrderPage]
class SingleOrderRoute extends _i15.PageRouteInfo<void> {
  const SingleOrderRoute()
      : super(SingleOrderRoute.name, path: '/single-order-page');

  static const String name = 'SingleOrderRoute';
}

/// generated route for
/// [_i7.ReadyForDelivery]
class ReadyForDelivery extends _i15.PageRouteInfo<void> {
  const ReadyForDelivery()
      : super(ReadyForDelivery.name, path: '/ready-for-delivery');

  static const String name = 'ReadyForDelivery';
}

/// generated route for
/// [_i8.CustomerVerification]
class CustomerVerification
    extends _i15.PageRouteInfo<CustomerVerificationArgs> {
  CustomerVerification({_i17.Key? key, required int orderId})
      : super(CustomerVerification.name,
            path: '/customer-verification',
            args: CustomerVerificationArgs(key: key, orderId: orderId));

  static const String name = 'CustomerVerification';
}

class CustomerVerificationArgs {
  const CustomerVerificationArgs({this.key, required this.orderId});

  final _i17.Key? key;

  final int orderId;

  @override
  String toString() {
    return 'CustomerVerificationArgs{key: $key, orderId: $orderId}';
  }
}

/// generated route for
/// [_i9.DirectionsToAddress]
class DirectionsToAddress extends _i15.PageRouteInfo<DirectionsToAddressArgs> {
  DirectionsToAddress({_i17.Key? key, required int orderId})
      : super(DirectionsToAddress.name,
            path: '/directions-to-address',
            args: DirectionsToAddressArgs(key: key, orderId: orderId));

  static const String name = 'DirectionsToAddress';
}

class DirectionsToAddressArgs {
  const DirectionsToAddressArgs({this.key, required this.orderId});

  final _i17.Key? key;

  final int orderId;

  @override
  String toString() {
    return 'DirectionsToAddressArgs{key: $key, orderId: $orderId}';
  }
}

/// generated route for
/// [_i10.ResetPasswordPage]
class ResetPasswordRoute extends _i15.PageRouteInfo<void> {
  const ResetPasswordRoute()
      : super(ResetPasswordRoute.name, path: '/reset-password-page');

  static const String name = 'ResetPasswordRoute';
}

/// generated route for
/// [_i11.SummaryPage]
class SummaryRoute extends _i15.PageRouteInfo<SummaryRouteArgs> {
  SummaryRoute({_i17.Key? key, required int orderId})
      : super(SummaryRoute.name,
            path: '/summary-page',
            args: SummaryRouteArgs(key: key, orderId: orderId));

  static const String name = 'SummaryRoute';
}

class SummaryRouteArgs {
  const SummaryRouteArgs({this.key, required this.orderId});

  final _i17.Key? key;

  final int orderId;

  @override
  String toString() {
    return 'SummaryRouteArgs{key: $key, orderId: $orderId}';
  }
}

/// generated route for
/// [_i12.OrderDetailsPage]
class OrderDetailsRoute extends _i15.PageRouteInfo<OrderDetailsRouteArgs> {
  OrderDetailsRoute({_i17.Key? key, required int orderId})
      : super(OrderDetailsRoute.name,
            path: '/order-details-page',
            args: OrderDetailsRouteArgs(key: key, orderId: orderId));

  static const String name = 'OrderDetailsRoute';
}

class OrderDetailsRouteArgs {
  const OrderDetailsRouteArgs({this.key, required this.orderId});

  final _i17.Key? key;

  final int orderId;

  @override
  String toString() {
    return 'OrderDetailsRouteArgs{key: $key, orderId: $orderId}';
  }
}

/// generated route for
/// [_i13.CratesPage]
class CratesRoute extends _i15.PageRouteInfo<CratesRouteArgs> {
  CratesRoute({_i17.Key? key, required int orderId})
      : super(CratesRoute.name,
            path: '/crates-page',
            args: CratesRouteArgs(key: key, orderId: orderId));

  static const String name = 'CratesRoute';
}

class CratesRouteArgs {
  const CratesRouteArgs({this.key, required this.orderId});

  final _i17.Key? key;

  final int orderId;

  @override
  String toString() {
    return 'CratesRouteArgs{key: $key, orderId: $orderId}';
  }
}

/// generated route for
/// [_i14.InvoicePage]
class InvoiceRoute extends _i15.PageRouteInfo<void> {
  const InvoiceRoute() : super(InvoiceRoute.name, path: '/invoice-page');

  static const String name = 'InvoiceRoute';
}
