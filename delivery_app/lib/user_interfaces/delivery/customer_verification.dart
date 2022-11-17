// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:calendar_time/calendar_time.dart';
import 'package:delivery_app/configuration/configuration.dart';
import 'package:delivery_app/cubits/accept_reject/accept_reject_cubit.dart';
import 'package:delivery_app/cubits/add_missing_products/add_missing_products_cubit_cubit.dart';
import 'package:delivery_app/cubits/cubits.dart';
import 'package:delivery_app/cubits/customer_verification/customer_verification_cubit.dart';
import 'package:delivery_app/cubits/fetch_order_status_cubit/fetch_order_status_cubit.dart';
import 'package:delivery_app/cubits/general_order_details_cubit/de/cubit/de_order_details_cubit.dart';
import 'package:delivery_app/cubits/get_assigned_cubit/de/cubit/assigned_de_cubit.dart';
import 'package:delivery_app/cubits/order_details_list/de/o_details_de_cubit.dart';
import 'package:delivery_app/cubits/processed_items_cubit/processed_items_cubit.dart';
import 'package:delivery_app/models/accept_reject/accept_reject.dart';
import 'package:delivery_app/models/missing/missing.dart';
import 'package:delivery_app/models/odetails_list/de/odetails_de.dart';
import 'package:delivery_app/routes/router.gr.dart';
import 'package:delivery_app/user_interfaces/packing/items_processing/processed_order_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:image_picker/image_picker.dart';
import 'package:signature/signature.dart';
import 'package:user_profile_avatar/user_profile_avatar.dart';

class CustomerVerification extends StatefulWidget {
  final int orderId;
  const CustomerVerification({Key? key, required this.orderId})
      : super(key: key);

  @override
  State<CustomerVerification> createState() => _CustomerVerificationState();
}

//
class _CustomerVerificationState extends State<CustomerVerification> {
  @override
  Widget build(BuildContext context) {
    context.read<AssignedDeCubit>().getAssignedDeOrders();
    context
        .read<DeOrderDetailsCubit>()
        .getGeneralOrderDetails(orderId: widget.orderId);
    context.read<ODetailsDeCubit>().getDeOrderDetails(orderId: widget.orderId);
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
                  'your order has been Delivered',
                  style: TextStyle(
                      color: Palette.placeholderGrey,
                      fontStyle: FontStyle.italic,
                      fontFamily: 'BOXICONS',
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
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
            Expanded(
                child: SummaryTileList(
              orderId: widget.orderId,
            )),
          ],
        ),
      ),
    );
  }
}

class SummaryTileList extends StatelessWidget {
  final int orderId;
  const SummaryTileList({
    Key? key,
    required this.orderId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      if (constraints.maxWidth <= 600) {
        return SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: StaggeredGrid.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 2,
                  crossAxisSpacing: 2,
                  children: [
                    StaggeredGridTile.count(
                      crossAxisCellCount: 2,
                      mainAxisCellCount: 2.1,
                      child: Container(
                        // color: Palette.placeholderGrey,
                        decoration: BoxDecoration(
                            border: Border.all(color: Palette.orangeColor),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: Flexible(
                          child: Column(
                            children: [
                              const Text('CUSTOMER PHOTO'),
                              Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(40.0),
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
                                                var x = await ImagePicker()
                                                    .pickImage(
                                                        source:
                                                            ImageSource.camera);
                                                context
                                                    .read<PickImageCubit>()
                                                    .emit(File(x!.path));
                                              },
                                              child: AnimatedContainer(
                                                duration:
                                                    const Duration(seconds: 3),
                                                height: 280,
                                                width: 280,
                                                // decoration: BoxDecoration(
                                                //     border: Border.all(width: 2)),
                                                child: Center(
                                                  child: UserProfileAvatar(
                                                    avatarUrl: '',
                                                    onAvatarTap: () async {
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                              SnackBar(
                                                        content: Text(
                                                            'Tapped on avatar'),
                                                      ));
                                                      var x = await ImagePicker()
                                                          .pickImage(
                                                              source:
                                                                  ImageSource
                                                                      .camera);
                                                      context
                                                          .read<
                                                              PickImageCubit>()
                                                          .emit(File(x!.path));
                                                    },
                                                    // notificationCount: 10,
                                                    notificationBubbleTextStyle:
                                                        const TextStyle(
                                                      fontSize: 30,
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                    avatarSplashColor:
                                                        Colors.purple,
                                                    radius: 100,
                                                    isActivityIndicatorSmall:
                                                        false,
                                                    avatarBorderData:
                                                        AvatarBorderData(
                                                      borderColor:
                                                          Colors.black54,
                                                      borderWidth: 5.0,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            )
                                          : InkWell(
                                              onTap: () async {
                                                var x = await ImagePicker()
                                                    .pickImage(
                                                        source:
                                                            ImageSource.camera);
                                                context
                                                    .read<PickImageCubit>()
                                                    .emit(File(x!.path));
                                              },
                                              child: Flexible(
                                                child: Image.file(
                                                  context
                                                      .read<PickImageCubit>()
                                                      .state,
                                                  height: 200,
                                                  width: 200,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    StaggeredGridTile.count(
                      crossAxisCellCount: 2,
                      mainAxisCellCount: 1.2,
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Palette.orangeColor),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: BlocConsumer<DeOrderDetailsCubit,
                            DeOrderDetailsState>(
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
                          },
                          builder: (context, state) {
                            return state.maybeWhen(loading: () {
                              return const Center(
                                child: CupertinoActivityIndicator(
                                  color: Palette.greenColor,
                                ),
                              );
                            }, success: (generalDetails) {
                              return Flexible(
                                child: Column(
                                  children: [
                                    Text(
                                      'ORDER INFO',
                                      style: TextStyle(
                                          color: Palette.placeholderGrey,
                                          fontFamily: 'BOXICONS',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Order ID',
                                            style: TextStyle(
                                                color: Palette.placeholderGrey,
                                                fontFamily: 'BOXICONS',
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14),
                                          ),
                                          Text(
                                            generalDetails.order_id.toString(),
                                            style: TextStyle(
                                                color: Palette.placeholderGrey,
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Placed on',
                                            style: TextStyle(
                                                color: Palette.placeholderGrey,
                                                fontFamily: 'BOXICONS',
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14),
                                          ),
                                          Text(
                                            CalendarTime(DateTime.parse(
                                                    generalDetails.date_added!))
                                                .toHuman,
                                            style: TextStyle(
                                                color: Palette.placeholderGrey,
                                                fontFamily: 'BOXICONS',
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Flexible(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Delivered on',
                                              style: TextStyle(
                                                  color:
                                                      Palette.placeholderGrey,
                                                  fontFamily: 'BOXICONS',
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 14),
                                            ),
                                            Text(
                                              CalendarTime(DateTime.parse(
                                                      generalDetails
                                                          .delivery_date!))
                                                  .toHuman,
                                              style: TextStyle(
                                                  color:
                                                      Palette.placeholderGrey,
                                                  fontFamily: 'BOXICONS',
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 14),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Flexible(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text(
                                              'Payment Status',
                                              style: TextStyle(
                                                  color:
                                                      Palette.placeholderGrey,
                                                  fontFamily: 'BOXICONS',
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 14),
                                            ),
                                            generalDetails.paid! == 'N'
                                                //TODO: Add mpesa checkout
                                                ? CupertinoButton.filled(
                                                    minSize: 2,
                                                    onPressed: () {
                                                      AutoRouter.of(context)
                                                          .push(
                                                              MpesaPaymentRoute(
                                                                  data: {},
                                                                  orderReference:
                                                                      ''));
                                                    },
                                                    child: Text('Pay now'),
                                                  )
                                                : Text(
                                                    generalDetails.paid!,
                                                    style: const TextStyle(
                                                        color: Palette
                                                            .placeholderGrey,
                                                        fontFamily: 'BOXICONS',
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 14),
                                                  ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }, orElse: () {
                              return Container();
                            });
                          },
                        ),
                      ),
                    ),
                    StaggeredGridTile.count(
                      crossAxisCellCount: 2,
                      mainAxisCellCount: 1,
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Palette.orangeColor),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: BlocConsumer<DeOrderDetailsCubit,
                            DeOrderDetailsState>(
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
                          },
                          builder: (context, state) {
                            return state.maybeWhen(loading: () {
                              return const Center(
                                child: CupertinoActivityIndicator(
                                  color: Palette.greenColor,
                                ),
                              );
                            }, success: (generalDetails) {
                              return Flexible(
                                child: Column(
                                  children: [
                                    const Text(
                                      'DELIVERY EXCECUTIVE DETAILS',
                                      style: TextStyle(
                                          color: Palette.placeholderGrey,
                                          fontFamily: 'BOXICONS',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'First Name',
                                            style: TextStyle(
                                                color: Palette.placeholderGrey,
                                                fontFamily: 'BOXICONS',
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14),
                                          ),
                                          Text(
                                            generalDetails.firstname!,
                                            style: TextStyle(
                                                color: Palette.placeholderGrey,
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Last name',
                                            style: TextStyle(
                                                color: Palette.placeholderGrey,
                                                fontFamily: 'BOXICONS',
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14),
                                          ),
                                          Text(
                                            generalDetails.lastname!,
                                            style: TextStyle(
                                                color: Palette.placeholderGrey,
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Phone',
                                            style: TextStyle(
                                                color: Palette.placeholderGrey,
                                                fontFamily: 'BOXICONS',
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14),
                                          ),
                                          Text(
                                            generalDetails.telephone!,
                                            style: TextStyle(
                                                color: Palette.placeholderGrey,
                                                fontFamily: 'BOXICONS',
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }, orElse: () {
                              return Container();
                            });
                          },
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
                      mainAxisCellCount: 6,
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Palette.orangeColor),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: SingleChildScrollView(
                          physics: const NeverScrollableScrollPhysics(),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: 80,
                                  // padding: const EdgeInsets.only(left: 20, right: 8),
                                  padding: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                      color: Palette.greenColor,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: IntrinsicHeight(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
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
                                                    fontWeight:
                                                        FontWeight.bold),
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
                                                maxLines: 1,
                                                overflow: TextOverflow.fade,
                                                softWrap: false,
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.bold),
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
                                                  maxLines: 1,
                                                  overflow: TextOverflow.fade,
                                                  softWrap: false,
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold),
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
                                                'Price',
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
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
                                                  acceptReject: AcceptReject(
                                                      status: 'A',
                                                      price:
                                                          odeDetailsList[index]
                                                              .price!
                                                              .toString(),
                                                      product_id:
                                                          odeDetailsList[index]
                                                              .product_id!
                                                              .toString(),
                                                      unit:
                                                          odeDetailsList[index]
                                                              .unit,
                                                      name:
                                                          odeDetailsList[index]
                                                              .name,
                                                      tax: odeDetailsList[index]
                                                          .tax!
                                                          .toString(),
                                                      total:
                                                          odeDetailsList[index]
                                                              .total
                                                              .toString(),
                                                      quantity:
                                                          odeDetailsList[index]
                                                              .quantity!
                                                              .toString(),
                                                      product_store_id:
                                                          odeDetailsList[index]
                                                              .product_store_id,
                                                      comment:
                                                          'Products accepted'),
                                                  orderId: orderId,
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
                    ),
                    StaggeredGridTile.count(
                      crossAxisCellCount: 4,
                      mainAxisCellCount: 3,
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Palette.orangeColor),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: Flexible(
                          child: Column(
                            children: [
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
                              //TODO: wrap in customer verification cubit
                              BlocBuilder<CustomerVerificationCubit,
                                  CustomerVerificationState>(
                                builder: (context, state) {
                                  return CupertinoButton(
                                      child: const Text('Submit'),
                                      color: Palette.greenColor,
                                      onPressed: () {
                                        context
                                            .read<CustomerVerificationCubit>();
                                        AutoRouter.of(context).replace(
                                            MainHomeDeliveryExecutiveRoute());
                                      });
                                },
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      } else {
        return SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: StaggeredGrid.count(
                  crossAxisCount: 4,
                  mainAxisSpacing: 4,
                  crossAxisSpacing: 4,
                  children: [
                    // StaggeredGridTile.count(
                    //   crossAxisCellCount: 2,
                    //   mainAxisCellCount: 2,
                    //   child: Container(
                    //     // color: Palette.placeholderGrey,
                    //     decoration: BoxDecoration(
                    //         border: Border.all(color: Palette.orangeColor),
                    //         borderRadius:
                    //             BorderRadius.all(Radius.circular(20))),
                    //     child: Flexible(
                    //       child: Column(
                    //         children: [
                    //           // Text('CUSTOMER PHOTO'),
                    //           Center(
                    //             child: Padding(
                    //               padding: const EdgeInsets.all(40.0),
                    //               child: Row(
                    //                 children: [
                    //                   context
                    //                               .watch<PickImageCubit>()
                    //                               .state
                    //                               .path
                    //                               .length <
                    //                           2
                    //                       ? InkWell(
                    //                           onTap: () async {
                    //                             var x = await ImagePicker()
                    //                                 .pickImage(
                    //                                     source:
                    //                                         ImageSource.camera);
                    //                             context
                    //                                 .read<PickImageCubit>()
                    //                                 .emit(File(x!.path));
                    //                           },
                    //                           child: AnimatedContainer(
                    //                             duration:
                    //                                 const Duration(seconds: 3),
                    //                             height: 160,
                    //                             width: 200,
                    //                             // decoration: BoxDecoration(
                    //                             //     border: Border.all(width: 2)),
                    //                             child: Center(
                    //                               child: UserProfileAvatar(
                    //                                 avatarUrl: '',
                    //                                 onAvatarTap: () async {
                    //                                   ScaffoldMessenger.of(
                    //                                           context)
                    //                                       .showSnackBar(
                    //                                           SnackBar(
                    //                                     content: Text(
                    //                                         'Tapped on avatar'),
                    //                                   ));
                    //                                   var x = await ImagePicker()
                    //                                       .pickImage(
                    //                                           source:
                    //                                               ImageSource
                    //                                                   .camera);
                    //                                   context
                    //                                       .read<
                    //                                           PickImageCubit>()
                    //                                       .emit(File(x!.path));
                    //                                 },
                    //                                 // notificationCount: 10,
                    //                                 notificationBubbleTextStyle:
                    //                                     const TextStyle(
                    //                                   fontSize: 30,
                    //                                   color: Colors.white,
                    //                                   fontWeight:
                    //                                       FontWeight.bold,
                    //                                 ),
                    //                                 avatarSplashColor:
                    //                                     Colors.purple,
                    //                                 radius: 100,
                    //                                 isActivityIndicatorSmall:
                    //                                     false,
                    //                                 avatarBorderData:
                    //                                     AvatarBorderData(
                    //                                   borderColor:
                    //                                       Colors.black54,
                    //                                   borderWidth: 5.0,
                    //                                 ),
                    //                               ),
                    //                             ),
                    //                           ),
                    //                         )
                    //                       : InkWell(
                    //                           onTap: () async {
                    //                             var x = await ImagePicker()
                    //                                 .pickImage(
                    //                                     source:
                    //                                         ImageSource.camera);
                    //                             context
                    //                                 .read<PickImageCubit>()
                    //                                 .emit(File(x!.path));
                    //                           },
                    //                           child: Flexible(
                    //                             child: Image.file(
                    //                               context
                    //                                   .read<PickImageCubit>()
                    //                                   .state,
                    //                               height: 200,
                    //                               width: 200,
                    //                               fit: BoxFit.cover,
                    //                             ),
                    //                           ),
                    //                         ),
                    //                 ],
                    //               ),
                    //             ),
                    //           ),
                    //         ],
                    //       ),
                    //     ),
                    //   ),
                    // ),

                    StaggeredGridTile.count(
                      crossAxisCellCount: 2,
                      mainAxisCellCount: 1,
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Palette.orangeColor),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: BlocConsumer<DeOrderDetailsCubit,
                            DeOrderDetailsState>(
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
                          },
                          builder: (context, state) {
                            return state.maybeWhen(loading: () {
                              return const Center(
                                child: CupertinoActivityIndicator(
                                  color: Palette.greenColor,
                                ),
                              );
                            }, success: (generalDetails) {
                              return Flexible(
                                child: Column(
                                  children: [
                                    Text(
                                      'ORDER INFO',
                                      style: TextStyle(
                                          color: Palette.placeholderGrey,
                                          fontFamily: 'BOXICONS',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Order ID',
                                            style: TextStyle(
                                                color: Palette.placeholderGrey,
                                                fontFamily: 'BOXICONS',
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14),
                                          ),
                                          Text(
                                            generalDetails.order_id.toString(),
                                            style: TextStyle(
                                                color: Palette.placeholderGrey,
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Placed on',
                                            style: TextStyle(
                                                color: Palette.placeholderGrey,
                                                fontFamily: 'BOXICONS',
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14),
                                          ),
                                          Text(
                                            CalendarTime(DateTime.parse(
                                                    generalDetails.date_added!))
                                                .toHuman,
                                            style: TextStyle(
                                                color: Palette.placeholderGrey,
                                                fontFamily: 'BOXICONS',
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Flexible(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Delivered on',
                                              style: TextStyle(
                                                  color:
                                                      Palette.placeholderGrey,
                                                  fontFamily: 'BOXICONS',
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 14),
                                            ),
                                            Text(
                                              CalendarTime(DateTime.parse(
                                                      generalDetails
                                                          .delivery_date!))
                                                  .toHuman,
                                              style: TextStyle(
                                                  color:
                                                      Palette.placeholderGrey,
                                                  fontFamily: 'BOXICONS',
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 14),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Flexible(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text(
                                              'Payment Status',
                                              style: TextStyle(
                                                  color:
                                                      Palette.placeholderGrey,
                                                  fontFamily: 'BOXICONS',
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 14),
                                            ),
                                            generalDetails.paid! == 'N'
                                                //TODO: Add mpesa checkout
                                                ? CupertinoButton.filled(
                                                    minSize: 2,
                                                    onPressed: () {
                                                      AutoRouter.of(context)
                                                          .push(
                                                              MpesaPaymentRoute(
                                                                  data: {},
                                                                  orderReference:
                                                                      ''));
                                                    },
                                                    child:
                                                        const Text('Pay now'),
                                                  )
                                                : Row(
                                                    children: const [
                                                      Text(
                                                        'PAID',
                                                        style: TextStyle(
                                                            color: Palette
                                                                .greenColor,
                                                            fontFamily:
                                                                'BOXICONS',
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 14),
                                                      ),
                                                      SizedBox(
                                                        width: 10,
                                                      ),
                                                      Icon(
                                                        CupertinoIcons
                                                            .check_mark_circled_solid,
                                                        color:
                                                            Palette.greenColor,
                                                      ),
                                                    ],
                                                  )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }, orElse: () {
                              return Container();
                            });
                          },
                        ),
                      ),
                    ),
                    StaggeredGridTile.count(
                      crossAxisCellCount: 2,
                      mainAxisCellCount: 1,
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Palette.orangeColor),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: BlocConsumer<DeOrderDetailsCubit,
                            DeOrderDetailsState>(
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
                          },
                          builder: (context, state) {
                            return state.maybeWhen(loading: () {
                              return const Center(
                                child: CupertinoActivityIndicator(
                                  color: Palette.greenColor,
                                ),
                              );
                            }, success: (generalDetails) {
                              return Flexible(
                                child: Column(
                                  children: [
                                    const Text(
                                      'DELIVERY EXCECUTIVE DETAILS',
                                      style: TextStyle(
                                          color: Palette.placeholderGrey,
                                          fontFamily: 'BOXICONS',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'First Name',
                                            style: TextStyle(
                                                color: Palette.placeholderGrey,
                                                fontFamily: 'BOXICONS',
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14),
                                          ),
                                          Text(
                                            generalDetails.firstname!,
                                            style: TextStyle(
                                                color: Palette.placeholderGrey,
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text(
                                            'Last name',
                                            style: TextStyle(
                                                color: Palette.placeholderGrey,
                                                fontFamily: 'BOXICONS',
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14),
                                          ),
                                          Text(
                                            generalDetails.lastname!,
                                            style: const TextStyle(
                                                color: Palette.placeholderGrey,
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text(
                                            'Phone',
                                            style: TextStyle(
                                                color: Palette.placeholderGrey,
                                                fontFamily: 'BOXICONS',
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14),
                                          ),
                                          Text(
                                            generalDetails.telephone!,
                                            style: TextStyle(
                                                color: Palette.placeholderGrey,
                                                fontFamily: 'BOXICONS',
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }, orElse: () {
                              return Container();
                            });
                          },
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
                      mainAxisCellCount: 4,
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Palette.orangeColor),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: SingleChildScrollView(
                          physics: const NeverScrollableScrollPhysics(),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: 60,
                                  // padding: const EdgeInsets.only(left: 20, right: 8),
                                  padding: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                      color: Palette.greenColor,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: IntrinsicHeight(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
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
                                                    fontWeight:
                                                        FontWeight.bold),
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
                                                    fontWeight:
                                                        FontWeight.bold),
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
                                                  'Price',
                                                  maxLines: 1,
                                                  overflow: TextOverflow.fade,
                                                  softWrap: false,
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold),
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
                                                'Action Area',
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
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
                                                  acceptReject: AcceptReject(
                                                      status: 'A',
                                                      price:
                                                          odeDetailsList[index]
                                                              .price!
                                                              .toString(),
                                                      product_id:
                                                          odeDetailsList[index]
                                                              .product_id!
                                                              .toString(),
                                                      unit:
                                                          odeDetailsList[index]
                                                              .unit,
                                                      name:
                                                          odeDetailsList[index]
                                                              .name,
                                                      tax: odeDetailsList[index]
                                                          .tax!
                                                          .toString(),
                                                      total:
                                                          odeDetailsList[index]
                                                              .total
                                                              .toString(),
                                                      quantity:
                                                          odeDetailsList[index]
                                                              .quantity!
                                                              .toString(),
                                                      product_store_id:
                                                          odeDetailsList[index]
                                                              .product_store_id,
                                                      comment:
                                                          'Products accepted'),
                                                  orderId: orderId,
                                                ))
                                      ]),
                                    );
                                  },
                                  orElse: () {
                                    return Container();
                                  },
                                );
                              }),
                              const SizedBox(
                                height: 40,
                              ),
                              CupertinoButton(
                                  child: const Text('Submit'),
                                  color: Palette.greenColor,
                                  onPressed: () {
                                    // context.read<CustomerVerificationCubit>();
                                    AutoRouter.of(context).replace(
                                        MainHomeDeliveryExecutiveRoute());
                                  })
                            ],
                          ),
                        ),
                      ),
                    ),
                    // StaggeredGridTile.count(
                    //   crossAxisCellCount: 4,
                    //   mainAxisCellCount: 3,
                    //   child: Container(
                    //     decoration: BoxDecoration(
                    //         border: Border.all(color: Palette.orangeColor),
                    //         borderRadius:
                    //             BorderRadius.all(Radius.circular(20))),
                    //     child: Flexible(
                    //       child: Column(
                    //         children: [
                    //           const Text(
                    //             'Customer signature',
                    //             style: TextStyle(
                    //                 color: Palette.greenColor,
                    //                 fontSize: 20,
                    //                 fontFamily: 'Helvetica',
                    //                 fontWeight: FontWeight.bold),
                    //           ),
                    //           SizedBox(
                    //             width: MediaQuery.of(context).size.width,
                    //           ),
                    //           Container(
                    //             height: 200,
                    //             width: 300,
                    //             decoration: BoxDecoration(
                    //               color: Palette.greenColor,
                    //               border: Border.all(width: 1),
                    //               // borderRadius: BorderRadius.circular(30),
                    //             ),
                    //             //we can have the following cubits analyzed
                    //             child: Signature(
                    //               controller: SignatureController(),
                    //               height: 200,
                    //               width: 300,
                    //               backgroundColor: Colors.white,
                    //             ),
                    //           ),
                    //           const SizedBox(
                    //             height: 40,
                    //           ),
                    //           CupertinoButton(
                    //               child: const Text('Submit'),
                    //               color: Palette.greenColor,
                    //               onPressed: () {
                    //                 // context.read<CustomerVerificationCubit>();
                    //                 AutoRouter.of(context).replace(
                    //                     MainHomeDeliveryExecutiveRoute());
                    //               })
                    //         ],
                    //       ),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              )
            ],
          ),
        );
      }
    });
  }
}

class CardWidget extends StatefulWidget {
  final int orderId;
  final OdetailsDe deets;
  final AcceptReject acceptReject;

  final int index;
  const CardWidget({
    Key? key,
    required this.deets,
    required this.index,
    required this.acceptReject,
    required this.orderId,
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

  _displayDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return FormBuilder(
            key: _formKey,
            child: AlertDialog(
              title: Text('Add Packing Notes'),
              content: SizedBox(
                height: 200,
                child: Column(
                  children: [
                    FormBuilderTextField(
                      name: 'Packed_quantity ',
                      textInputAction: TextInputAction.go,
                      decoration: InputDecoration(hintText: "packed quantity"),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    FormBuilderTextField(
                      name: 'quantity_required',
                      controller: _textFieldController1,
                      textInputAction: TextInputAction.go,
                      decoration:
                          InputDecoration(hintText: "quantity required"),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    FormBuilderTextField(
                      name: 'comment',
                      controller: _textFieldController2,
                      textInputAction: TextInputAction.go,
                      decoration:
                          InputDecoration(hintText: "additional comments"),
                    ),
                  ],
                ),
              ),
              actions: <Widget>[
                CupertinoButton(
                  child: Text(
                    'Submit',
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.saveAndValidate()) {
                      context
                          .read<MissingCubit>()
                          .state
                          .add(Missing.fromJson(_formKey.currentState!.value));
                      context.read<AddMissingProductsCubitCubit>().addMissing(
                          products: context.read<MissingCubit>().state,
                          orderId: widget.orderId);
                      context.read<ProcessedItemsCubit>().state.add({
                        'order_id': widget.orderId,
                        'product_id': widget.deets.product_id,
                        'status': 'Missing'
                      });
                      Navigator.of(context).pop();
                    }
                  },
                )
              ],
            ),
          );
        });
  }

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
                  widget.deets.product_note ?? '',
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
                  children: [
                    Flexible(
                      child: DropdownButtonHideUnderline(
                        child: ButtonTheme(
                          alignedDropdown: true,
                          child: BlocBuilder<FetchOrderStatusCubit,
                              FetchOrderStatusState>(
                            builder: (context, state) {
                              return state.maybeWhen(orElse: () {
                                return Container();
                              }, loading: () {
                                return const CupertinoActivityIndicator();
                              }, success: (statuses) {
                                /// Make sure we have a value stored before displaying the text
                                return context
                                        .watch<ProcessedItemsCubit>()
                                        .state
                                        .where((element) =>
                                            element['order_id'] ==
                                                widget.orderId &&
                                            element['product_id'] ==
                                                widget.deets.product_id)
                                        .isNotEmpty
                                    ?

                                    /// Display the selected status if it's already there
                                    Text(context
                                        .watch<ProcessedItemsCubit>()
                                        .state
                                        .where((element) =>
                                            element['order_id'] ==
                                                widget.orderId &&
                                            element['product_id'] ==
                                                widget.deets.product_id)
                                        .first['status'])
                                    : FormBuilderDropdown<dynamic>(
                                        name: 'status',
                                        onChanged: (e) async {
                                          if (e == 'Accepted') {
                                            ///Accepted api call
                                            context
                                                .read<AcceptRejectCubit>()
                                                .actionArea(accept: [
                                              widget.acceptReject.copyWith(
                                                  status: 'A',
                                                  comment: 'Accept')
                                            ], orderId: widget.orderId);
                                            // TODO: This is a temporary solution
                                            context
                                                .read<ProcessedItemsCubit>()
                                                .state
                                                .add({
                                              'order_id': widget.orderId,
                                              'product_id':
                                                  widget.deets.product_id,
                                              'status': 'Accepted'
                                            });
                                          } else if (e == 'Rejected') {
                                            context
                                                .read<AcceptRejectCubit>()
                                                .actionArea(accept: [
                                              widget.acceptReject.copyWith(
                                                  status: 'R',
                                                  comment: 'Rejected')
                                            ], orderId: widget.orderId);
                                            context
                                                .read<ProcessedItemsCubit>()
                                                .state
                                                .add({
                                              'order_id': widget.orderId,
                                              'product_id':
                                                  widget.deets.product_id,
                                              'status': 'Rejected'
                                            });
                                          } else if (e == 'Missing') {
                                            /// Missing api call
                                            await _displayDialog(context);
                                            context
                                                .read<
                                                    AddMissingProductsCubitCubit>()
                                                .addMissing(
                                                    products: context
                                                        .read<MissingCubit>()
                                                        .state,
                                                    orderId: widget.orderId);
                                            context
                                                .read<ProcessedItemsCubit>()
                                                .state
                                                .add({
                                              'order_id': widget.orderId,
                                              'product_id':
                                                  widget.deets.product_id,
                                              'status': 'Missing'
                                            });
                                          }
                                        },
                                        isExpanded: true,
                                        items:
                                            ['Accepted', 'Rejected', 'Missing']
                                                .map((e) => DropdownMenuItem(
                                                    onTap: () {
                                                      // if (e == 'Fully-Packed') {
                                                      //   ///Accepted api call
                                                      //   context
                                                      //       .read<AcceptRejectCubit>()
                                                      //       .actionArea(accept: [
                                                      //     widget.acceptReject
                                                      //   ], orderId: widget.orderId);
                                                      // } else if (e == 'Rejected') {
                                                      //   /// Rejected api call

                                                      // } else if (e == 'Missing') {
                                                      //   /// Missing api call

                                                      // }
                                                    },
                                                    value: e,
                                                    child: Text(e)))
                                                .toList()
                                        // List.generate(
                                        // statuses.length,
                                        // (index) => DropdownMenuItem(
                                        // value: int.parse(statuses[index]
                                        // .order_status_id
                                        // .toString()),
                                        // child: Row(
                                        // children:
                                        // [
                                        // CircleAvatar(
                                        //   backgroundColor: Color(
                                        //       int.parse(
                                        //           '0xFF${statuses[index].color}')
                                        // ),
                                        // ),
                                        //   const SizedBox(
                                        //     width: 10,
                                        //   ),
                                        //   Text(
                                        //     statuses[index].name!,
                                        //     style: const TextStyle(
                                        //         color: Colors.red),
                                        //   ),
                                        // ],
                                        // ),
                                        // )),
                                        ,
                                        // onChanged: (value) async {
                                        //   await ApiService.post(data: {
                                        //     'order_status_id': value!,
                                        //     'order_id': widget.orderId
                                        //   }, path: 'op/orderStatus');
                                        //   AppToast.showToast(
                                        //       message: 'Success', isError: false);
                                        // },
                                        hint: const Text("Status"));
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
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
                        fit: BoxFit.fitHeight,
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
                    AutoRouter.of(context)
                        .replace(MainHomeDeliveryExecutiveRoute());
                  })
            ],
          ),
        ),
      ),
    );
  }
}
