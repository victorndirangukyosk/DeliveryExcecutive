import 'package:delivery_app/user_interfaces/home/main_home_page.dart';
import 'package:delivery_app/user_interfaces/packing/scanner/scanner.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:auto_route/auto_route.dart';
import 'package:delivery_app/configuration/configuration.dart';
import 'package:delivery_app/routes/router.gr.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

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
  bool isPerformingRequest = false;
  ScrollController _scrollController = ScrollController();

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

  _getMoreData() async {
    if (!isPerformingRequest) {
      setState(() => isPerformingRequest = true);
      List<int> newEntries = [1, 2]; //returns empty list
      if (newEntries.isEmpty) {
        double edge = 50.0;
        double offsetFromBottom = _scrollController.position.maxScrollExtent -
            _scrollController.position.pixels;
        if (offsetFromBottom < edge) {
          _scrollController.animateTo(
              _scrollController.offset - (edge - offsetFromBottom),
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeOut);
        }
      }
      // setState(() {
      //   names.addAll(newEntries);
      //   isPerformingRequest = false;
      // });
    }
  }

  Widget _buildProgressIndicator() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Opacity(
          opacity: isPerformingRequest ? 1.0 : 0.0,
          child: const CircularProgressIndicator(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Column(children: <Widget>[
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(8)),
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
                    children: const [
                      Text(
                        'OrderID:',
                        style: TextStyle(
                            color: Palette.placeholderGrey, fontSize: 14),
                      ),
                      SizedBox(width: 20),
                      Text(
                        '3334444',
                        style: TextStyle(
                            color: Palette.placeholderGrey, fontSize: 14),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    children: const [
                      Text(
                        'Order Quantity:',
                        style: TextStyle(
                            color: Palette.placeholderGrey, fontSize: 14),
                      ),
                      SizedBox(width: 20),
                      Text(
                        '12 items',
                        style: TextStyle(
                            color: Palette.placeholderGrey, fontSize: 14),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              const Text(
                'Date of Delivery',
                style: TextStyle(color: Palette.placeholderGrey, fontSize: 14),
              ),
              const SizedBox(
                height: 12,
              ),
              const SizedBox(
                height: 12,
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: CupertinoButton(
                    child: const Text('Add Crates'),
                    padding:
                        const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                    color: Palette.orangeColor,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Scanner()),
                      );
                    }),
              ),
              const SizedBox(
                height: 12,
              ),
            ],
          ),
        ),

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

        Expanded(
          child: ListView.builder(
            itemCount: names.length + 1,
            itemBuilder: (context, index) {
              if (index == names.length) {
                return _buildProgressIndicator();
              } else {
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
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        // crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                Text(
                                  '${names[index]} ',
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
                              children: [
                                Text(
                                  '${quantity[index]} ',
                                  style: const TextStyle(
                                      color: Palette.placeholderGrey,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w200),
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
                                    '${notes[index]} ',
                                    softWrap: true,
                                    style: const TextStyle(
                                        color: Palette.placeholderGrey,
                                        fontSize: 16),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const VerticalDivider(),
                          Expanded(
                            child: DropdownButtonHideUnderline(
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
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  Text(
                                                    users[index].name,
                                                    style: const TextStyle(
                                                        color: Colors.red),
                                                  ),
                                                ],
                                              ),
                                            )),
                                    onChanged: (value) {
                                      setState(() {
                                        value;
                                      });
                                    },
                                    hint: const Text("Status")),
                              ),
                            ),
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
              }
            },
            controller: _scrollController,
          ),
        ),
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
        // CustomScrollView(
        //   slivers: [
        //     // SliverPadding(
        //     //   padding: EdgeInsets.only(bottom: 10.0),
        //     //   sliver: SliverAppBar(
        //     //     leading: IconButton(
        //     //         icon: Icon(Icons.chevron_left),
        //     //         tooltip: 'Click to Home Screen',
        //     //         onPressed: () {
        //     //           //  handle the press
        //     //         }),
        //     //     // Provide a standard title
        //     //     title: const Text.rich(
        //     //       TextSpan(
        //     //           text: 'Order Id:',
        //     //           style: TextStyle(
        //     //               fontSize: 30,
        //     //               fontWeight: FontWeight.w900,
        //     //               color: Palette.orangeColor),
        //     //           children: [
        //     //             TextSpan(
        //     //                 text: '4444333',
        //     //                 style: TextStyle(color: Palette.greenColor))
        //     //           ]),
        //     //     ),

        //     //     backgroundColor: Colors.white,
        //     //     iconTheme: IconThemeData(
        //     //       color: Palette.greyColor,
        //     //     ),

        //     //     forceElevated: true,
        //     //     floating: true,
        //     //     pinned: true,

        //     //     expandedHeight: 100,
        //     //   ),
        //     // ),

        //     SliverPadding(
        //       padding: const EdgeInsets.only(top: 40.0),
        //       sliver: SliverList(
        //         delegate: SliverChildBuilderDelegate(
        //           (BuildContext context, int index) {
        //             return Card(
        //               margin: const EdgeInsets.all(15),
        //               child: Container(
        //                 color: Colors.grey[100 * (index % 3 + 1)],
        //                 height: 80,
        //                 // alignment: Alignment.center,
        //                 child: Container(
        //                   height: 50,
        //                   margin: const EdgeInsets.all(2),
        //                   // color: msgCount[index]>=10? Colors.blue[400]:
        //                   //   msgCount[index]>3? Colors.blue[100]: Colors.grey,
        //                   child: Row(
        //                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //                     // crossAxisAlignment: CrossAxisAlignment.stretch,
        //                     children: [
        //                       Expanded(
        //                         child: Column(
        //                           children: [
        //                             Text(
        //                               '${names[index]} ',
        //                               style: TextStyle(fontSize: 18),
        //                             ),
        //                           ],
        //                         ),
        //                       ),
        //                       const VerticalDivider(),
        //                       Expanded(
        //                         child: Column(
        //                           children: [
        //                             Text(
        //                               '${quantity[index]} ',
        //                               style: TextStyle(fontSize: 18),
        //                             ),
        //                           ],
        //                         ),
        //                       ),
        //                       const VerticalDivider(),
        //                       Expanded(
        //                         child: Column(
        //                           children: [
        //                             Flexible(
        //                               child: Text(
        //                                 '${notes[index]} ',
        //                                 softWrap: true,
        //                                 style: TextStyle(fontSize: 14),
        //                               ),
        //                             ),
        //                           ],
        //                         ),
        //                       ),
        //                       const VerticalDivider(),
        //                       Expanded(
        //                         child: DropdownButtonHideUnderline(
        //                           child: ButtonTheme(
        //                             alignedDropdown: true,
        //                             child: DropdownButton(
        //                                 items: List.generate(
        //                                     users.length,
        //                                     (index) => DropdownMenuItem(
        //                                           value: users[index],
        //                                           child: Row(
        //                                             children: [
        //                                               users[index].icon,
        //                                               const SizedBox(
        //                                                 width: 10,
        //                                               ),
        //                                               Text(
        //                                                 users[index].name,
        //                                                 style:
        //                                                     const TextStyle(
        //                                                         color: Colors
        //                                                             .red),
        //                                               ),
        //                                             ],
        //                                           ),
        //                                         )),
        //                                 onChanged: (value) {
        //                                   setState(() {
        //                                     value;
        //                                   });
        //                                 },
        //                                 hint: Text("Status")),
        //                           ),
        //                         ),
        //                       ),
        //                       // BlocProvider(
        //                       //   create: (context) => CheckedBloc(null),
        //                       //   child: Row(
        //                       //     mainAxisSize: MainAxisSize.min,
        //                       //     children: <Widget>[
        //                       //       // CupertinoButton(
        //                       //       //     child: const Text('Approve'),
        //                       //       //     color: Colors.blue,
        //                       //       //     onPressed: context.watch<CheckedBloc>().state ==
        //                       //       //                 'approve' ||
        //                       //       //             context.watch<CheckedBloc>().state == null
        //                       //       //         ? () {
        //                       //       //             context.read<CheckedBloc>().emit('approve');
        //                       //       //           }
        //                       //       //         : null),
        //                       //       // CupertinoButton(
        //                       //       //     child: const Text('Reject'),
        //                       //       //     color: Colors.blue,
        //                       //       //     onPressed: context.watch<CheckedBloc>().state ==
        //                       //       //                 'reject' ||
        //                       //       //             context.watch<CheckedBloc>().state == null
        //                       //       //         ? () {
        //                       //       //             context.read<CheckedBloc>().emit('reject');
        //                       //       //           }
        //                       //       //         : null),
        //                       //       // CupertinoButton(
        //                       //       //     child: const Text('No'),
        //                       //       //     color: Colors.blue,
        //                       //       //     onPressed:
        //                       //       //         context.watch<CheckedBloc>().state == 'no' ||
        //                       //       //                 context.watch<CheckedBloc>().state == null
        //                       //       //             ? () {
        //                       //       //                 context.read<CheckedBloc>().emit('no');
        //                       //       //               }
        //                       //       //             : null),

        //                       //       GestureDetector(
        //                       //           onTap: () {
        //                       //             context.watch<CheckedBloc>().state ==
        //                       //                         'approve' ||
        //                       //                     context
        //                       //                             .watch<CheckedBloc>()
        //                       //                             .state ==
        //                       //                         null
        //                       //                 ? () {
        //                       //                     context
        //                       //                         .read<CheckedBloc>()
        //                       //                         .emit('approve');
        //                       //                   }
        //                       //                 : null;
        //                       //           },
        //                       //           child: Tooltip(
        //                       //             triggerMode: TooltipTriggerMode.tap,
        //                       //             message: 'Fully Packed',
        //                       //             child: Image.asset(
        //                       //               'assets/good.png',
        //                       //             ),
        //                       //           )),
        //                       //       const SizedBox(width: 20),
        //                       //       GestureDetector(
        //                       //           onTap: () {
        //                       //             context.watch<CheckedBloc>().state ==
        //                       //                         'disaaprove' ||
        //                       //                     context
        //                       //                             .watch<CheckedBloc>()
        //                       //                             .state ==
        //                       //                         null
        //                       //                 ? () {
        //                       //                     context
        //                       //                         .read<CheckedBloc>()
        //                       //                         .emit('disapprove');
        //                       //                   }
        //                       //                 : null;
        //                       //           },
        //                       //           child: Tooltip(
        //                       //               triggerMode: TooltipTriggerMode.tap,
        //                       //               message: 'Not good/Damaged Products',
        //                       //               child: Image.asset(
        //                       //                   'assets/ungood.png'))),
        //                       //       const SizedBox(width: 20),
        //                       //       GestureDetector(
        //                       //           onTap: () {
        //                       //             context.watch<CheckedBloc>().state ==
        //                       //                         'raise' ||
        //                       //                     context
        //                       //                             .watch<CheckedBloc>()
        //                       //                             .state ==
        //                       //                         null
        //                       //                 ? () {
        //                       //                     context
        //                       //                         .read<CheckedBloc>()
        //                       //                         .emit('raise');
        //                       //                   }
        //                       //                 : null;
        //                       //           },
        //                       //           child: Tooltip(
        //                       //               triggerMode: TooltipTriggerMode.tap,
        //                       //               message: 'Unavailable',
        //                       //               child: Image.asset(
        //                       //                   'assets/unavailable.png'))),
        //                       //       const SizedBox(width: 20),
        //                       //       GestureDetector(
        //                       //           onTap: () {
        //                       //             context.watch<CheckedBloc>().state ==
        //                       //                         'record' ||
        //                       //                     context
        //                       //                             .watch<CheckedBloc>()
        //                       //                             .state ==
        //                       //                         null
        //                       //                 ? () {
        //                       //                     context
        //                       //                         .read<CheckedBloc>()
        //                       //                         .emit('record');
        //                       //                   }
        //                       //                 : null;
        //                       //           },
        //                       //           child: Tooltip(
        //                       //               triggerMode: TooltipTriggerMode.tap,
        //                       //               message: 'Record addtional infor',
        //                       //               child:
        //                       //                   Image.asset('assets/infor.png'))),
        //                       //       // IconButton(
        //                       //       //     color: Colors.blue,
        //                       //       //     onPressed: () {
        //                       //       //       context.watch<CheckedBloc>().state == 'record' ||
        //                       //       //               context.watch<CheckedBloc>().state == null
        //                       //       //           ? () {
        //                       //       //               context.read<CheckedBloc>().emit('record');
        //                       //       //             }
        //                       //       //           : null;
        //                       //       //     },
        //                       //       //     icon: const Tooltip(
        //                       //       //         triggerMode: TooltipTriggerMode.tap,
        //                       //       //         message: 'Record addtional infor',
        //                       //       //         child: Icon(Icons.done_all_outlined))),
        //                       //       // IconButton(
        //                       //       //     color: Colors.blue,
        //                       //       //     onPressed: () {},
        //                       //       //     icon: const Tooltip(
        //                       //       //         triggerMode: TooltipTriggerMode.tap,
        //                       //       //         message: 'Record addtional infor',
        //                       //       //         child: Icon(Icons.delete))),
        //                       //       // IconButton(
        //                       //       //     onPressed: () {}, icon: const Icon(Icons.add_box)),
        //                       //       // IconButton(
        //                       //       //     onPressed: () {},
        //                       //       //     icon: const Icon(Icons.edit_rounded)),
        //                       //     ],
        //                       //   ),
        //                       // ),
        //                     ],
        //                   ),
        //                 ),
        //               ),
        //             );
        //           },
        //           childCount: 1000, // 1000 list items
        //         ),
        //       ),
        //     )
        //   ],
        // ),
      ]),
    ));
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
