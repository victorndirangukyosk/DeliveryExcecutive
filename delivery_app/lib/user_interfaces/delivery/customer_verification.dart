// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:delivery_app/configuration/configuration.dart';
import 'package:delivery_app/cubits/cubits.dart';
import 'package:delivery_app/cubits/customer_verification/customer_verification_cubit.dart';
import 'package:delivery_app/cubits/order_details_list/de/o_details_de_cubit.dart';
import 'package:delivery_app/models/odetails_list/de/odetails_de.dart';
import 'package:delivery_app/routes/router.gr.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:image_picker/image_picker.dart';
import 'package:signature/signature.dart';
import 'package:user_profile_avatar/user_profile_avatar.dart';

class CustomerVerification extends StatefulWidget {
  const CustomerVerification({Key? key}) : super(key: key);

  @override
  State<CustomerVerification> createState() => _CustomerVerificationState();
}

//
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                const Text(
                  'Hi Client, your order has been Delivered',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Expanded(child: Container()),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(
                      onPressed: () {
                        // AutoRouter.of(context).push(
                        //     CustomerVerification());
                      },
                      icon: const Icon(
                        CupertinoIcons.check_mark,
                        size: 30,
                        color: Palette.greenColor,
                      )),
                )
              ],
            ),
            Expanded(child: SummaryTileList()),
          ],
        ),
      ),
    );
  }
}

class SummaryTileList extends StatelessWidget {
  const SummaryTileList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // context.read<AssignedDeCubit>().getAssignedDeOrders();
    // context.read<ODetailsDeCubit>().getDeOrderDetails();
    return SingleChildScrollView(
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.only(top: 12.0),
          child: StaggeredGrid.count(
            crossAxisCount: 4,
            mainAxisSpacing: 4,
            crossAxisSpacing: 4,
            children: [
              StaggeredGridTile.count(
                crossAxisCellCount: 2,
                mainAxisCellCount: 2,
                child: Container(
                  // color: Palette.placeholderGrey,
                  decoration: BoxDecoration(
                      border: Border.all(color: Palette.orangeColor),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Center(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              context
                                          .watch<PickImageCubit>()
                                          .state
                                          .path
                                          .length <
                                      2
                                  ? InkWell(
                                      onTap: () async {
                                        var x = await ImagePicker().pickImage(
                                            source: ImageSource.camera);
                                        context
                                            .read<PickImageCubit>()
                                            .emit(File(x!.path));
                                      },
                                      child: AnimatedContainer(
                                        duration: const Duration(seconds: 3),
                                        height: 200,
                                        width: 200,
                                        // decoration: BoxDecoration(
                                        //     border: Border.all(width: 2)),
                                        child: Center(
                                          child: UserProfileAvatar(
                                            avatarUrl: '',
                                            onAvatarTap: () async {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(SnackBar(
                                                content:
                                                    Text('Tapped on avatar'),
                                              ));
                                              var x = await ImagePicker()
                                                  .pickImage(
                                                      source:
                                                          ImageSource.camera);
                                              context
                                                  .read<PickImageCubit>()
                                                  .emit(File(x!.path));
                                            },
                                            // notificationCount: 10,
                                            notificationBubbleTextStyle:
                                                const TextStyle(
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
                                  : InkWell(
                                      onTap: () async {
                                        var x = await ImagePicker().pickImage(
                                            source: ImageSource.camera);
                                        context
                                            .read<PickImageCubit>()
                                            .emit(File(x!.path));
                                      },
                                      child: Center(
                                        child: Image.file(
                                          context.read<PickImageCubit>().state,
                                          height: 270,
                                          width: 270,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                            ],
                          ),
                        ),
                        // Padding(
                        //   padding: const EdgeInsets.all(8.0),
                        //   child: Row(
                        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //     children: const [
                        //       Text(
                        //         'Tax Invoice',
                        //         style: TextStyle(
                        //             fontFamily: 'BOXICONS',
                        //             fontWeight: FontWeight.bold,
                        //             fontSize: 14),
                        //       ),
                        //       Text(
                        //         'ORDER INFO',
                        //         style: TextStyle(
                        //             fontFamily: 'BOXICONS',
                        //             fontWeight: FontWeight.bold,
                        //             fontSize: 14),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                        // Padding(
                        //   padding: const EdgeInsets.all(8.0),
                        //   child: Row(
                        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //     children: const [
                        //       Text(
                        //         'Placed on',
                        //         style: TextStyle(
                        //             fontFamily: 'BOXICONS',
                        //             fontWeight: FontWeight.bold,
                        //             fontSize: 14),
                        //       ),
                        //       Text(
                        //         'ORDER INFO',
                        //         style: TextStyle(
                        //             fontFamily: 'BOXICONS',
                        //             fontWeight: FontWeight.bold,
                        //             fontSize: 14),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                        // Padding(
                        //   padding: const EdgeInsets.all(8.0),
                        //   child: Row(
                        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //     children: const [
                        //       Text(
                        //         'Delivered on',
                        //         style: TextStyle(
                        //             fontFamily: 'BOXICONS',
                        //             fontWeight: FontWeight.bold,
                        //             fontSize: 14),
                        //       ),
                        //       Text(
                        //         'ORDER INFO',
                        //         style: TextStyle(
                        //             fontFamily: 'BOXICONS',
                        //             fontWeight: FontWeight.bold,
                        //             fontSize: 14),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ),
              ),
              StaggeredGridTile.count(
                crossAxisCellCount: 2,
                mainAxisCellCount: 1,
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Palette.orangeColor),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              'Tax Invoice',
                              style: TextStyle(
                                  fontFamily: 'BOXICONS',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14),
                            ),
                            Text(
                              'ORDER INFO',
                              style: TextStyle(
                                  fontFamily: 'BOXICONS',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              'Placed on',
                              style: TextStyle(
                                  fontFamily: 'BOXICONS',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14),
                            ),
                            Text(
                              'ORDER INFO',
                              style: TextStyle(
                                  fontFamily: 'BOXICONS',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              'Delivered on',
                              style: TextStyle(
                                  fontFamily: 'BOXICONS',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14),
                            ),
                            Text(
                              'ORDER INFO',
                              style: TextStyle(
                                  fontFamily: 'BOXICONS',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              StaggeredGridTile.count(
                crossAxisCellCount: 2,
                mainAxisCellCount: 1,
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Palette.orangeColor),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              'Tax Invoice',
                              style: TextStyle(
                                  fontFamily: 'BOXICONS',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14),
                            ),
                            Text(
                              'ORDER INFO',
                              style: TextStyle(
                                  fontFamily: 'BOXICONS',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              'Placed on',
                              style: TextStyle(
                                  fontFamily: 'BOXICONS',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14),
                            ),
                            Text(
                              'ORDER INFO',
                              style: TextStyle(
                                  fontFamily: 'BOXICONS',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              'Delivered on',
                              style: TextStyle(
                                  fontFamily: 'BOXICONS',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14),
                            ),
                            Text(
                              'ORDER INFO',
                              style: TextStyle(
                                  fontFamily: 'BOXICONS',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // StaggeredGridTile.count(
              //   crossAxisCellCount: 1,
              //   mainAxisCellCount: 1,
              //   child: Container(
              //     decoration: BoxDecoration(
              //         border: Border.all(color: Palette.orangeColor),
              //         borderRadius: BorderRadius.all(Radius.circular(20))),
              //   ),
              // ),
              // StaggeredGridTile.count(
              //   crossAxisCellCount: 1,
              //   mainAxisCellCount: 1,
              //   child: Container(decoration: BoxDecoration(
              //         border: Border.all(color: Palette.orangeColor),
              //         borderRadius: BorderRadius.all(Radius.circular(20))),),
              // ),
              StaggeredGridTile.count(
                crossAxisCellCount: 4,
                mainAxisCellCount: 10,
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Palette.orangeColor),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Column(
                    children: [
                      Container(
                        height: 60,
                        // padding: const EdgeInsets.only(left: 20, right: 8),
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: Palette.greenColor,
                            borderRadius: BorderRadius.circular(10)),
                        child: IntrinsicHeight(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Expanded(
                                child: Column(
                                  children: const [
                                    Text(
                                      'Product Name',
                                      maxLines: 1,
                                      overflow: TextOverflow.fade,
                                      softWrap: false,
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                              const VerticalDivider(),
                              Expanded(
                                child: Column(
                                  children: const [
                                    Text(
                                      'Quantity',
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                              const VerticalDivider(),
                              Expanded(
                                child: Column(
                                  children: const [
                                    Flexible(
                                      child: Text(
                                        'Specifications',
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const VerticalDivider(),
                              Expanded(
                                child: Column(
                                  children: const [
                                    Text(
                                      'Total',
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      BlocConsumer<ODetailsDeCubit, ODetailsDeState>(
                          listener: (context, state) {
                        // TODO: implement listener
                        state.maybeWhen(
                            orElse: () {},
                            failed: (e) {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return CupertinoAlertDialog(
                                      title: Text('Error'),
                                      content: Text(e),
                                    );
                                  });
                            });
                      }, builder: (context, state) {
                        return state.maybeWhen(
                          loading: () {
                            return const Center(
                              child: CircularProgressIndicator(
                                color: Palette.greenColor,
                              ),
                            );
                          },
                          success: (odeDetailsList) {
                            return SingleChildScrollView(
                              child: Column(children: [
                                ...List.generate(
                                    odeDetailsList!.length,
                                    (index) => CardWidget(
                                          deets: odeDetailsList[index],
                                          // orderId: orderId,
                                          index: index,
                                        ))
                              ]),
                            );
                          },
                          orElse: () {
                            return Container();
                          },
                        );
                      }),
                    ],
                  ),
                ),
              ),
              StaggeredGridTile.count(
                crossAxisCellCount: 4,
                mainAxisCellCount: 2,
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Palette.orangeColor),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                ),
              ),
            ],
          ),
        )
      ]),
    );
  }
}

class CardWidget extends StatefulWidget {
  // final int orderId;
  final OdetailsDe deets;

  final int index;
  const CardWidget({
    Key? key,
    required this.deets,
    required this.index,
    // required this.orderId,
  }) : super(key: key);

  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  var size, height, width;

  TextEditingController _textFieldController1 = TextEditingController();

  TextEditingController _textFieldController2 = TextEditingController();

  final _formKey = GlobalKey<FormBuilderState>();

  TextEditingController textarea = TextEditingController();

  final PageController _controller = PageController(initialPage: 0);

  bool isPerformingRequest = false;

  ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(15),
      child: Container(
        color: Colors.grey[100 * (widget.index % 3 + 1)],
        height: 100,
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.deets.name!,
                  style: const TextStyle(
                      color: Palette.placeholderGrey, fontSize: 16),
                ),
              ],
            ),
          ),
          const VerticalDivider(),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text(
                    // odetailsList[index]
                    //     .quantity
                    //     .toString(),
                    widget.deets.quantity!.toString(),
                    style: const TextStyle(
                        color: Palette.placeholderGrey,
                        fontSize: 16,
                        fontWeight: FontWeight.w200),
                  ),
                  Text(
                    widget.deets.unit.toString(),
                    style: const TextStyle(
                        color: Palette.placeholderGrey,
                        fontSize: 16,
                        fontWeight: FontWeight.w200),
                  )
                ])
              ],
            ),
          ),
          const VerticalDivider(),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                child: Text(
                  widget.deets.product_note!,
                  softWrap: true,
                  style: const TextStyle(
                      color: Palette.placeholderGrey, fontSize: 16),
                ),
              )
            ],
          )),
          const VerticalDivider(),
          Expanded(
            child: Column(
              children: [
                // CupertinoButton(
                //     child: Icon(BoxIcons.bx_note), onPressed: () {}),
                Row(
                  children: [],
                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}

class _CustomerVerificatioState extends State<CustomerVerification> {
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
      body: Padding(
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
                        decoration: BoxDecoration(border: Border.all(width: 2)),
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
                            notificationBubbleTextStyle: const TextStyle(
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
                  : InkWell(
                      onTap: () async {
                        var x = await ImagePicker()
                            .pickImage(source: ImageSource.camera);
                        context.read<PickImageCubit>().emit(File(x!.path));
                      },
                      child: Image.file(
                        context.read<PickImageCubit>().state,
                        height: 200,
                        width: 300,
                        fit: BoxFit.cover,
                      ),
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
                    // context.read<CustomerVerificationCubit>();
                    AutoRouter.of(context).replace(InvoiceRoute());
                  })
            ],
          ),
        ),
      ),
    );
  }
}
