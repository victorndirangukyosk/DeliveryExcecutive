import 'package:delivery_app/user_interfaces/home/main_home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class OrderSummary extends StatefulWidget {
  const OrderSummary({Key? key}) : super(key: key);

  @override
  _OrderSummaryState createState() => _OrderSummaryState();
}

class _OrderSummaryState extends State<OrderSummary> {
  final List<Data> _data = [
    Data(title: 'Order Id ', subTitle: '', isSelected: false),
    Data(title: ' Order Id', subTitle: 'Description', isSelected: false),
    Data(title: ' Order Id', subTitle: 'Description', isSelected: false),
    Data(title: 'CRATE NO ', subTitle: 'Description', isSelected: false),
    Data(title: 'CRATE NO ', subTitle: 'Description', isSelected: false),
    Data(title: 'CRATE NO ', subTitle: 'Description', isSelected: false),
    Data(title: 'CRATE NO ', subTitle: 'Description', isSelected: false),
    Data(title: 'CRATE NO ', subTitle: 'Description', isSelected: false),
    Data(title: 'CRATE NO ', subTitle: 'Description', isSelected: false),
    Data(title: 'CRATE NO ', subTitle: 'Description', isSelected: false),
    Data(title: 'CRATE NO ', subTitle: 'Description', isSelected: false),
    Data(title: 'CRATE NO ', subTitle: 'Description', isSelected: false),
    Data(title: 'CRATE NO ', subTitle: 'Description', isSelected: false),
  ];
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
                    'Order Processed',
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
                BlocProvider(
                  create: (context) => CheckedBloc(null),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      // CupertinoButton(
                      //     child: const Text('Approve'),
                      //     color: Colors.blue,
                      //     onPressed: context.watch<CheckedBloc>().state ==
                      //                 'approve' ||
                      //             context.watch<CheckedBloc>().state == null
                      //         ? () {
                      //             context.read<CheckedBloc>().emit('approve');
                      //           }
                      //         : null),
                      // CupertinoButton(
                      //     child: const Text('Reject'),
                      //     color: Colors.blue,
                      //     onPressed: context.watch<CheckedBloc>().state ==
                      //                 'reject' ||
                      //             context.watch<CheckedBloc>().state == null
                      //         ? () {
                      //             context.read<CheckedBloc>().emit('reject');
                      //           }
                      //         : null),
                      // CupertinoButton(
                      //     child: const Text('No'),
                      //     color: Colors.blue,
                      //     onPressed:
                      //         context.watch<CheckedBloc>().state == 'no' ||
                      //                 context.watch<CheckedBloc>().state == null
                      //             ? () {
                      //                 context.read<CheckedBloc>().emit('no');
                      //               }
                      //             : null),

                      GestureDetector(
                          onTap: () {
                            context.watch<CheckedBloc>().state == 'approve' ||
                                    context.watch<CheckedBloc>().state == null
                                ? () {
                                    context.read<CheckedBloc>().emit('approve');
                                  }
                                : null;
                          },
                          child: Tooltip(
                            triggerMode: TooltipTriggerMode.tap,
                            message: 'Fully Packed',
                            child: Image.asset(
                              'assets/good.png',
                            ),
                          )),
                      const SizedBox(width: 20),
                      GestureDetector(
                          onTap: () {
                            context.watch<CheckedBloc>().state ==
                                        'disaaprove' ||
                                    context.watch<CheckedBloc>().state == null
                                ? () {
                                    context
                                        .read<CheckedBloc>()
                                        .emit('disapprove');
                                  }
                                : null;
                          },
                          child: Tooltip(
                              triggerMode: TooltipTriggerMode.tap,
                              message: 'Not good/Damaged Products',
                              child: Image.asset('assets/ungood.png'))),
                      const SizedBox(width: 20),
                      GestureDetector(
                          onTap: () {
                            context.watch<CheckedBloc>().state == 'raise' ||
                                    context.watch<CheckedBloc>().state == null
                                ? () {
                                    context.read<CheckedBloc>().emit('raise');
                                  }
                                : null;
                          },
                          child: Tooltip(
                              triggerMode: TooltipTriggerMode.tap,
                              message: 'Unavailable',
                              child: Image.asset('assets/unavailable.png'))),
                      const SizedBox(width: 20),
                      GestureDetector(
                          onTap: () {
                            context.watch<CheckedBloc>().state == 'record' ||
                                    context.watch<CheckedBloc>().state == null
                                ? () {
                                    context.read<CheckedBloc>().emit('record');
                                  }
                                : null;
                          },
                          child: Tooltip(
                              triggerMode: TooltipTriggerMode.tap,
                              message: 'Record addtional infor',
                              child: Image.asset('assets/infor.png'))),
                      // IconButton(
                      //     color: Colors.blue,
                      //     onPressed: () {
                      //       context.watch<CheckedBloc>().state == 'record' ||
                      //               context.watch<CheckedBloc>().state == null
                      //           ? () {
                      //               context.read<CheckedBloc>().emit('record');
                      //             }
                      //           : null;
                      //     },
                      //     icon: const Tooltip(
                      //         triggerMode: TooltipTriggerMode.tap,
                      //         message: 'Record addtional infor',
                      //         child: Icon(Icons.done_all_outlined))),
                      // IconButton(
                      //     color: Colors.blue,
                      //     onPressed: () {},
                      //     icon: const Tooltip(
                      //         triggerMode: TooltipTriggerMode.tap,
                      //         message: 'Record addtional infor',
                      //         child: Icon(Icons.delete))),
                      // IconButton(
                      //     onPressed: () {}, icon: const Icon(Icons.add_box)),
                      // IconButton(
                      //     onPressed: () {},
                      //     icon: const Icon(Icons.edit_rounded)),
                    ],
                  ),
                ),
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

class CheckedBloc extends Cubit<String?> {
  CheckedBloc(String? initialState) : super(initialState);
}
