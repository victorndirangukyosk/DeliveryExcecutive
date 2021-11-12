import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:delivery_app/configuration/configuration.dart';
import 'package:delivery_app/cubits/cubits.dart';
import 'package:delivery_app/routes/router.gr.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:signature/signature.dart';

class CustomerVerification extends StatelessWidget {
  const CustomerVerification({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Customer verification",
          style: TextStyle(color: Palette.greenColor),
        ),
        iconTheme: const IconThemeData(color: Palette.orangeColor),
        actionsIconTheme: const IconThemeData(color: Palette.orangeColor),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Customer photo",
              style: TextStyle(color: Palette.greenColor, fontSize: 20),
            ),
            context.watch<PickImageCubit>().state.path.length < 2
                ? InkWell(
                    onTap: () async {
                      var x = await ImagePicker()
                          .pickImage(source: ImageSource.camera);
                      context.read<PickImageCubit>().emit(File(x!.path));
                    },
                    child: AnimatedContainer(
                      duration: const Duration(seconds: 3),
                      height: 200,
                      width: 200,
                      decoration: BoxDecoration(border: Border.all(width: 2)),
                    ),
                  )
                : Image.file(
                    context.read<PickImageCubit>().state,
                    height: 200,
                    width: 300,
                    fit: BoxFit.cover,
                  ),
            const Text(
              "Customer signature",
              style: TextStyle(color: Palette.greenColor, fontSize: 20),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
            ),
            Container(
              height: 200,
              width: 300,
              decoration: BoxDecoration(border: Border.all(width: 1)),
              child: Signature(
                controller: SignatureController(),
                height: 200,
                width: 300,
                backgroundColor: Colors.white,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            CupertinoButton(
                child: const Text("Submit"),
                color: Palette.greenColor,
                onPressed: () {
                  AutoRouter.of(context).replace(const MainHomeRoute());
                })
          ],
        ),
      ),
    );
  }
}
