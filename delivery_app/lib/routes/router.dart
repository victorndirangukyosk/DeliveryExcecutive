import 'package:auto_route/auto_route.dart';
import 'package:delivery_app/user_interfaces/authentication_screens/reset_password_page.dart';
import 'package:delivery_app/user_interfaces/delivery/customer_verification.dart';
import 'package:delivery_app/user_interfaces/delivery/directions_to_address/directions_to_address.dart';
import 'package:delivery_app/user_interfaces/delivery/ready_for_delivery.dart';
import 'package:delivery_app/user_interfaces/delivery/main_home_delivery_executive_page.dart';
import 'package:delivery_app/user_interfaces/delivery/summary_page.dart';
import 'package:delivery_app/user_interfaces/home/main_home_page.dart';
import 'package:delivery_app/user_interfaces/packing/my_orders_packing_person/order_details_page.dart';
import 'package:delivery_app/user_interfaces/packing/my_orders_packing_person/single_order_page.dart';
import 'package:delivery_app/user_interfaces/packing/scanner/crates_page.dart';
import 'package:delivery_app/user_interfaces/settings/settings_page.dart';
import 'package:delivery_app/user_interfaces/splash_screen/splash_screen.dart';
import 'package:delivery_app/user_interfaces/user_interfaces.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: SplashScreen, initial: true),
    AutoRoute(page: LoginPage),
    AutoRoute(page: RegisterPage),
    AutoRoute(page: MainHomePage),
    AutoRoute(page: SettingsPage),
    AutoRoute(page: MainHomeDeliveryExecutivePage),
    AutoRoute(page: SingleOrderPage),
    AutoRoute(page: ReadyForDelivery),
    AutoRoute(page: CustomerVerification),
    AutoRoute(page: DirectionsToAddress),
    AutoRoute(page: ResetPasswordPage),
    AutoRoute(page: SummaryPage),
    AutoRoute(page: OrderDetailsPage),
    AutoRoute(page: CratesPage),
    // AutoRoute(page: OrderList),
  ],
)
class $AppRouter {}
