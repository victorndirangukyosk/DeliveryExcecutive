import 'dart:io';

import 'package:delivery_app/configuration/configuration.dart';
import 'package:delivery_app/cubits/authentication/token_cubit.dart';
import 'package:delivery_app/cubits/cubits.dart';
import 'package:delivery_app/cubits/select_date_cubit/select_date_cubit.dart';
import 'package:delivery_app/routes/router.gr.dart';
import 'package:flutter/material.dart';
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
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => ObscurePasswordCubit(true)),
          BlocProvider(create: (context) => HomeBottomNavigationIndexCubit(0)),
          BlocProvider(create: (context) => SelectDateCubit(DateTime.now())),
          BlocProvider(create: (context) => PickImageCubit(File(''))),

          /// This blocprovider persists the token state
          BlocProvider(create: (context) => TokenCubit('')),

          BlocProvider(create: (context) => LoginCubit()),
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
        ));
  }
}
