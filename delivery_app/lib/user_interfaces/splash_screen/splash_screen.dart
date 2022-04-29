import 'package:auto_route/auto_route.dart';
import 'package:delivery_app/configuration/configuration.dart';
import 'package:delivery_app/cubits/authentication/token_cubit.dart';
import 'package:delivery_app/cubits/is_de_cubit/is_de_cubit.dart';
import 'package:delivery_app/routes/router.gr.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get_it/get_it.dart';
// import 'package:kiosk_mode/kiosk_mode.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      // await startKioskMode();
      TokenCubit tokenCubit = GetIt.I.get<TokenCubit>();

      IsDeCubit isDeCubit = GetIt.I.get<IsDeCubit>();


      
      tokenCubit.state.isEmpty
          ? AutoRouter.of(context).replace(const LoginRoute())
          :isDeCubit.state? AutoRouter.of(context).replace(const MainHomeDeliveryExecutiveRoute()):AutoRouter.of(context).replace(const MainHomeRoute());
    });
  }

  @override
  Widget build(BuildContext context) {
    /// Register the token cubit
    TokenCubit tokenCubit = BlocProvider.of<TokenCubit>(context);
    GetIt.I.registerSingleton(tokenCubit);
     IsDeCubit isDeCubit = BlocProvider.of<IsDeCubit>(context);
    GetIt.I.registerSingleton(isDeCubit);
    return Scaffold(
        body: Stack(
      children: [
        const Positioned(
          left: 200,
          right: 200,
          top: 200,
          child: Center(
            child: SpinKitCircle(
              color: Palette.greenColor,
            ),
          ),
        ),
        const Positioned(
          top: 100,
          right: 0,
          left: 0,
          child: Center(
            child: Text.rich(TextSpan(
                text: 'Kwik ',
                style: TextStyle(
                    fontSize: 60,
                    fontWeight: FontWeight.w900,
                    color: Palette.orangeColor),
                children: [
                  TextSpan(
                      text: 'Delivery',
                      style: TextStyle(color: Palette.greenColor))
                ])),
          ),
        ),
        Positioned(
            left: 0,
            right: 0,
            bottom: -10,
            child: Image.asset(
              'assets/truck_image.png',
              width: MediaQuery.of(context).size.width + 20,
            ))
      ],
    ));
  }
}
