import 'package:auto_route/auto_route.dart';
import 'package:delivery_app/configuration/configuration.dart';
import 'package:delivery_app/configuration/palette/palette.dart';
import 'package:delivery_app/cubits/cubits.dart';
import 'package:delivery_app/routes/router.gr.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AnimatedContainer(
      duration: const Duration(seconds: 1),
      child: const Center(
        child: LoginCard(),
      ),
      decoration: const BoxDecoration(color: Palette.orangeColor
          // gradient: LinearGradient(
          //     begin: Alignment.topLeft,
          //     end: Alignment.bottomRight,
          //     colors: [Palette.greenColor, Palette.orangeColor]
          //     )
          ),
    ));
  }
}

class LoginCard extends StatelessWidget {
  const LoginCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 20,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      margin: const EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              const Text.rich(TextSpan(
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
              const SizedBox(
                height: 40,
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Email',
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(width: 2)),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(width: 2)),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                obscureText: context.watch<ObscurePasswordCubit>().state,
                decoration: InputDecoration(
                  suffixIcon: CupertinoButton(
                      padding: const EdgeInsets.all(0.0),
                      child: Icon(!context.watch<ObscurePasswordCubit>().state
                          ? CupertinoIcons.lock_open
                          : CupertinoIcons.lock),
                      onPressed: () {
                        context.read<ObscurePasswordCubit>().toggle();
                      }),
                  hintText: 'Password',
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(width: 2)),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(width: 2)),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              CupertinoButton(
                  child: const Text('Login'),
                  color: Palette.greenColor,
                  onPressed: () {
                    AutoRouter.of(context).push(const MainHomeRoute());
                  }),
              const SizedBox(
                height: 20,
              ),
              CupertinoButton(
                  child: const Text('Forgot password?'), onPressed: () {}),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
