import 'package:delivery_app/configuration/configuration.dart';
import 'package:delivery_app/cubits/fetch_order_status_cubit/fetch_order_status_cubit.dart';
import 'package:delivery_app/cubits/get_order_statuses/get_order_statuses_cubit.dart';
import 'package:delivery_app/user_interfaces/home/main_home_page.dart';
import 'package:delivery_app/user_interfaces/packing/items_processing/processed_order_list.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class OrderSummary extends StatefulWidget {
  final int orderId;
  const OrderSummary({Key? key, required this.orderId}) : super(key: key);

  @override
  _OrderSummaryState createState() => _OrderSummaryState();
}

class _OrderSummaryState extends State<OrderSummary> {
  
  @override
  Widget build(BuildContext context) {
    // context.read<GetOrderStatusesCubit>().getOrdersState();
    // context.read<FetchOrderStatusCubit>().getOrderStatusState();
    return Scaffold(
      backgroundColor: Palette.orangeBackgroundColor,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        backgroundColor: Palette.orangeBackgroundColor,
        title: const Text(
          'Processed Orders',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
              fontFamily: 'Red Hat Display',
              color: Colors.black),
        ),
      ),
      body: BlocConsumer<FetchOrderStatusCubit, FetchOrderStatusState>(
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
            loading: () {
              return const Center(
                child: SpinKitDualRing(color: Palette.greenColor),
              );
            },
            success: (status) {
              return SingleChildScrollView(
                child: Column(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children:
                        List.generate(status.length, (index) => CardWidget(orderId: widget.orderId,))),
              );
            },
            orElse: () {
              return Container();
            },
          );
        },
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
  final int orderId;
  const CardWidget({Key? key, required this.orderId}) : super(key: key);

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
                MaterialPageRoute(builder: (context) => Dispatch(orderId: orderId)),
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
