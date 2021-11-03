import 'package:auto_route/auto_route.dart';
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
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 100,
            ),
            Image.asset(
              'assets/icon/icon.png',
              height: 200,
              width: 200,
            ),
            const SizedBox(
              height: 100,
            ),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                  hintText: "Email",
                  contentPadding: EdgeInsets.only(left: 16, right: 16),
                  border: OutlineInputBorder()),
            ),
            const SizedBox(
              height: 40,
            ),
            TextFormField(
              keyboardType: TextInputType.visiblePassword,
              obscureText: context.watch<ObscurePasswordCubit>().state,
              decoration: InputDecoration(
                  hintText: "Password",
                  suffixIcon: CupertinoButton(
                    padding: const EdgeInsets.all(0),
                    onPressed: () {
                      context.read<ObscurePasswordCubit>().toggle();
                    },
                    child: Icon(context.watch<ObscurePasswordCubit>().state
                        ? CupertinoIcons.lock
                        : CupertinoIcons.lock_open),
                  ),
                  contentPadding: const EdgeInsets.only(left: 16, right: 16),
                  border: const OutlineInputBorder()),
            ),
            const SizedBox(
              height: 100,
            ),
            CupertinoButton(
              child: const Text("Login"),
              onPressed: () {
                AutoRouter.of(context).replace(const MainHomeRoute());
              },
              color: Theme.of(context).primaryColor,
            )
          ],
        ),
      ),
    );
  }
}
