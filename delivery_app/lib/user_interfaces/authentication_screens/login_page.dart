import 'package:delivery_app/cubits/obscure_password/obscure_password_cubit.dart';
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
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
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
                height: 20,
              ),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                    hintText: "Email",
                    contentPadding: EdgeInsets.only(left: 16, right: 16),
                    border: OutlineInputBorder()),
              ),
              const SizedBox(
                height: 20,
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
                height: 40,
              ),
              CupertinoButton(
                child: const Text("Login"),
                onPressed: () {},
                color: Theme.of(context).primaryColor,
              )
            ],
          ),
        ),
      ),
    );
  }
}
