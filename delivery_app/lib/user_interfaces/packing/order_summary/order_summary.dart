import 'package:delivery_app/configuration/configuration.dart';
import 'package:delivery_app/user_interfaces/home/main_home_page.dart';
import 'package:delivery_app/user_interfaces/packing/items_processing/processed_order_list.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OrderSummary extends StatefulWidget {
  const OrderSummary({Key? key}) : super(key: key);

  @override
  _OrderSummaryState createState() => _OrderSummaryState();
}

class _OrderSummaryState extends State<OrderSummary> {
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
        title: const Text(
          'Processed Orders',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(100, (index) => CardWidget())),
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

class CardWidget extends StatelessWidget {
  const CardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(30.0),
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
                    'Order pending approval',
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
                    "Orders fully Packed",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange,
                    ),
                  ),
                  Text(
                    '9 Orders',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ]),
                const SizedBox(width: 20),
                Column(children: const [
                  Text(
                    "Date of Delivery",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange,
                    ),
                  ),
                  Text(
                    '12-2-2022',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
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
                  ),
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
                MaterialPageRoute(builder: (context) => const Dispatch()),
              );
            },
            child: const Text(
              'Mark Unavailable',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ]));
  }
}
