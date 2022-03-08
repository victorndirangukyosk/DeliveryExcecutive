import 'package:auto_route/auto_route.dart';
import 'package:calendar_time/calendar_time.dart';
import 'package:delivery_app/configuration/configuration.dart';
import 'package:delivery_app/cubits/get_assigned_cubit/get_assigned_cubit.dart';
import 'package:delivery_app/cubits/cubits.dart';
// import 'package:delivery_app/cubits/my_orders_cubit.dart/my_orders_cubit.dart';
import 'package:delivery_app/models/order_details/order.dart';
import 'package:delivery_app/routes/router.gr.dart';
import 'package:delivery_app/user_interfaces/packing/items_processing/order_list.dart';
import 'package:delivery_app/user_interfaces/packing/my_orders_packing_person/my_orders_list.dart';
import 'package:delivery_app/user_interfaces/packing/my_orders_packing_person/my_orders_page.dart';
import 'package:delivery_app/user_interfaces/packing/my_orders_packing_person/product_list.dart';

import 'package:delivery_app/user_interfaces/packing/order_summary/order_summary.dart';
import 'package:delivery_app/user_interfaces/packing/scanner/scanner.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainHomePage extends StatelessWidget {
  const MainHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      const HomeIconPagePacking(),
      // const HomeIconPagedelivery(),
      const OrderList(),
      Scanner(),
      const OrderSummary(),
      const Dispatch(),
    ];

    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        bottomNavigationBar: CupertinoTabBar(
            currentIndex: context.watch<HomeBottomNavigationIndexCubit>().state,
            onTap: (val) {
              context.read<HomeBottomNavigationIndexCubit>().emit(val);
            },
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home)),
              BottomNavigationBarItem(
                  icon: Icon(Icons.check_box_outline_blank)),
              BottomNavigationBarItem(icon: Icon(Icons.qr_code_scanner_sharp)),
              // ignore: todo
              //TODO: get corresponding icons for each of these
              BottomNavigationBarItem(icon: Icon(Icons.check_box_rounded)),
              BottomNavigationBarItem(
                  icon: Icon(Icons.delivery_dining_rounded)),
            ]),
        body: Stack(
          children: [
            const Positioned(
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
            Positioned(
                top: 20,
                right: 20,
                child: GestureDetector(
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
                                          const Text('Samuel Baraka'),
                                          const Text(
                                              'sababuvercetti@gmail.com'),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          ListTile(
                                            onTap: () {},
                                            leading: const Icon(Icons.history),
                                            title: const Text('Order history'),
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
                                              style:
                                                  TextStyle(color: Colors.red),
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
                )),
            Positioned(
              left: 20,
              top: 120,
              right: 20,
              bottom: 20,
              child:
                  pages[context.watch<HomeBottomNavigationIndexCubit>().state],
            ),
          ],
        ));
  }
}

class SingleOrderWidget extends StatelessWidget {
  final Order order;
  const SingleOrderWidget({Key? key, required this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(8)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 12,
            ),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Palette.orangeBackgroundColor),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Order',
                        style: TextStyle(
                            color: Palette.placeholderGrey, fontSize: 14),
                      ),
                      Text(
                        order.order_id!,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Status',
                        style: TextStyle(
                            color: Palette.placeholderGrey, fontSize: 14),
                      ),
                      Text(
                        order.status!,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Date of Order',
                        style: TextStyle(
                            color: Palette.placeholderGrey, fontSize: 14),
                      ),
                      Text(
                        order.date_added!,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              'Vendor',
              style: TextStyle(color: Palette.placeholderGrey, fontSize: 14),
            ),
            Text(
              order.order_company!,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 12,
            ),
            Row(
              children: [
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Order Amount',
                      style: TextStyle(
                          color: Palette.placeholderGrey, fontSize: 14),
                    ),
                    Text(
                      order.total!,
                      style: TextStyle(
                          color: Palette.orangeColor,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                )),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Order Quantity',
                      style: TextStyle(
                          color: Palette.placeholderGrey, fontSize: 14),
                    ),
                    Text(
                      '${order.products} Items',
                      style: TextStyle(
                          color: Palette.orangeColor,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                )),
              ],
            ),
            SizedBox(
              height: 12,
            ),
            CupertinoButton(
                child: Text('View Details'),
                padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                color: Palette.orangeColor,
                onPressed: () {
                  AutoRouter.of(context).push(SingleOrderRoute());
                }),
            SizedBox(
              height: 12,
            ),
          ],
        ),
      ),
    );
  }
}

class HomeIconPagedelivery extends StatefulWidget {
  const HomeIconPagedelivery({Key? key}) : super(key: key);

  @override
  _HomeIconPageState createState() => _HomeIconPageState();
}

class _HomeIconPageState extends State<HomeIconPagedelivery> {
  @override
  Widget build(BuildContext context) {
    context.read<GetAssignedCubit>().getAssignedOrders();
    return Scaffold(
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CupertinoButton(
              onPressed: () {},
              padding: const EdgeInsets.all(0),
              child: Container(
                padding: const EdgeInsets.only(left: 20, right: 8),
                decoration: BoxDecoration(
                    color: Palette.greenColor,
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  children: [
                    const Text(
                      'My Deliveries',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    const Expanded(child: SizedBox()),
                    CupertinoButton(
                        padding: const EdgeInsets.all(0),
                        child: const Icon(
                          Icons.arrow_forward_ios,
                          size: 25,
                          color: Colors.white,
                        ),
                        onPressed: () {}),
                  ],
                ),
              ),
            ),
            Row(
              children: [
                const Text(
                  'My Orders',
                  style: TextStyle(
                      fontSize: 16,
                      color: Palette.greenColor,
                      fontWeight: FontWeight.bold),
                ),
                const Expanded(child: SizedBox()),
                TextButton(
                    onPressed: () async {
                      var x = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1970),
                          lastDate: DateTime.now());
                      if (CalendarTime(x).isToday) {
                        context.read<SelectDateCubit>().emit(DateTime.now());
                      } else {
                        context.read<SelectDateCubit>().emit(x!);
                      }
                    },
                    child: Text(
                        CalendarTime(context.watch<SelectDateCubit>().state)
                            .toHuman
                            .replaceFirst('at 12:00 AM', '')))
              ],
            ),
            const Expanded(
              child: MyOrdersList(),
            ),
            Positioned(
                bottom: 100,
                left: 0,
                right: 0,
                child: CupertinoButton(
                  onPressed: () {
                    AutoRouter.of(context).push(const DirectionsToAddress());
                  },
                  child: Card(
                    elevation: 10,
                    shape: const CircleBorder(),
                    child: CircleAvatar(
                        radius: 60,
                        backgroundColor: Palette.greenColor,
                        child: Center(
                            child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SvgPicture.asset(
                              'assets/gis_route.svg',
                              height: 50,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              'Start trip',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ))),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}

class Dispatch extends StatefulWidget {
  const Dispatch({Key? key}) : super(key: key);

  @override
  _DispatchState createState() => _DispatchState();
}

class _DispatchState extends State<Dispatch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        const Positioned(
          left: 200,
          right: 200,
          top: 200,
          child: Center(
            child: SpinKitCircle(
              color: Palette.greenColor,
            ),
          ),
        ),
        const Positioned(
          top: 100,
          right: 0,
          left: 0,
          child: Center(
            child: Text.rich(TextSpan(
                text: 'Kwik ',
                style: TextStyle(
                    fontSize: 60,
                    fontWeight: FontWeight.w900,
                    color: Palette.orangeColor),
                children: [
                  TextSpan(
                      text: 'Delivery',
                      style: TextStyle(color: Palette.greenColor))
                ])),
          ),
        ),
        Positioned(
            left: 0,
            right: 0,
            bottom: -10,
            child: Image.asset(
              'assets/truck_image.png',
              width: MediaQuery.of(context).size.width + 20,
            )),
        const Positioned(
          left: 480,
          right: 0,
          bottom: 120,
          child: Text(
            'READY FOR DISPATCH',
            style: TextStyle(
                fontSize: 35,
                color: Palette.orangeColor,
                fontWeight: FontWeight.bold),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              // primary: Colors.black,
              minimumSize: const Size.fromHeight(50), // NEW
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProductList()),
              );
            },
            child: const Text(
              'Dispatch',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        )
      ],
    ));
  }
}
