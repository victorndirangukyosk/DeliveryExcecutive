import 'package:auto_route/auto_route.dart';
import 'package:delivery_app/configuration/configuration.dart';
import 'package:delivery_app/routes/router.gr.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kiosk_mode/kiosk_mode.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () async {
      await startKioskMode();
      AutoRouter.of(context).replace(const LoginRoute());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        const Positioned(
          top: 100,
          right: 0,
          left: 0,
          child: Center(
            child: Text.rich(TextSpan(
                text: "Kwik ",
                style: TextStyle(
                    fontSize: 60,
                    fontWeight: FontWeight.w900,
                    color: Palette.orangeColor),
                children: [
                  TextSpan(
                      text: "Delivery",
                      style: TextStyle(color: Palette.greenColor))
                ])),
          ),
        ),
        Positioned(
            left: 0,
            right: 0,
            bottom: -10,
            child: SvgPicture.asset(
              "assets/truck_image.svg",
              width: MediaQuery.of(context).size.width,
            ))
      ],
    ));
  }
}
