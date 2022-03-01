import 'package:delivery_app/configuration/configuration.dart';
import 'package:delivery_app/cubits/order_details_cubit/order_details_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class OrderDetailsPage extends StatefulWidget {
  const OrderDetailsPage({Key? key}) : super(key: key);

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
                // Container(
                //   child: Text(orderDetail.order_id.toString()),
                // );
                return Scaffold(
                  body: SafeArea(
                      child: PageView(
                    controller: _controller,
                    children: [
                      Padding(
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
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
                                      const SizedBox(
                                        height: 12,
                                      ),
                                      Row(
                                        children: const [
                                          Text(
                                            'Order Quantity:',
                                            style: TextStyle(
                                                color: Palette.placeholderGrey,
                                                fontSize: 14),
                                          ),
                                          SizedBox(width: 20),
                                          Text(
                                            '12 items',
                                            style: TextStyle(
                                                color: Palette.placeholderGrey,
                                                fontSize: 16),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  )),
                );
              },
              orElse: () {
                return Container();
              });
        },
      ),
    );
  }
}
