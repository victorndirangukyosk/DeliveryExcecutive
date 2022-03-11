import 'package:auto_route/auto_route.dart';
import 'package:calendar_time/calendar_time.dart';
import 'package:delivery_app/configuration/configuration.dart';
import 'package:delivery_app/configuration/palette/palette.dart';
import 'package:delivery_app/cubits/get_assigned_cubit/get_assigned_cubit.dart';
import 'package:delivery_app/cubits/order_details_cubit/order_details_cubit.dart';
import 'package:delivery_app/models/assigned/assigned_order.dart';
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
          backgroundColor: Palette.orangeBackgroundColor,
          title: const Text(
            'My Orders',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                fontFamily: 'Red Hat Display',
                color: Colors.black),
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
    return Container(
        margin: const EdgeInsets.all(30.0),
        decoration: const BoxDecoration(
          color: Palette.orangeBackgroundColor,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30.0),
            bottomLeft: Radius.circular(30.0),
          ),
        ),
        height: 200,
        child: Column(children: [
          Expanded(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                Column(children: [
                  const Text(
                    "Order Id",
                    style: TextStyle(
                      fontFamily: 'Red Hat Display',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Palette.orangeColor,
                    ),
                  ),
                  Text(
                    order.order_id!.toString(),
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Palette.placeholderGrey,
                      // color: Colors.orange,
                    ),
                  ),
                  Spacer(),
                  const Text(
                    "Order Status",
                    style: TextStyle(
                        fontFamily: 'Red Hat Display',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Palette.orangeColor),
                  ),
                  Text(
                    order.order_status!.toString(),
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Palette.placeholderGrey,
                    ),
                  )
                ]),
                const SizedBox(width: 20),
                Column(children: [
                  const Text(
                    'Number of Products',
                    style: TextStyle(
                        fontFamily: 'Red Hat Display',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Palette.orangeColor),
                  ),
                  Text(
                    order.products_count!.toString(),
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Palette.placeholderGrey,
                    ),
                  ),
                  Spacer(),
                  Text(
                    "Date of Delivery",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Palette.orangeColor,
                      fontFamily: 'Red Hat Display',
                    ),
                  ),
                  Text(
                    // order.delivery_date!,
                    CalendarTime(DateTime.parse(order.delivery_date!)).toHuman,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Palette.placeholderGrey,
                    ),
                  )
                ]),
                const SizedBox(width: 20),
                Column(children: [
                  Text(
                    "Time of Delivery",
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Red Hat Display',
                      fontWeight: FontWeight.bold,
                      color: Palette.orangeColor,
                    ),
                  ),
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
              ])),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              // primary: Colors.black,
              minimumSize: const Size.fromHeight(50), // NEW
            ),
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
        ]));
  }
}

