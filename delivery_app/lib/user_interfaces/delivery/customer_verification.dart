// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:delivery_app/configuration/configuration.dart';
import 'package:delivery_app/cubits/cubits.dart';
import 'package:delivery_app/cubits/customer_verification/customer_verification_cubit.dart';
import 'package:delivery_app/routes/router.gr.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:signature/signature.dart';
import 'package:user_profile_avatar/user_profile_avatar.dart';

class CustomerVerification extends StatefulWidget {
  const CustomerVerification({Key? key}) : super(key: key);

  @override
  State<CustomerVerification> createState() => _CustomerVerificationState();
}

class _CustomerVerificationState extends State<CustomerVerification> {
  @override
  Widget build(BuildContext context) {
    // context.read<CustomerVerificationCubit>().verifyCustomer(orderId: orderId, File file);
    return Scaffold(
      // backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Customer verification',
          style: TextStyle(color: Palette.greenColor),
        ),
        iconTheme: const IconThemeData(color: Palette.orangeColor),
        actionsIconTheme: const IconThemeData(color: Palette.orangeColor),
      ),
      body: BlocConsumer<CustomerVerificationCubit, CustomerVerificationState>(
        listener: (context, state) {
          // TODO: implement listener
          state.maybeWhen(
              orElse: () {},
              failed: (e) async {
                await showDialog(
                    context: context,
                    builder: (context) {
                      return CupertinoAlertDialog(
                        title: Text('Error'),
                        content: Text(e),
                      );
                    });
                Navigator.pop(context);
              },
              success: () async {
                await showDialog(
                    context: context,
                    builder: (context) {
                      return const CupertinoAlertDialog(
                        title: Text('Success'),
                        content: Text('Customer Detials Sent Successfully'),
                      );
                    });
                Navigator.pop(context);
                AutoRouter.of(context)
                    .replace(const MainHomeDeliveryExecutiveRoute());
              });
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Customer photo',
                    style: TextStyle(
                        color: Palette.greenColor,
                        fontSize: 20,
                        fontFamily: 'Helvetica',
                        fontWeight: FontWeight.bold),
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
                            decoration:
                                BoxDecoration(border: Border.all(width: 2)),
                            child: Center(
                              child: UserProfileAvatar(
                                avatarUrl: '',
                                onAvatarTap: () async {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    content: Text('Tapped on avatar'),
                                  ));
                                  var x = await ImagePicker()
                                      .pickImage(source: ImageSource.camera);
                                  context
                                      .read<PickImageCubit>()
                                      .emit(File(x!.path));
                                },
                                // notificationCount: 10,
                                notificationBubbleTextStyle: TextStyle(
                                  fontSize: 30,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                                avatarSplashColor: Colors.purple,
                                radius: 100,
                                isActivityIndicatorSmall: false,
                                avatarBorderData: AvatarBorderData(
                                  borderColor: Colors.black54,
                                  borderWidth: 5.0,
                                ),
                              ),
                            ),
                          ),
                        )
                      : Image.file(
                          context.read<PickImageCubit>().state,
                          height: 200,
                          width: 300,
                          fit: BoxFit.cover,
                        ),
                  const SizedBox(
                    height: 70,
                  ),
                  const Text(
                    'Customer signature',
                    style: TextStyle(
                        color: Palette.greenColor,
                        fontSize: 20,
                        fontFamily: 'Helvetica',
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                  ),
                  Container(
                    height: 200,
                    width: 300,
                    decoration: BoxDecoration(
                      color: Palette.greenColor,
                      border: Border.all(width: 1),
                      // borderRadius: BorderRadius.circular(30),
                    ),
                    //we can have the following cubits analyzed
                    child: Signature(
                      controller: SignatureController(),
                      height: 200,
                      width: 300,
                      backgroundColor: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  CupertinoButton(
                      child: const Text('Submit'),
                      color: Palette.greenColor,
                      onPressed: () {
                        context.read<CustomerVerificationCubit>();
                      })
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
