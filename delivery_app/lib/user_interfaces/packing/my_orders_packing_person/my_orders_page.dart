import 'package:auto_route/auto_route.dart';
import 'package:calendar_time/calendar_time.dart';
import 'package:delivery_app/configuration/configuration.dart';
import 'package:delivery_app/configuration/palette/palette.dart';
import 'package:delivery_app/cubits/get_assigned_cubit/op/get_assigned_cubit.dart';

import 'package:delivery_app/models/assigned/op/assigned_order.dart';
// import 'package:delivery_app/cubits/my_orders_cubit.dart/my_orders_cubit.dart';

import 'package:delivery_app/user_interfaces/packing/my_orders_packing_person/order_details_page.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

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
          toolbarHeight: 15,
          flexibleSpace: Container(
            height: 40,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: Palette.greenColor,
                borderRadius: BorderRadius.circular(10)),
            child: IntrinsicHeight(
              child: Row(
                // crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Text(
                    'My orders',
                    maxLines: 1,
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontFamily: 'Helvetica',
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),

          // iconTheme: IconThemeData(color: Colors.black),
          // elevation: 0,
          // backgroundColor: Palette.greenColor,
          // title: const Text(
          //   'My Orders',
          //   style: TextStyle(
          //       fontWeight: FontWeight.bold,
          //       fontSize: 24,
          //       fontFamily: 'Red Hat Display',
          //       color: Colors.white),
          // ),
        ),
        body: BlocBuilder<GetAssignedCubit, GetAssignedState>(
          builder: (context, state) {
            return state.maybeWhen(loading: () {
              return const Center(
                child: CupertinoActivityIndicator(color: Palette.greenColor),
              );
            },
             success: (orders) {
              return LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  if (constraints.maxWidth <= 600) {
                    return AnimationLimiter(
                      child: ListView.builder(
                          itemCount: orders!.length,
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(
                              parent: AlwaysScrollableScrollPhysics()),
                          itemBuilder: (BuildContext context, index) {
                            return AnimationConfiguration.staggeredList(
                              position: index,
                              duration: const Duration(milliseconds: 500),
                              child: SlideAnimation(
                                verticalOffset: 50.0,
                                child: FadeInAnimation(
                                  child: CardTwo(
                                    order: orders[index],
                                  ),
                                ),
                              ),
                            );
                          }),
                    );
                  } else {
                    return GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 9 / 2,
                                crossAxisSpacing: 5,
                                mainAxisSpacing: 5),
                        itemCount: orders!.length,
                        itemBuilder: (BuildContext ctx, index) {
                          return CardWidget(
                            order: orders[index],
                          );
                        });
                  }
                },
              );
            }, orElse: () {
              return Container();
            });
          },
        ));
  }
}

class CardTwo extends StatelessWidget {
  final AssignedOrder order;
  const CardTwo({Key? key, required this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return FittedBox(
      child: Container(
          margin: const EdgeInsets.all(30.0),
          decoration: BoxDecoration(
              // color: Palette.orangeBackgroundColor,
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(10.0),
                  bottomLeft: Radius.circular(10.0),
                  bottomRight: Radius.circular(10.0),
                  topLeft: Radius.circular(10.0)),
              border: Border.all(width: 1, color: Colors.black)),
          constraints: const BoxConstraints(
            maxHeight: double.infinity,
            maxWidth: double.infinity,
          ),
          child: Column(children: [
            Container(
              padding: const EdgeInsets.all(8),
              height: height / 5,
              // width: width,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 8.0, bottom: 16.0, top: 16.0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                // crossAxisAlignment: CrossAxisAlignment.start,
                                // mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
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
                                // crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  // SizedBox(width: width * 0.01),
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
                              // SizedBox(height: height * 0.02),
                            ]),
                      ),
                      const SizedBox(width: 20),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16.0, top: 16.0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
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
                              ),
                              Spacer(),
                              Align(
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
                                          builder: (context) =>
                                              OrderDetailsPage(
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
                            ]),
                      ),
                      const SizedBox(width: 20),
                      Padding(
                        padding: const EdgeInsets.only(
                            right: 8.0, bottom: 16.0, top: 16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          // crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              children: [
                                const Text(
                                  'Date of Delivery',
                                  overflow: TextOverflow.fade,
                                  maxLines: 1,
                                  softWrap: false,
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
                                  overflow: TextOverflow.ellipsis,
                                  softWrap: true,
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
                        ),
                      ),
                    ]),
              ),
            ),
          ])),
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

    return FittedBox(
      child: Container(
          margin: const EdgeInsets.all(30.0),
          decoration: BoxDecoration(
              // color: Palette.orangeBackgroundColor,
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(10.0),
                  bottomLeft: Radius.circular(10.0),
                  bottomRight: Radius.circular(10.0),
                  topLeft: Radius.circular(10.0)),
              border: Border.all(width: 1, color: Colors.black)),
          constraints: const BoxConstraints(
            maxHeight: double.infinity,
            maxWidth: double.infinity,
          ),
          child: Column(children: [
            Container(
              padding: const EdgeInsets.all(8),
              height: height / 4,
              // width: width,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 8.0, bottom: 16.0, top: 16.0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                // crossAxisAlignment: CrossAxisAlignment.start,
                                // mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
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
                                // crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  // SizedBox(width: width * 0.01),
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
                              // SizedBox(height: height * 0.02),
                            ]),
                      ),
                      const SizedBox(width: 20),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16.0, top: 16.0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
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
                              ),
                              Spacer(),
                              Align(
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
                                          builder: (context) =>
                                              OrderDetailsPage(
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
                            ]),
                      ),
                      const SizedBox(width: 20),
                      Padding(
                        padding: const EdgeInsets.only(
                            right: 8.0, bottom: 16.0, top: 16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          // crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              children: [
                                const Text(
                                  'Date of Delivery',
                                  overflow: TextOverflow.fade,
                                  maxLines: 1,
                                  softWrap: false,
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
                                  overflow: TextOverflow.ellipsis,
                                  softWrap: true,
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
                        ),
                      ),
                    ]),
              ),
            ),
          ])),
    );
  }
}
