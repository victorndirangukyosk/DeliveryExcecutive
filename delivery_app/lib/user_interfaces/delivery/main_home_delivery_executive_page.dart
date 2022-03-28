import 'package:auto_route/auto_route.dart';
import 'package:calendar_time/calendar_time.dart';
import 'package:delivery_app/configuration/palette/palette.dart';
import 'package:delivery_app/cubits/authentication/token_cubit.dart';
import 'package:delivery_app/cubits/get_assigned_cubit/de/cubit/assigned_de_cubit.dart';
import 'package:delivery_app/models/assigned/de/assigned_de.dart';
import 'package:delivery_app/routes/router.gr.dart';

import 'package:delivery_app/user_interfaces/packing/my_orders_packing_person/order_details_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainHomeDeliveryExecutivePage extends StatelessWidget {
  const MainHomeDeliveryExecutivePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<AssignedDeCubit>().getAssignedDeOrders();
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            iconTheme: IconThemeData(color: Colors.black),
            elevation: 0,
            leading: Icon(
              Icons.menu,
              color: Palette.greenColor,
            ),
            backgroundColor: Colors.white,
            title: const Positioned(
                top: 30,
                child: Text.rich(TextSpan(
                    text: 'Kwik ',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w900,
                        color: Palette.orangeColor),
                    children: [
                      TextSpan(
                          text: 'Delivery',
                          style: TextStyle(color: Palette.greenColor))
                    ])),
                left: 20),
            actions: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      HapticFeedback.heavyImpact();
                    },
                    child: Material(
                      color: Colors.transparent,
                      child: CupertinoButton(
                          onPressed: () {
                            showCupertinoModalPopup(
                                context: context,
                                builder: (context) => Center(
                                        child: SizedBox(
                                      // height: 100/,
                                      width: 300,
                                      child: Card(
                                        elevation: 0,
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            const CircleAvatar(
                                              radius: 58,
                                              backgroundColor:
                                                  Palette.orangeColor,
                                              child: CircleAvatar(
                                                radius: 54,
                                                backgroundColor: Colors.white,
                                                child: CircleAvatar(
                                                  radius: 50,
                                                  backgroundImage: NetworkImage(
                                                      'https://th.bing.com/th/id/R.a5758d6fb64904904ec75fd1f083e3fb?rik=QVwaYy2Fd7Xi%2fA&pid=ImgRaw&r=0'),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            const Text('Stalluri'),
                                            const Text('stalluri@gmail.com'),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            ListTile(
                                              onTap: () {},
                                              leading:
                                                  const Icon(Icons.history),
                                              title:
                                                  const Text('Order history'),
                                              trailing: const Icon(
                                                  CupertinoIcons.forward),
                                              subtitle: const Text(
                                                  'View order history'),
                                            ),
                                            ListTile(
                                              onTap: () {},
                                              leading: const Icon(
                                                  CupertinoIcons.settings),
                                              title: const Text('Settings'),
                                              trailing: const Icon(
                                                  CupertinoIcons.forward),
                                              subtitle: const Text(
                                                  'Application settings'),
                                            ),
                                            ListTile(
                                              onTap: () {
                                                // Clear the token
                                                context
                                                    .read<TokenCubit>()
                                                    .clear();
                                                AutoRouter.of(context).replace(
                                                    const SplashScreen());
                                              },
                                              leading: const Icon(
                                                Icons.logout_outlined,
                                                color: Palette.greenColor,
                                              ),
                                              title: const Text(
                                                'Logout',
                                                style: TextStyle(
                                                    color: Colors.red),
                                              ),
                                              trailing: const Icon(
                                                CupertinoIcons.forward,
                                                color: Palette.greenColor,
                                              ),
                                              subtitle: const Text(
                                                'Logout of this application',
                                              ),
                                            ),
                                            ListTile(
                                              onTap: () {
                                                showAboutDialog(
                                                  context: context,
                                                  applicationIcon: Image.asset(
                                                      'assets/logo.png',
                                                      height: 30),
                                                );
                                              },
                                              leading: const Icon(
                                                CupertinoIcons.info,
                                                color: Palette.greenColor,
                                              ),
                                              title: const Text(
                                                "About",
                                                style: TextStyle(
                                                    color: Palette.greenColor),
                                              ),
                                              trailing: const Icon(
                                                CupertinoIcons.forward,
                                                color: Palette.greenColor,
                                              ),
                                              subtitle: const Text(
                                                'About this application',
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 20,
                                            )
                                          ],
                                        ),
                                      ),
                                    )));
                          },
                          child: const Center(
                              child: Icon(
                            Icons.dehaze,
                            size: 40,
                            color: Palette.orangeColor,
                          ))),
                    ),
                  ),
                ],
              ),
            ]),
        body: BlocConsumer<AssignedDeCubit, AssignedDeState>(
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
        }, builder: (context, state) {
          return state.maybeWhen(
            loading: () {
              return const Center(
                child: CupertinoActivityIndicator(color: Palette.greenColor),
              );
            },
            success: (ordersde) {
              return Column(
                children: [
                  Container(
                    height: 40,
                    padding: const EdgeInsets.only(left: 20, right: 8),
                    decoration: BoxDecoration(
                        color: Palette.greenColor,
                        borderRadius: BorderRadius.circular(10)),
                    child: IntrinsicHeight(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  'My orders',
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                      fontFamily: 'Helvetica',
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          const VerticalDivider(),
                          Expanded(
                            child: Column(
                              children: [
                                // Text(
                                //   'Quantity',
                                //   style: TextStyle(
                                //       fontSize: 18,
                                //       color: Colors.white,
                                //       fontWeight: FontWeight.bold),
                                // ),
                              ],
                            ),
                          ),
                          const VerticalDivider(),
                          Expanded(
                            child: Column(
                              children: [
                                // Flexible(
                                //   child: Text(
                                //     'Specifications',
                                //     style: TextStyle(
                                //         fontSize: 18,
                                //         color: Colors.white,
                                //         fontWeight: FontWeight.bold),
                                //   ),
                                // ),
                              ],
                            ),
                          ),
                          const VerticalDivider(),
                          Expanded(
                            child: Column(
                              children: [
                                // Text(
                                //   'Action area',
                                //   style: TextStyle(
                                //       fontSize: 18,
                                //       color: Colors.white,
                                //       fontWeight: FontWeight.bold),
                                // ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Stack(
                      children: [
                        SingleChildScrollView(
                          child: Container(
                            child: Column(
                                // mainAxisAlignment: MainAxisAlignment.center,
                                // children: List.generate(100, (index) => CardWidget())),
                                children: [
                                  ...List.generate(
                                      ordersde.length,
                                      (index) => CardWidget(
                                            orderde: ordersde[index],
                                          ))
                                ]),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
            orElse: () {
              return Container();
            },
          );
        }));
  }
}

class CardWidget extends StatelessWidget {
  final AssignedDe orderde;
  const CardWidget({Key? key, required this.orderde}) : super(key: key);

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
                              orderde.order_id!.toString(),
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
                              orderde.order_status!.toString(),
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
                              orderde.products_count!.toString(),
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
                                        DateTime.parse(orderde.delivery_date!))
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
                              orderde.delivery_timeslot!,
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
                          AutoRouter.of(context).push(DirectionsToAddress(
                            orderId: orderde.order_id!,
                          ));
                        },
                        child: const Text(
                          'Start Trip ',
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
