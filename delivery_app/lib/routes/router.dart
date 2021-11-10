import 'package:auto_route/auto_route.dart';
import 'package:delivery_app/user_interfaces/delivery/customer_verification.dart';
import 'package:delivery_app/user_interfaces/delivery/directions_to_address/directions_to_address.dart';
import 'package:delivery_app/user_interfaces/delivery/ready_for_delivery.dart';
import 'package:delivery_app/user_interfaces/home/main_home_page.dart';
import 'package:delivery_app/user_interfaces/my_orders/single_order_page.dart';
import 'package:delivery_app/user_interfaces/splash_screen/splash_screen.dart';
import 'package:delivery_app/user_interfaces/user_interfaces.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: SplashScreen, initial: true),
    AutoRoute(page: LoginPage),
    AutoRoute(page: RegisterPage),
    AutoRoute(page: MainHomePage),
    AutoRoute(page: SingleOrderPage),
    AutoRoute(page: ReadyForDelivery),
    AutoRoute(page: CustomerVerification),
    AutoRoute(page: DirectionsToAddress),
  ],
)
class $AppRouter {}
