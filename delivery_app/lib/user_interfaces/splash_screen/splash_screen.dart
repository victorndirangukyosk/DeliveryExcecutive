import 'package:auto_route/auto_route.dart';
import 'package:delivery_app/routes/router.gr.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
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
      // await startKioskMode();
      AutoRouter.of(context).replace(const LoginRoute());
    });
  }

  @override
  Widget build(BuildContext context) {
    var _formKey = GlobalKey<FormBuilderState>();
    return Scaffold(
      body: FormBuilder(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Center(
            child: Image.asset(
              'assets/icon/icon.png',
              height: 200,
              width: 200,
            ),
          ),
        ),
      ),
    );
  }
}
