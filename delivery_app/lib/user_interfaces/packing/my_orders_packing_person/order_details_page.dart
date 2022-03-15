import 'package:auto_route/auto_route.dart';
import 'package:calendar_time/calendar_time.dart';
import 'package:delivery_app/configuration/configuration.dart';
import 'package:delivery_app/cubits/authentication/token_cubit.dart';
import 'package:delivery_app/cubits/order_details_cubit/order_details_cubit.dart';
import 'package:delivery_app/cubits/order_details_list/odetails_list_cubit.dart';
import 'package:delivery_app/models/odetails_list/odetails_list.dart';
import 'package:delivery_app/models/order_details/order_details.dart';
import 'package:delivery_app/routes/router.gr.dart';
import 'package:delivery_app/theme/box_icons.dart';
import 'package:delivery_app/user_interfaces/packing/my_orders_packing_person/my_orders_page.dart';
import 'package:delivery_app/user_interfaces/packing/scanner/scanner.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class OrderDetailsPage extends StatefulWidget {
  final int orderId;
  const OrderDetailsPage({Key? key, required this.orderId}) : super(key: key);

  @override
  State<OrderDetailsPage> createState() => _OrderDetailsPageState();
}

class Item {
  const Item(this.name, this.icon);
  final String name;
  final Icon icon;
}

class _OrderDetailsPageState extends State<OrderDetailsPage> {
  TextEditingController textarea = TextEditingController();
  final PageController _controller = PageController(initialPage: 0);
  List<Item> users = [
    const Item('Fully Packed', Icon(FontAwesomeIcons.dolly)),
    const Item('Not Good/Damaged', Icon(FontAwesomeIcons.question)),
    const Item('Not Available', Icon(FontAwesomeIcons.minusCircle)),
    const Item('Information Recording', Icon(FontAwesomeIcons.edit)),
  ];
  bool isPerformingRequest = false;
  ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    context.read<OrderDetailsCubit>().getOrderDetails(orderId: widget.orderId);
    context.read<OdetailsListCubit>().getOdetails(orderId: widget.orderId);
    return Scaffold(
      body: BlocConsumer<OrderDetailsCubit, OrderDetailsState>(
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
          return state.maybeWhen(
              loading: () => const Center(
                    child: CircularProgressIndicator(
                      color: Palette.greenColor,
                    ),
                  ),
              success: (orderDetails) {
                return SafeArea(
                    child: Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 12,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  //implement here
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Icon(
                                        BoxIcons.bxs_left_arrow,
                                        color: Palette.orangeColor,
                                      ),
                                    ),
                                    Column(
                                      children: [
                                        Column(
                                          children: const [
                                            Text.rich(TextSpan(
                                                text: 'Kwik ',
                                                style: TextStyle(
                                                    fontSize: 30,
                                                    fontWeight: FontWeight.w900,
                                                    color: Palette.orangeColor),
                                                children: [
                                                  TextSpan(
                                                      text: 'Delivery',
                                                      style: TextStyle(
                                                          color: Palette
                                                              .greenColor))
                                                ])),
                                          ],
                                        ),
                                        const Text(
                                          'OrderID',
                                          style: TextStyle(
                                              color: Palette.placeholderGrey,
                                              fontFamily: 'Red Hat Display',
                                              fontWeight: FontWeight.bold,
                                              fontSize: 42),
                                        ),
                                        SizedBox(width: 20),
                                        Text(
                                          orderDetails.order_id.toString(),
                                          style: const TextStyle(
                                              color: Palette.placeholderGrey,
                                              fontFamily: 'Red Hat Display',
                                              fontSize: 21),
                                        ),
                                      ],
                                    ),
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
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            children: [
                                                              const SizedBox(
                                                                height: 20,
                                                              ),
                                                              const CircleAvatar(
                                                                radius: 58,
                                                                backgroundColor:
                                                                    Palette
                                                                        .orangeColor,
                                                                child:
                                                                    CircleAvatar(
                                                                  radius: 54,
                                                                  backgroundColor:
                                                                      Colors
                                                                          .white,
                                                                  child:
                                                                      CircleAvatar(
                                                                    radius: 50,
                                                                    backgroundImage:
                                                                        NetworkImage(
                                                                            'https://th.bing.com/th/id/R.a5758d6fb64904904ec75fd1f083e3fb?rik=QVwaYy2Fd7Xi%2fA&pid=ImgRaw&r=0'),
                                                                  ),
                                                                ),
                                                              ),
                                                              const SizedBox(
                                                                height: 20,
                                                              ),
                                                              const Text(
                                                                  'Samuel Baraka'),
                                                              const Text(
                                                                  'sababuvercetti@gmail.com'),
                                                              const SizedBox(
                                                                height: 20,
                                                              ),
                                                              ListTile(
                                                                onTap: () {},
                                                                leading: const Icon(
                                                                    Icons
                                                                        .history),
                                                                title: const Text(
                                                                    'Order history'),
                                                                trailing: const Icon(
                                                                    CupertinoIcons
                                                                        .forward),
                                                                subtitle:
                                                                    const Text(
                                                                        'View order history'),
                                                              ),
                                                              ListTile(
                                                                onTap: () {},
                                                                leading: const Icon(
                                                                    CupertinoIcons
                                                                        .settings),
                                                                title: const Text(
                                                                    'Settings'),
                                                                trailing: const Icon(
                                                                    CupertinoIcons
                                                                        .forward),
                                                                subtitle:
                                                                    const Text(
                                                                        'Application settings'),
                                                              ),
                                                              ListTile(
                                                                onTap: () {
                                                                  // Clear the token
                                                                  context
                                                                      .read<
                                                                          TokenCubit>()
                                                                      .clear();
                                                                  AutoRouter.of(
                                                                          context)
                                                                      .replace(
                                                                          const SplashScreen());
                                                                },
                                                                leading:
                                                                    const Icon(
                                                                  Icons
                                                                      .logout_outlined,
                                                                  color: Palette
                                                                      .greenColor,
                                                                ),
                                                                title:
                                                                    const Text(
                                                                  'Logout',
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .red),
                                                                ),
                                                                trailing:
                                                                    const Icon(
                                                                  CupertinoIcons
                                                                      .forward,
                                                                  color: Palette
                                                                      .greenColor,
                                                                ),
                                                                subtitle:
                                                                    const Text(
                                                                  'Logout of this application',
                                                                ),
                                                              ),
                                                              ListTile(
                                                                onTap: () {
                                                                  showAboutDialog(
                                                                    context:
                                                                        context,
                                                                    applicationIcon: Image.asset(
                                                                        'assets/logo.png',
                                                                        height:
                                                                            30),
                                                                  );
                                                                },
                                                                leading:
                                                                    const Icon(
                                                                  CupertinoIcons
                                                                      .info,
                                                                  color: Palette
                                                                      .greenColor,
                                                                ),
                                                                title:
                                                                    const Text(
                                                                  "About",
                                                                  style: TextStyle(
                                                                      color: Palette
                                                                          .greenColor),
                                                                ),
                                                                trailing:
                                                                    const Icon(
                                                                  CupertinoIcons
                                                                      .forward,
                                                                  color: Palette
                                                                      .greenColor,
                                                                ),
                                                                subtitle:
                                                                    const Text(
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
                                const SizedBox(
                                  height: 12,
                                ),
                                Row(
                                  children: [
                                    const Text(
                                      'Order Quantity:',
                                      style: TextStyle(
                                          color: Palette.placeholderGrey,
                                          fontSize: 14),
                                    ),
                                    const SizedBox(width: 20),
                                    Text(
                                      orderDetails.products_count.toString(),
                                      style: const TextStyle(
                                          color: Palette.placeholderGrey,
                                          fontSize: 16),
                                    ),
                                    const SizedBox(
                                      height: 12,
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    const Text(
                                      'Order Quantity:',
                                      style: TextStyle(
                                          color: Palette.placeholderGrey,
                                          fontSize: 14),
                                    ),
                                    SizedBox(width: 20),
                                    Text(
                                      // orderDetails.delivery_date.toString(),
                                      CalendarTime(DateTime.parse(
                                              orderDetails.delivery_date!))
                                          .toHuman,
                                      style: const TextStyle(
                                          color: Palette.placeholderGrey,
                                          fontSize: 16),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 12,
                                ),
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: CupertinoButton(
                                      child: const Text('Add Crates'),
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 4, horizontal: 8),
                                      color: Palette.orangeColor,
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Scanner(
                                                    order: orderDetails,
                                                  )),
                                        );
                                      }),
                                ),
                                const SizedBox(
                                  height: 20,
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      //we can have the following o throjjjicf
                      Container(
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
                            ],
                          ),
                        ),
                      ),
                      //TODO: IMPLEMENT REAL PRODUCT LIST Used a model frezzed clas in order details cubit
                      BlocConsumer<OdetailsListCubit, OdetailsListState>(
                          listener: (context, state) {
                        // TODO: implement listener
                        state.maybeWhen(
                            orElse: () {},
                            failed: (e) {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return CupertinoAlertDialog(
                                      title: const Text('Error'),
                                      content: Text(e),
                                    );
                                  });
                            });
                      }, builder: (context, state) {
                        return state.maybeWhen(
                          loading: () {
                            return const Center(
                              child: CircularProgressIndicator(
                                color: Colors.red,
                              ),
                            );
                          },
                          success: (odetailsList) {
                            return Expanded(
                              child: ListView.builder(
                                itemCount: odetailsList.length,
                                itemBuilder: (BuildContext context, int index) {
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
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          // crossAxisAlignment: CrossAxisAlignment.stretch,
                                          children: [
                                            Expanded(
                                              child: Column(
                                                children: [
                                                  Text(
                                                    odetailsList[index].name!,
                                                    style: const TextStyle(
                                                        // color: Palette.placeholderGrey,
                                                        fontSize: 18),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const VerticalDivider(),
                                            Expanded(
                                              child: Column(
                                                children: const [
                                                  Text(
                                                    '12kg ',
                                                    style: TextStyle(
                                                        color: Palette
                                                            .placeholderGrey,
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w200),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const VerticalDivider(),
                                            Expanded(
                                              child: Column(
                                                children: [
                                                  Flexible(
                                                    child: Text(
                                                      odetailsList[index]
                                                          .product_note!,
                                                      softWrap: true,
                                                      style: const TextStyle(
                                                          color: Palette
                                                              .placeholderGrey,
                                                          fontSize: 16),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            );
                          },
                          orElse: () {
                            return Container();
                          },
                        );
                      }),
                    ],
                  ),
                ));
              },
              orElse: () {
                return Container();
              });
        },
      ),
    );
  }
}
