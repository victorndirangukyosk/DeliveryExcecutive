import 'package:auto_route/auto_route.dart';
import 'package:delivery_app/configuration/configuration.dart';
import 'package:delivery_app/cubits/my_orders_cubit.dart/my_orders_cubit.dart';
import 'package:delivery_app/models/order/order.dart';
import 'package:delivery_app/routes/router.gr.dart';
import 'package:delivery_app/user_interfaces/home/main_home_page.dart';
import 'package:delivery_app/utilities/toast/toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../cubits/authentication/token_cubit.dart';

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
    return Scaffold(
      backgroundColor: Palette.orangeBackgroundColor,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        backgroundColor: Palette.orangeBackgroundColor,
        title: Text(
          'My Orders',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(13, (index) => CardWidget())),
      ), // body: Padding(
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

class CardWidget extends StatelessWidget {
  const CardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(100.0),
        decoration: const BoxDecoration(
          color: Colors.white,
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
                Column(children: const [
                  Text(
                    "Order Id",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange,
                    ),
                  ),
                  Spacer(),
                  Text(
                    "Order Status",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange,
                    ),
                  ),
                  Text(
                    'Order being Processed',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ]),
                const SizedBox(width: 20),
                Column(children: const [
                  Text(
                    "Number of Products",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange,
                    ),
                  ),
                  Text(
                    "13",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      // color: Colors.orange,
                    ),
                  ),
                  Spacer(),
                  Text(
                    "Date of Delivery",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange,
                    ),
                  ),
                  Text(
                    '13 Feb 2022',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ]),
                const SizedBox(width: 20),
                Column(children: const [
                  Text(
                    "Time of Delivery",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange,
                    ),
                  ),
                  Text(
                    '06:00 am- 8:00 am',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
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
                MaterialPageRoute(builder: (context) => ItemlistTile()),
              );
            },
            child: const Text(
              'Submit',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ]));
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
    'Bob',
    'Charlie',
    'Cook',
    'Carline'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: <Widget>[
      CustomScrollView(
        slivers: [
          const SliverAppBar(
            // backgroundColor: Colors.amber,
            title: Text('KwikDelivery'),
            expandedHeight: 30,
            collapsedHeight: 150,
          ),
          const SliverAppBar(
            backgroundColor: Colors.orangeAccent,
            title: Text('Items in this order'), //IconButton
            actions: <Widget>[],
            floating: true,
          ),
          SliverList(
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
                        child: Center(
                            child: Text(
                          '${names[index]} ',
                          style: TextStyle(fontSize: 18),
                        )),
                      )),
                );
              },
              childCount: 1000, // 1000 list items
            ),
          ),
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
