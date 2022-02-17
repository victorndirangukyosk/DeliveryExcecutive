import 'package:auto_route/auto_route.dart';
import 'package:calendar_time/calendar_time.dart';
import 'package:delivery_app/configuration/configuration.dart';
import 'package:delivery_app/cubits/cubits.dart';
import 'package:delivery_app/cubits/my_orders_cubit.dart/my_orders_cubit.dart';
import 'package:delivery_app/models/order/order.dart';
import 'package:delivery_app/routes/router.gr.dart';
import 'package:delivery_app/user_interfaces/my_orders_packing_person/my_orders_list.dart';
import 'package:delivery_app/user_interfaces/my_orders_packing_person/my_orders_page.dart';
import 'package:delivery_app/user_interfaces/order_summary/order_summary.dart';
import 'package:delivery_app/utilities/toast/toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MainHomePage extends StatelessWidget {
  const MainHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      const HomeIconPagePacking(),
      // const HomeIconPagedelivery(),
      const Scanner(),
      const OrderList(),
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
              BottomNavigationBarItem(icon: Icon(Icons.qr_code_scanner_sharp)),
              BottomNavigationBarItem(
                  icon: Icon(Icons.check_box_outline_blank)),
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
    return Container(
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
    );
  }
}

class Scanner extends StatefulWidget {
  const Scanner({Key? key}) : super(key: key);

  @override
  _ScannerState createState() => _ScannerState();
}

class _ScannerState extends State<Scanner> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  late QRViewController controller;
  TextEditingController textarea = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   title: Text("Scanner"),
        // ),
        resizeToAvoidBottomInset: false,
        body: SafeArea(
            child: Center(
          child: Stack(
            children: [
              Column(
                children: <Widget>[
                  Expanded(
                    flex: 5,
                    child: Stack(
                      children: [
                        QRView(
                          key: qrKey,
                          onQRViewCreated: _onQRViewCreated,
                        ),
                        Center(
                          child: Container(
                            width: 300,
                            height: 300,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Palette.orangeColor,
                                width: 4,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const Expanded(
                    flex: 1,
                    child: Center(
                      child: TextField(
                        // ignore: todo
                        //TODO:CORRECT THIS CONTROLLER ERROR
                        // controller: textarea,
                        keyboardType: TextInputType.multiline,
                        maxLines: 5,
                        decoration: InputDecoration(
                            hintText: 'Notes',
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                              width: 5,
                              color: Palette.orangeColor,
                            ))),
                      ),
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        print(textarea.text);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: <Widget>[
                          const Text('CONTINUE'),
                          const Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                          )
                        ],
                      ))
                ],
              ),
            ],
          ),
        )));
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) async {
      controller.pauseCamera();
      if (await canLaunch(scanData.code!)) {
        await launch(scanData.code!);
        controller.resumeCamera();
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Could not find viable url'),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    Text('Barcode Type: ${describeEnum(scanData.format)}'),
                    Text('Data: ${scanData.code}'),
                  ],
                ),
              ),
              actions: <Widget>[
                TextButton(
                  child: Text('Ok'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        ).then((value) => controller.resumeCamera());
      }
    });
  }
}

class OrderList extends StatefulWidget {
  const OrderList({Key? key}) : super(key: key);

  @override
  _OrderListState createState() => _OrderListState();
}

class Item {
  const Item(this.name, this.icon);
  final String name;
  final Icon icon;
}

class _OrderListState extends State<OrderList> {
  TextEditingController textarea = TextEditingController();
  List<Item> users = [
    const Item('Fully Packed', Icon(FontAwesomeIcons.dolly)),
    const Item('Not Good/Damaged products', Icon(FontAwesomeIcons.question)),
    const Item('Not Available', Icon(FontAwesomeIcons.minusCircle)),
    const Item('Information Recording', Icon(FontAwesomeIcons.edit)),
  ];

  final List<String> quantity = <String>[
    '1 Kg',
    '3Kg',
    '10kg',
    '1kg',
    '1kg',
    '3Kg',
    '10kg',
    '1kg',
    '1 Kg',
    '3Kg',
    '10kg',
    '1kg',
    '1kg',
    '3Kg',
    '10kg',
    '1kg',
    '1 Kg',
    '3Kg',
    '10kg',
    '1kg',
    '1kg',
    '3Kg',
    '10kg',
    '1kg',
    '1 Kg',
    '3Kg',
    '10kg',
    '1kg',
    '1kg',
    '3Kg',
    '10kg',
    '1kg',
    '1 Kg',
    '3Kg',
    '10kg',
    '1kg',
    '1kg',
    '3Kg',
    '10kg',
    '1kg',
    '1 Kg',
    '3Kg',
    '10kg',
    '1kg',
    '1kg',
    '3Kg',
    '10kg',
    '1kg',
    '1 Kg',
    '3Kg',
    '10kg',
    '1kg',
    '1kg',
    '3Kg',
    '10kg',
    '1kg',
    '1 Kg',
    '3Kg',
    '10kg',
    '1kg',
    '1kg',
    '3Kg',
    '10kg',
    '1kg',
    '1 Kg',
    '3Kg',
    '10kg',
    '1kg',
    '1kg',
    '3Kg',
    '10kg',
    '1kg',
    '1 Kg',
    '3Kg',
    '10kg',
    '1kg',
    '1kg',
    '3Kg',
    '10kg',
    '1kg',
    '1 Kg',
    '3Kg',
    '10kg',
    '1kg',
    '1kg',
    '3Kg',
    '10kg',
    '1kg',
    '1 Kg',
    '3Kg',
    '10kg',
    '1kg',
  ];
  final List<String> notes = <String>[
    'half kg semi ripe',
    'medium to large head',
    'Heads should be firm ',
    'jazz,GrannySmith,Jonagold and Fuji',
    'half kg semi ripe',
    'medium to large head',
    'Heads should be firm ',
    'jazz,GrannySmith,Jonagold and Fuji',
    'half kg semi ripe',
    'medium to large head',
    'Heads should be firm ',
    'jazz,GrannySmith,Jonagold and Fuji',
    'half kg semi ripe',
    'medium to large head',
    'Heads should be firm ',
    'jazz,GrannySmith,Jonagold and Fuji',
    'half kg semi ripe',
    'medium to large head',
    'Heads should be firm ',
    'jazz,GrannySmith,Jonagold and Fuji',
    'half kg semi ripe',
    'medium to large head',
    'Heads should be firm ',
    'jazz,GrannySmith,Jonagold and Fuji',
    'half kg semi ripe',
    'medium to large head',
    'Heads should be firm ',
    'jazz,GrannySmith,Jonagold and Fuji',
    'half kg semi ripe',
    'medium to large head',
    'Heads should be firm ',
    'jazz,GrannySmith,Jonagold and Fuji',
    'half kg semi ripe',
    'medium to large head',
    'Heads should be firm ',
    'jazz,GrannySmith,Jonagold and Fuji',
    'half kg semi ripe',
    'medium to large head',
    'Heads should be firm ',
    'jazz,GrannySmith,Jonagold and Fuji',
    'half kg semi ripe',
    'medium to large head',
    'Heads should be firm ',
    'jazz,GrannySmith,Jonagold and Fuji',
  ];
  final List<String> names = <String>[
    'Tomatoes ',
    'Cauliflower ',
    'Brocolli ',
    'Apples ',
    'Tomatoes ',
    'Cauliflower ',
    'Brocolli ',
    'Apples ',
    'Tomatoes ',
    'Cauliflower ',
    'Brocolli ',
    'Apples ',
    'Tomatoes ',
    'Cauliflower ',
    'Brocolli ',
    'Apples ',
    'Tomatoes ',
    'Cauliflower ',
    'Brocolli ',
    'Apples ',
    'Tomatoes ',
    'Cauliflower ',
    'Brocolli ',
    'Apples ',
    'Tomatoes ',
    'Cauliflower ',
    'Brocolli ',
    'Apples ',
    'Tomatoes ',
    'Cauliflower ',
    'Brocolli ',
    'Apples ',
    'Tomatoes ',
    'Cauliflower ',
    'Brocolli ',
    'Apples ',
    'Tomatoes ',
    'Cauliflower ',
    'Brocolli ',
    'Apples ',
    'Tomatoes ',
    'Cauliflower ',
    'Brocolli ',
    'Apples ',
    'Tomatoes ',
    'Cauliflower ',
    'Brocolli ',
    'Apples ',
    'Tomatoes ',
    'Cauliflower ',
    'Brocolli ',
    'Apples ',
    'Tomatoes ',
    'Cauliflower ',
    'Brocolli ',
    'Apples ',
    'Tomatoes ',
    'Cauliflower ',
    'Brocolli ',
    'Apples ',
    'Tomatoes ',
    'Cauliflower ',
    'Brocolli ',
    'Apples ',
    'Tomatoes ',
    'Cauliflower ',
    'Brocolli ',
    'Apples ',
    'Tomatoes ',
    'Cauliflower ',
    'Brocolli ',
    'Apples ',
    'Tomatoes ',
    'Cauliflower ',
    'Brocolli ',
    'Apples ',
    'Tomatoes ',
    'Cauliflower ',
    'Brocolli ',
    'Apples ',
    'Tomatoes ',
    'Cauliflower ',
    'Brocolli ',
    'Apples ',
    'Tomatoes ',
    'Cauliflower ',
    'Brocolli ',
    'Apples ',
    'Tomatoes ',
    'Cauliflower ',
    'Brocolli ',
    'Apples ',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: <Widget>[
      // Container(
      //   padding: const EdgeInsets.only(left: 20, right: 8),
      //   decoration: BoxDecoration(
      //       color: Palette.greenColor, borderRadius: BorderRadius.circular(10)),
      //   child: Row(
      //     children: [
      //       const Text(
      //         'My Deliveries',
      //         style: TextStyle(
      //             fontSize: 20,
      //             color: Colors.white,
      //             fontWeight: FontWeight.bold),
      //       ),
      //       const Expanded(child: SizedBox()),
      //       CupertinoButton(
      //           padding: const EdgeInsets.all(0),
      //           child: const Icon(
      //             Icons.arrow_forward_ios,
      //             size: 25,
      //             color: Colors.white,
      //           ),
      //           onPressed: () {}),
      //     ],
      //   ),
      // ),
      CustomScrollView(
        slivers: [
          // const SliverPadding(
          //   padding: EdgeInsets.only(bottom: 50.0),
          //   sliver: SliverAppBar(
          //     backgroundColor: Colors.white,
          //     title:
          //      Text.rich(TextSpan(
          //         text: 'Kwik ',
          //         style: TextStyle(
          //             fontSize: 30,
          //             fontWeight: FontWeight.w900,
          //             color: Palette.orangeColor),
          //         children: [
          //           TextSpan(
          //               text: 'Delivery',
          //               style: TextStyle(color: Palette.greenColor))
          //         ]),
          //         ),
          //     expandedHeight: 30,
          //     // collapsedHeight: 150,
          //   ),
          // ),
          SliverPadding(
            padding: EdgeInsets.only(bottom: 10.0),
            sliver: SliverAppBar(
              leading: IconButton(
                  icon: Icon(Icons.chevron_left),
                  tooltip: 'Click to Home Screen',
                  onPressed: () {
                    //  handle the press
                  }),
              // Provide a standard title
              title: const Text.rich(
                TextSpan(
                    text: 'Order Id:',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w900,
                        color: Palette.orangeColor),
                    children: [
                      TextSpan(
                          text: '4444333',
                          style: TextStyle(color: Palette.greenColor))
                    ]),
              ),
              // actions: <Widget>[
              //   IconButton(
              //     icon: Icon(Icons.shopping_cart),
              //     tooltip: 'Open shopping cart',
              //     onPressed: () {
              //       // handle the press
              //     },
              //   ),
              // ],
              // brightness: Brightness.light,
              backgroundColor: Colors.white,
              iconTheme: IconThemeData(
                color: Palette.greyColor,
              ),
              // textTheme: TextTheme(
              //   :
              //   TextStyle(fontFamily: 'RobotoMono', color: Colors.deepOrange,
              //       fontSize: 36.0),
              // ),
              forceElevated: true,
              floating: true,
              pinned: true,
              // Make the initial height of the SliverAppBar larger than normal
              expandedHeight: 100,
            ),
          ),

          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.only(left: 20, right: 8),
              decoration: BoxDecoration(
                  color: Palette.greenColor,
                  borderRadius: BorderRadius.circular(10)),
              child: IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: const [
                    Text(
                      'Product Name',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Quantity',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Specifications',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Action Area',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // const SliverAppBar(
          //   backgroundColor: Colors.orangeAccent,
          //   title: Text('Items in this order'), //IconButton
          //   actions: <Widget>[],
          //   floating: true,
          // ),
          SliverPadding(
            padding: const EdgeInsets.only(top: 40.0),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Card(
                    margin: const EdgeInsets.all(15),
                    child: Container(
                      color: Colors.grey[100 * (index % 3 + 1)],
                      height: 80,
                      // alignment: Alignment.center,
                      child: Container(
                        height: 50,
                        margin: const EdgeInsets.all(2),
                        // color: msgCount[index]>=10? Colors.blue[400]:
                        //   msgCount[index]>3? Colors.blue[100]: Colors.grey,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Column(
                              children: [
                                Text(
                                  '${names[index]} ',
                                  style: TextStyle(fontSize: 18),
                                ),
                              ],
                            ),
                            const VerticalDivider(),
                            Column(
                              children: [
                                Text(
                                  '${quantity[index]} ',
                                  style: TextStyle(fontSize: 18),
                                ),
                              ],
                            ),
                            const VerticalDivider(),
                            Column(
                              children: [
                                Flexible(
                                  child: Text(
                                    '${notes[index]} ',
                                    softWrap: true,
                                    style: TextStyle(fontSize: 14),
                                  ),
                                ),
                              ],
                            ),
                            const VerticalDivider(),
                            Column(
                              children: [
                                DropdownButtonHideUnderline(
                                  child: ButtonTheme(
                                    alignedDropdown: true,
                                    child: DropdownButton(
                                        items: List.generate(
                                            users.length,
                                            (index) => DropdownMenuItem(
                                                  value: users[index],
                                                  child: Row(
                                                    children: [
                                                      users[index].icon,
                                                      SizedBox(
                                                        width: 10,
                                                      ),
                                                      Text(
                                                        users[index].name,
                                                        style: TextStyle(
                                                            color: Colors.red),
                                                      ),
                                                    ],
                                                  ),
                                                )),
                                        // items: users.map((Item user) {
                                        //   return DropdownMenuItem(
                                        //     value: user,

                                        //   );
                                        // }).toList(),
                                        onChanged: (value) {
                                          setState(() {
                                            value;
                                          });
                                        },
                                        hint: Text("Status")),
                                  ),
                                ),
                              ],
                            ),
                            // BlocProvider(
                            //   create: (context) => CheckedBloc(null),
                            //   child: Row(
                            //     mainAxisSize: MainAxisSize.min,
                            //     children: <Widget>[
                            //       // CupertinoButton(
                            //       //     child: const Text('Approve'),
                            //       //     color: Colors.blue,
                            //       //     onPressed: context.watch<CheckedBloc>().state ==
                            //       //                 'approve' ||
                            //       //             context.watch<CheckedBloc>().state == null
                            //       //         ? () {
                            //       //             context.read<CheckedBloc>().emit('approve');
                            //       //           }
                            //       //         : null),
                            //       // CupertinoButton(
                            //       //     child: const Text('Reject'),
                            //       //     color: Colors.blue,
                            //       //     onPressed: context.watch<CheckedBloc>().state ==
                            //       //                 'reject' ||
                            //       //             context.watch<CheckedBloc>().state == null
                            //       //         ? () {
                            //       //             context.read<CheckedBloc>().emit('reject');
                            //       //           }
                            //       //         : null),
                            //       // CupertinoButton(
                            //       //     child: const Text('No'),
                            //       //     color: Colors.blue,
                            //       //     onPressed:
                            //       //         context.watch<CheckedBloc>().state == 'no' ||
                            //       //                 context.watch<CheckedBloc>().state == null
                            //       //             ? () {
                            //       //                 context.read<CheckedBloc>().emit('no');
                            //       //               }
                            //       //             : null),

                            //       GestureDetector(
                            //           onTap: () {
                            //             context.watch<CheckedBloc>().state ==
                            //                         'approve' ||
                            //                     context
                            //                             .watch<CheckedBloc>()
                            //                             .state ==
                            //                         null
                            //                 ? () {
                            //                     context
                            //                         .read<CheckedBloc>()
                            //                         .emit('approve');
                            //                   }
                            //                 : null;
                            //           },
                            //           child: Tooltip(
                            //             triggerMode: TooltipTriggerMode.tap,
                            //             message: 'Fully Packed',
                            //             child: Image.asset(
                            //               'assets/good.png',
                            //             ),
                            //           )),
                            //       const SizedBox(width: 20),
                            //       GestureDetector(
                            //           onTap: () {
                            //             context.watch<CheckedBloc>().state ==
                            //                         'disaaprove' ||
                            //                     context
                            //                             .watch<CheckedBloc>()
                            //                             .state ==
                            //                         null
                            //                 ? () {
                            //                     context
                            //                         .read<CheckedBloc>()
                            //                         .emit('disapprove');
                            //                   }
                            //                 : null;
                            //           },
                            //           child: Tooltip(
                            //               triggerMode: TooltipTriggerMode.tap,
                            //               message: 'Not good/Damaged Products',
                            //               child: Image.asset(
                            //                   'assets/ungood.png'))),
                            //       const SizedBox(width: 20),
                            //       GestureDetector(
                            //           onTap: () {
                            //             context.watch<CheckedBloc>().state ==
                            //                         'raise' ||
                            //                     context
                            //                             .watch<CheckedBloc>()
                            //                             .state ==
                            //                         null
                            //                 ? () {
                            //                     context
                            //                         .read<CheckedBloc>()
                            //                         .emit('raise');
                            //                   }
                            //                 : null;
                            //           },
                            //           child: Tooltip(
                            //               triggerMode: TooltipTriggerMode.tap,
                            //               message: 'Unavailable',
                            //               child: Image.asset(
                            //                   'assets/unavailable.png'))),
                            //       const SizedBox(width: 20),
                            //       GestureDetector(
                            //           onTap: () {
                            //             context.watch<CheckedBloc>().state ==
                            //                         'record' ||
                            //                     context
                            //                             .watch<CheckedBloc>()
                            //                             .state ==
                            //                         null
                            //                 ? () {
                            //                     context
                            //                         .read<CheckedBloc>()
                            //                         .emit('record');
                            //                   }
                            //                 : null;
                            //           },
                            //           child: Tooltip(
                            //               triggerMode: TooltipTriggerMode.tap,
                            //               message: 'Record addtional infor',
                            //               child:
                            //                   Image.asset('assets/infor.png'))),
                            //       // IconButton(
                            //       //     color: Colors.blue,
                            //       //     onPressed: () {
                            //       //       context.watch<CheckedBloc>().state == 'record' ||
                            //       //               context.watch<CheckedBloc>().state == null
                            //       //           ? () {
                            //       //               context.read<CheckedBloc>().emit('record');
                            //       //             }
                            //       //           : null;
                            //       //     },
                            //       //     icon: const Tooltip(
                            //       //         triggerMode: TooltipTriggerMode.tap,
                            //       //         message: 'Record addtional infor',
                            //       //         child: Icon(Icons.done_all_outlined))),
                            //       // IconButton(
                            //       //     color: Colors.blue,
                            //       //     onPressed: () {},
                            //       //     icon: const Tooltip(
                            //       //         triggerMode: TooltipTriggerMode.tap,
                            //       //         message: 'Record addtional infor',
                            //       //         child: Icon(Icons.delete))),
                            //       // IconButton(
                            //       //     onPressed: () {}, icon: const Icon(Icons.add_box)),
                            //       // IconButton(
                            //       //     onPressed: () {},
                            //       //     icon: const Icon(Icons.edit_rounded)),
                            //     ],
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                childCount: 1000, // 1000 list items
              ),
            ),
          )
        ],
      ),
    ]));
  }
}

class CheckedBloc extends Cubit<String?> {
  CheckedBloc(String? initialState) : super(initialState);
}

// ignore: todo
//TODO:move these lines to models folder
//data class for the list tile
class Data {
  final String title, subTitle;
  bool isSelected;

  Data({required this.isSelected, required this.title, required this.subTitle});
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
                MaterialPageRoute(builder: (context) => ItemlistTile()),
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
