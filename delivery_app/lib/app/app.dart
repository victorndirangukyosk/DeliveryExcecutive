import 'dart:io';

import 'package:delivery_app/configuration/configuration.dart';
import 'package:delivery_app/cubits/accept_reject/accept_reject_cubit.dart';
import 'package:delivery_app/cubits/add_crates_cubit/add_crates_cubit.dart';
import 'package:delivery_app/cubits/add_missing_products/add_missing_products_cubit_cubit.dart';
import 'package:delivery_app/cubits/api/reset_password_cubit/reset_password_cubit.dart';
import 'package:delivery_app/cubits/crates_qr_cubit/crates_qr_cubit.dart';
import 'package:delivery_app/cubits/fetch_order_status_cubit/fetch_order_status_cubit.dart';
import 'package:delivery_app/cubits/get_assigned_cubit/de/cubit/assigned_de_cubit.dart';
import 'package:delivery_app/cubits/get_assigned_cubit/op/get_assigned_cubit.dart';
// import 'package:delivery_app/cubits/authentication/token_cubit.dart';
import 'package:delivery_app/cubits/cubits.dart';
import 'package:delivery_app/cubits/is_de_cubit/is_de_cubit.dart';
import 'package:delivery_app/cubits/op_selection_cubit/op_selection_cubit.dart';
import 'package:delivery_app/cubits/order_details_cubit/order_details_cubit.dart';
import 'package:delivery_app/cubits/order_details_list/odetails_list_cubit.dart';
import 'package:delivery_app/models/assigned/de/assigned_de.dart';
// import 'package:delivery_app/cubits/qr_scanner_cubit/qr_scanner_cubit.dart';
// import 'package:delivery_app/cubits/select_date_cubit/select_date_cubit.dart';
import 'package:delivery_app/routes/router.gr.dart';
import 'package:delivery_app/user_interfaces/packing/items_processing/processed_order_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:overlay_support/overlay_support.dart';

class KwikBasketDeliveryApp extends StatelessWidget {
  KwikBasketDeliveryApp({Key? key}) : super(key: key);
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ObscurePasswordCubit(true)),
        BlocProvider(create: (context) => HomeBottomNavigationIndexCubit(0)),
        BlocProvider(create: (context) => SelectDateCubit(DateTime.now())),
        BlocProvider(create: (context) => PickImageCubit(File(''))),

        /// This blocprovider persists the token state
        BlocProvider(create: (context) => TokenCubit('')),
        BlocProvider(create: (context) => AssignedDeCubit()),
        BlocProvider(create: (context) => LoginCubit()),
        BlocProvider(create: (context) => ResetPasswordCubit()),
        BlocProvider(create: (context) => GetAssignedCubit()),
        BlocProvider(create: (context) => OPSelectionCubit(false)),
        BlocProvider(create: (context) => OrderDetailsCubit()),
        BlocProvider(create: (context) => OdetailsListCubit()),
        // an empty list wrappped with one
        BlocProvider(create: (context) => CratesQRCubit([])),
        BlocProvider(create: (context) => AddCratesCubit()),
        BlocProvider(create: (context) => AcceptRejectCubit()),
        BlocProvider(create: (context) => IsDeCubit(true)),
        BlocProvider(create: (context) => AddMissingProductsCubitCubit()),
        BlocProvider(create: (context) => MissingCubit([])),

        BlocProvider(
            create: (context) => FetchOrderStatusCubit()..fetchOrderStatuses()),
      ],
      child: OverlaySupport.global(
        child: MaterialApp.router(
            title: 'Kwikbasket Delivery App',
            debugShowCheckedModeBanner: false,
            supportedLocales: const [
              Locale('en'),
            ],
            localizationsDelegates: const [
              FormBuilderLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            theme: ThemeData(
                textTheme: GoogleFonts.poppinsTextTheme(),
                primaryColor: Palette.greenColor,
                colorScheme: const ColorScheme(
                    primary: Palette.greenColor,
                    primaryVariant: Colors.black,
                    secondary: Palette.orangeColor,
                    secondaryVariant: Colors.amber,
                    surface: Colors.white,
                    background: Colors.white,
                    error: Colors.red,
                    onPrimary: Colors.white,
                    onSecondary: Colors.white,
                    onSurface: Palette.greenColor,
                    onBackground: Palette.greenColor,
                    onError: Colors.white,
                    brightness: Brightness.light)),
            routerDelegate: _appRouter.delegate(),
            routeInformationParser: _appRouter.defaultRouteParser()),
      ),
    );
  }
}
