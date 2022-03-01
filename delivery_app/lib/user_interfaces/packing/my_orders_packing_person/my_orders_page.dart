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

class HomeIconPagePacking extends StatefulWidget {
  const HomeIconPagePacking({Key? key}) : super(key: key);

  @override
  _HomeIconPagePackingState createState() => _HomeIconPagePackingState();
}

class _HomeIconPagePackingState extends State<HomeIconPagePacking> {
  final List<Map<String, dynamic>> _items = List.generate(
      100,
      (index) =>
          {"id": index, "title": "Item $index", "subtitle": "Subtitle $index"});

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
                    order.delivery_date!.toString(),
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
                    (order.delivery_timeslot!),
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
              context
                  .read<OrderDetailsCubit>()
                  .getOrderDetails(orderId: order.order_id!);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => OrderDetailsPage()),
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
            const SizedBox(
              height: 12,
            ),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(4),
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
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Status',
                        style: TextStyle(
                            color: Palette.placeholderGrey, fontSize: 14),
                      ),
                      Text(
                        order.status!,
                        style: const TextStyle(
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
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            const Text(
              'Vendor',
              style: TextStyle(color: Palette.placeholderGrey, fontSize: 14),
            ),
            Text(
              order.order_company!,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 12,
            ),
            Row(
              children: [
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
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
                      style: const TextStyle(
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

class ItemlistTile extends StatefulWidget {
  @override
  State<ItemlistTile> createState() => _ItemlistTileState();
}

class _ItemlistTileState extends State<ItemlistTile> {
  final List<String> names = <String>[
    'Tomatoes 4kg',
    'Cauliflower 1kg',
    'Brocolli 2kg',
    'Apples 1 Crate',
    'Tomatoes 4kg',
    'Cauliflower 1kg',
    'Brocolli 2kg',
    'Apples 1 Crate',
    'Tomatoes 4kg',
    'Cauliflower 1kg',
    'Brocolli 2kg',
    'Apples 1 Crate',
    'Tomatoes 4kg',
    'Cauliflower 1kg',
    'Brocolli 2kg',
    'Apples 1 Crate',
    'Tomatoes 4kg',
    'Cauliflower 1kg',
    'Brocolli 2kg',
    'Apples 1 Crate',
    'Tomatoes 4kg',
    'Cauliflower 1kg',
    'Brocolli 2kg',
    'Apples 1 Crate',
    'Tomatoes 4kg',
    'Cauliflower 1kg',
    'Brocolli 2kg',
    'Apples 1 Crate',
    'Tomatoes 4kg',
    'Cauliflower 1kg',
    'Brocolli 2kg',
    'Apples 1 Crate',
    'Tomatoes 4kg',
    'Cauliflower 1kg',
    'Brocolli 2kg',
    'Apples 1 Crate',
    'Tomatoes 4kg',
    'Cauliflower 1kg',
    'Brocolli 2kg',
    'Apples 1 Crate',
    'Tomatoes 4kg',
    'Cauliflower 1kg',
    'Brocolli 2kg',
    'Apples 1 Crate',
    'Tomatoes 4kg',
    'Cauliflower 1kg',
    'Brocolli 2kg',
    'Apples 1 Crate',
    'Tomatoes 4kg',
    'Cauliflower 1kg',
    'Brocolli 2kg',
    'Apples 1 Crate',
    'Tomatoes 4kg',
    'Cauliflower 1kg',
    'Brocolli 2kg',
    'Apples 1 Crate',
    'Tomatoes 4kg',
    'Cauliflower 1kg',
    'Brocolli 2kg',
    'Apples 1 Crate',
    'Tomatoes 4kg',
    'Cauliflower 1kg',
    'Brocolli 2kg',
    'Apples 1 Crate',
    'Tomatoes 4kg',
    'Cauliflower 1kg',
    'Brocolli 2kg',
    'Apples 1 Crate',
    'Tomatoes 4kg',
    'Cauliflower 1kg',
    'Brocolli 2kg',
    'Apples 1 Crate',
    'Tomatoes 4kg',
    'Cauliflower 1kg',
    'Brocolli 2kg',
    'Apples 1 Crate',
    'Tomatoes 4kg',
    'Cauliflower 1kg',
    'Brocolli 2kg',
    'Apples 1 Crate',
    'Tomatoes 4kg',
    'Cauliflower 1kg',
    'Brocolli 2kg',
    'Apples 1 Crate',
    'Tomatoes 4kg',
    'Cauliflower 1kg',
    'Brocolli 2kg',
    'Apples 1 Crate',
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
                    text: 'Kwik ',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w900,
                        color: Palette.orangeColor),
                    children: [
                      TextSpan(
                          text: 'Delivery',
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
              backgroundColor: Colors.transparent,
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
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text.rich(
                      TextSpan(
                          text: 'Order Id: ',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w900,
                              color: Colors.white),
                          children: [
                            TextSpan(
                                text: '4477222',
                                style: TextStyle(color: Colors.white))
                          ]),
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
                          children: [
                            Text(
                              '${names[index]} ',
                              style: TextStyle(fontSize: 18),
                            ),
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
      Positioned(
        top: 256.0,
        right: 16.0,
        child: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Scanner()),
            );
          },
          child: const Icon(Icons.qr_code_2_rounded),
        ),
      ),
    ]));
  }
}

// class HomePage extends StatelessWidget {
//   // Generate some dummy data
//   final List<Map<String, dynamic>> _items = List.generate(
//       100,
//       (index) =>
//           {"id": index, "title": "Item $index", "subtitle": "Subtitle $index"});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text('Kindacode.com'),
//         ),
//         body: ListTileTheme(
//           contentPadding: EdgeInsets.all(15),
//           iconColor: Colors.red,
//           textColor: Colors.black54,
//           tileColor: Colors.yellow[100],
//           style: ListTileStyle.list,
//           dense: true,
//           child: ListView.builder(
//             itemCount: _items.length,
//             itemBuilder: (_, index) => Card(
//               margin: EdgeInsets.all(10),
//               child: ListTile(
//                 title: Text(_items[index]['title']),
//                 subtitle: Text(_items[index]['subtitle']),
//                 trailing: Row(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
//                     IconButton(onPressed: () {}, icon: Icon(Icons.delete)),
//                     IconButton(onPressed: () {}, icon: Icon(Icons.add_box)),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ));
//   }
// }

class CheckedBloc extends Cubit<String?> {
  CheckedBloc(String? initialState) : super(initialState);
}
