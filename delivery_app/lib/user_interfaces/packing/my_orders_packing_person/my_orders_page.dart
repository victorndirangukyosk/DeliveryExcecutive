import 'package:auto_route/auto_route.dart';
import 'package:calendar_time/calendar_time.dart';
import 'package:delivery_app/configuration/configuration.dart';
import 'package:delivery_app/configuration/palette/palette.dart';
import 'package:delivery_app/cubits/get_assigned_cubit/op/get_assigned_cubit.dart';
import 'package:delivery_app/cubits/order_details_cubit/order_details_cubit.dart';
import 'package:delivery_app/models/assigned/op/assigned_order.dart';
// import 'package:delivery_app/cubits/my_orders_cubit.dart/my_orders_cubit.dart';
import 'package:delivery_app/models/order_details/order.dart';
import 'package:delivery_app/models/order_details/order_details.dart';
import 'package:delivery_app/routes/router.gr.dart';
import 'package:delivery_app/user_interfaces/home/main_home_page.dart';
import 'package:delivery_app/user_interfaces/packing/my_orders_packing_person/order_details_page.dart';
import 'package:delivery_app/user_interfaces/packing/scanner/scanner.dart';
import 'package:delivery_app/utilities/toast/toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../../cubits/order_details_list/odetails_list_cubit.dart';

class HomeIconPagePacking extends StatefulWidget {
  const HomeIconPagePacking({Key? key}) : super(key: key);

  @override
  _HomeIconPagePackingState createState() => _HomeIconPagePackingState();
}

class _HomeIconPagePackingState extends State<HomeIconPagePacking> {
  @override
  Widget build(BuildContext context) {
    context.read<GetAssignedCubit>().getAssignedOrders();
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          elevation: 0,
          backgroundColor: Palette.greenColor,
          title: const Text(
            'My Orders',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                fontFamily: 'Red Hat Display',
                color: Colors.white),
          ),
        ),
        body: BlocConsumer<GetAssignedCubit, GetAssignedState>(
          listener: (context, state) {
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
                child: SpinKitDualRing(color: Palette.greenColor),
              );
            }, success: (orders) {
              return SingleChildScrollView(
                child: Column(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    // children: List.generate(100, (index) => CardWidget())),
                    children: List.generate(
                        orders.length,
                        (index) => CardWidget(
                              order: orders[index],
                            ))),
              );
            }, orElse: () {
              return Container();
            });
          },
        )
        //   padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
        //   child: BlocConsumer<MyOrdersCubit, MyOrdersState>(
        //     listener: (context, state) {
        //       state.maybeWhen(
        //           orElse: () {},
        //           failed: (error) {
        //             AppToast.showToast(message: error, isError: true);
        //           });
        //     },
        //     builder: (context, state) {
        //       return state.maybeWhen(
        //           loading: () => const Center(
        //                 child: SpinKitSpinningLines(
        //                   color: Palette.greenColor,
        //                 ),
        //               ),
        //           success: (orders) {
        //             return CustomScrollView(
        //               physics: const BouncingScrollPhysics(
        //                   parent: AlwaysScrollableScrollPhysics()),
        //               slivers: [
        //                 CupertinoSliverRefreshControl(
        //                   refreshTriggerPullDistance: 200,
        //                   onRefresh: () {
        //                     return context.read<MyOrdersCubit>().getMyOrders();
        //                   },
        //                 ),
        //                 SliverList(
        //                     delegate:
        //                         SliverChildBuilderDelegate((context, index) {
        //                   return SingleOrderWidget(order: orders[index]);
        //                 }, childCount: orders.length)),
        //               ],
        //             );
        //           },
        //           orElse: () {
        //             return Container();
        //           });
        //     },
        //   ),
        // ),

        );
  }
}

class CardWidget extends StatelessWidget {
  final AssignedOrder order;
  const CardWidget({Key? key, required this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(16.0)),
      child: FittedBox(
        child: Container(
            margin: const EdgeInsets.all(30.0),
            decoration: BoxDecoration(
                // color: Palette.orangeBackgroundColor,
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(30.0),
                    bottomLeft: Radius.circular(30.0),
                    bottomRight: Radius.circular(30.0),
                    topLeft: Radius.circular(30.0)),
                border: Border.all(width: 1, color: Colors.black)),
            constraints: const BoxConstraints(
              maxHeight: double.infinity,
            ),
            child: Column(children: [
              Container(
                height: height / 6,
                width: width,
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    // mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                          child: Column(children: [
                        Row(
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          // mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const Text(
                              "Order Id",
                              style: TextStyle(
                                fontFamily: 'Red Hat Display',
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Palette.orangeColor,
                              ),
                            ),
                            SizedBox(width: width * 0.01),
                            Text(
                              order.order_id!.toString(),
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Palette.placeholderGrey,
                                // color: Colors.orange,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: height * 0.02),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(width: width * 0.01),
                            const Text(
                              "Order Status",
                              style: TextStyle(
                                  fontFamily: 'Red Hat Display',
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Palette.orangeColor),
                            ),
                            SizedBox(width: width * 0.01),
                            Text(
                              order.order_status!.toString(),
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Palette.placeholderGrey,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: height * 0.02),
                        Row(
                          children: [
                            const Text(
                              'Number of Products',
                              style: TextStyle(
                                  fontFamily: 'Red Hat Display',
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Palette.orangeColor),
                            ),
                            SizedBox(width: width * 0.01),
                            Text(
                              order.products_count!.toString(),
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Palette.placeholderGrey,
                              ),
                            ),
                          ],
                        )
                      ])),
                      Container(
                          child: Column(
                        children: [
                          Row(
                            children: [
                              const Text(
                                'Date of Delivery',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Palette.orangeColor,
                                  fontFamily: 'Red Hat Display',
                                ),
                              ),
                              SizedBox(width: width * 0.01),
                              Text(
                                // order.delivery_date!,
                                CalendarTime(
                                        DateTime.parse(order.delivery_date!))
                                    .toHuman,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Palette.placeholderGrey,
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: height * 0.02),
                          Row(children: [
                            const Text(
                              "Time of Delivery",
                              style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'Red Hat Display',
                                fontWeight: FontWeight.bold,
                                color: Palette.orangeColor,
                              ),
                            ),
                            SizedBox(width: width * 0.01),
                            Text(
                              order.delivery_timeslot!,
                              // CalendarTime(DateTime.parse(order.delivery_timeslot!))
                              //     .toHuman,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Palette.placeholderGrey,
                              ),
                            )
                          ]),
                        ],
                      )),
                    ]),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    // width: width,
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: CupertinoButton.filled(
                        // style: ElevatedButton.styleFrom(
                        //   // primary: Colors.black,
                        //   minimumSize: const Size.fromHeight(50), // NEW
                        // ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => OrderDetailsPage(
                                      orderId: order.order_id!,
                                    )),
                          );
                        },
                        child: const Text(
                          'Start Processing ',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ])),
      ),
    );
  }
}
