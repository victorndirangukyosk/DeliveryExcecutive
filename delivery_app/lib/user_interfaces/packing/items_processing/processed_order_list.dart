import 'package:calendar_time/calendar_time.dart';
import 'package:delivery_app/cubits/accept_reject/accept_reject_cubit.dart';
import 'package:delivery_app/cubits/add_missing_products/add_missing_products_cubit_cubit.dart';
import 'package:delivery_app/cubits/authentication/token_cubit.dart';
import 'package:delivery_app/cubits/fetch_order_status_cubit/fetch_order_status_cubit.dart';
import 'package:delivery_app/cubits/order_details_cubit/order_details_cubit.dart';
import 'package:delivery_app/cubits/order_details_list/odetails_list_cubit.dart';
import 'package:delivery_app/cubits/processed_items_cubit/processed_items_cubit.dart';
import 'package:delivery_app/models/accept_reject/accept_reject.dart';
import 'package:delivery_app/models/missing/missing.dart';
import 'package:delivery_app/models/odetails_list/odetails_list.dart';
import 'package:delivery_app/services/api_service/api_service.dart';
import 'package:delivery_app/theme/box_icons.dart';
import 'package:delivery_app/user_interfaces/home/main_home_page.dart';
import 'package:delivery_app/user_interfaces/packing/my_orders_packing_person/my_orders_page.dart';
import 'package:delivery_app/user_interfaces/packing/scanner/scanner.dart';
import 'package:delivery_app/utilities/toast/toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:auto_route/auto_route.dart';
import 'package:delivery_app/configuration/configuration.dart';
import 'package:delivery_app/routes/router.gr.dart';

class OrderList extends StatefulWidget {
  final int orderId;

  OrderList({Key? key, required this.orderId}) : super(key: key);

  @override
  State<OrderList> createState() => _OrderListState();
}

class _OrderListState extends State<OrderList> {
  var size, height, width;

  TextEditingController _textFieldController1 = TextEditingController();

  TextEditingController _textFieldController2 = TextEditingController();

  final _formKey = GlobalKey<FormBuilderState>();

  _displayDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return FormBuilder(
            key: _formKey,
            child: AlertDialog(
              title: Text('Add Packing Notes'),
              content: SizedBox(
                height: 200,
                child: Column(
                  children: [
                    FormBuilderTextField(
                      name: 'quantity',
                      textInputAction: TextInputAction.go,
                      decoration: InputDecoration(hintText: "quantity"),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    FormBuilderTextField(
                      name: 'quantity_required',
                      controller: _textFieldController1,
                      textInputAction: TextInputAction.go,
                      decoration:
                          InputDecoration(hintText: "quantity required"),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    FormBuilderTextField(
                      name: 'comment',
                      controller: _textFieldController2,
                      textInputAction: TextInputAction.go,
                      decoration:
                          InputDecoration(hintText: "additional comments"),
                    ),
                  ],
                ),
              ),
              actions: <Widget>[
                CupertinoButton(
                  child: Text(
                    'Submit',
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.saveAndValidate()) {
                      context
                          .read<MissingCubit>()
                          .state
                          .add(Missing.fromJson(_formKey.currentState!.value));
                      Navigator.of(context).pop();
                    }
                  },
                )
              ],
            ),
          );
        });
  }

  TextEditingController textarea = TextEditingController();

  final PageController _controller = PageController(initialPage: 0);

  bool isPerformingRequest = false;

  ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    context.read<OrderDetailsCubit>().getOrderDetails(orderId: widget.orderId);
    context.read<OdetailsListCubit>().getOdetails(orderId: widget.orderId);
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                return Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  // ignore: avoid_unnecessary_containers
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
                                              color: Palette.orangeColor,
                                              fontWeight: FontWeight.bold,
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
                                                                  'stalluri'),
                                                              const Text(
                                                                  'stalluri@gmail.com'),
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
                                // Column(
                                //   children: [
                                //     const Text(
                                //       'Order Quantity:',
                                //       style: TextStyle(
                                //           color: Palette.placeholderGrey,
                                //           fontSize: 14),
                                //     ),
                                //   ],
                                // ),
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
                                      'Delivery Date:',
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
                              ],
                            ),
                          ],
                        ),
                      ),
                      //we can have the following o throjjjicf
                      Container(
                        // padding: const EdgeInsets.only(left: 20, right: 8),
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: Palette.greenColor,
                            borderRadius: BorderRadius.circular(10)),
                        child: IntrinsicHeight(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Expanded(
                                child: Column(
                                  children: const [
                                    Text(
                                      'Product Name',
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                              const VerticalDivider(),
                              Expanded(
                                child: Column(
                                  children: [
                                    Text(
                                      'Quantity',
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
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
                                        'Specifications',
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const VerticalDivider(),
                              Expanded(
                                child: Column(
                                  children: const [
                                    Text(
                                      'Action area',
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
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
                                      title: Text('Error'),
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
                          success: (odetailsList, success) {
                            return SingleChildScrollView(
                              child: Column(
                                children: [
                                  ...List.generate(
                                      odetailsList!.length,
                                      (index) => CardWidget(
                                            dits: odetailsList[index],
                                            acceptReject: AcceptReject(
                                                status: 'A',
                                                price: odetailsList[index]
                                                    .price!
                                                    .toString(),
                                                product_id: odetailsList[index]
                                                    .product_id!
                                                    .toString(),
                                                unit: odetailsList[index].unit,
                                                name: odetailsList[index].name,
                                                tax: odetailsList[index]
                                                    .tax!
                                                    .toString(),
                                                total: odetailsList[index]
                                                    .total
                                                    .toString(),
                                                quantity: odetailsList[index]
                                                    .quantity!
                                                    .toString(),
                                                product_store_id:
                                                    odetailsList[index]
                                                        .product_store_id,
                                                comment: 'Products accepted'),
                                            index: index,
                                            orderId: widget.orderId,
                                          ))
                                ],
                              ),
                            );
                          },
                          orElse: () {
                            return Container();
                          },
                        );
                      }),
                      const Spacer(),
                      Column(
                        children: [
                          // DropdownButtonHideUnderline(
                          //   child: ButtonTheme(
                          //     alignedDropdown: true,
                          //     child: BlocBuilder<FetchOrderStatusCubit,
                          //         FetchOrderStatusState>(
                          //       builder: (context, state) {
                          //         return state.maybeWhen(orElse: () {
                          //           return Container();
                          //         }, loading: () {
                          //           return const CupertinoActivityIndicator();
                          //         }, success: (statuses) {
                          //           return FormBuilderDropdown<int>(
                          //               name: 'status',
                          //               isExpanded: true,
                          //               items: List.generate(
                          //                   statuses.length,
                          //                   (index) => DropdownMenuItem(
                          //                         value: int.parse(
                          //                             statuses[index]
                          //                                 .order_status_id
                          //                                 .toString()),
                          //                         child: Row(
                          //                           children: [
                          //                             CircleAvatar(
                          //                               backgroundColor: Color(
                          //                                   int.parse(
                          //                                       '0xFF${statuses[index].color}')),
                          //                             ),
                          //                             const SizedBox(
                          //                               width: 10,
                          //                             ),
                          //                             Text(
                          //                               statuses[index].name!,
                          //                               style: const TextStyle(
                          //                                   color: Colors.red),
                          //                             ),
                          //                           ],
                          //                         ),
                          //                       )),
                          //               onChanged: (value) async {
                          //                 await ApiService.post(data: {
                          //                   'order_status_id': value!,
                          //                   'order_id': widget.orderId
                          //                 }, path: 'op/orderStatus');
                          //                 AppToast.showToast(
                          //                     message: 'Success',
                          //                     isError: false);
                          //               },
                          //               hint: const Text("Status"));
                          //         });
                          //       },
                          //     ),
                          //   ),
                          // ),

                          CupertinoButton(
                            child: Text('Proceed'),
                            onPressed: () {
                              context
                                  .read<AddMissingProductsCubitCubit>()
                                  .addMissing(
                                      products:
                                          context.read<MissingCubit>().state,
                                      orderId: widget.orderId);

                              AutoRouter.of(context)
                                  .replace(const MainHomeRoute());
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
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

class CardWidget extends StatefulWidget {
  final int orderId;
  final OdetailsList dits;
  final AcceptReject acceptReject;
  final int index;
  const CardWidget(
      {Key? key,
      required this.dits,
      required this.index,
      required this.orderId,
      required this.acceptReject})
      : super(key: key);

  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  var size, height, width;

  TextEditingController _textFieldController1 = TextEditingController();

  TextEditingController _textFieldController2 = TextEditingController();

  final _formKey = GlobalKey<FormBuilderState>();

  _displayDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return FormBuilder(
            key: _formKey,
            child: AlertDialog(
              title: Text('Add Packing Notes'),
              content: SizedBox(
                height: 200,
                child: Column(
                  children: [
                    FormBuilderTextField(
                      name: 'Packed_quantity ',
                      textInputAction: TextInputAction.go,
                      decoration: InputDecoration(hintText: "packed quantity"),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    FormBuilderTextField(
                      name: 'quantity_required',
                      controller: _textFieldController1,
                      textInputAction: TextInputAction.go,
                      decoration:
                          InputDecoration(hintText: "quantity required"),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    FormBuilderTextField(
                      name: 'comment',
                      controller: _textFieldController2,
                      textInputAction: TextInputAction.go,
                      decoration:
                          InputDecoration(hintText: "additional comments"),
                    ),
                  ],
                ),
              ),
              actions: <Widget>[
                CupertinoButton(
                  child: Text(
                    'Submit',
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.saveAndValidate()) {
                      context
                          .read<MissingCubit>()
                          .state
                          .add(Missing.fromJson(_formKey.currentState!.value));
                      Navigator.of(context).pop();
                    }
                  },
                )
              ],
            ),
          );
        });
  }

  TextEditingController textarea = TextEditingController();

  final PageController _controller = PageController(initialPage: 0);

  bool isPerformingRequest = false;

  ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(15),
      child: Container(
        color: Colors.grey[100 * (widget.index % 3 + 1)],
        height: 100,
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.dits.name!,
                  style: const TextStyle(
                      color: Palette.placeholderGrey, fontSize: 16),
                ),
              ],
            ),
          ),
          const VerticalDivider(),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text(
                    // odetailsList[index]
                    //     .quantity
                    //     .toString(),
                    widget.dits.quantity!.toString(),
                    style: const TextStyle(
                        color: Palette.placeholderGrey,
                        fontSize: 16,
                        fontWeight: FontWeight.w200),
                  ),
                  Text(
                    widget.dits.unit.toString(),
                    style: const TextStyle(
                        color: Palette.placeholderGrey,
                        fontSize: 16,
                        fontWeight: FontWeight.w200),
                  )
                ])
              ],
            ),
          ),
          const VerticalDivider(),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                child: Text(
                  widget.dits.product_note!,
                  softWrap: true,
                  style: const TextStyle(
                      color: Palette.placeholderGrey, fontSize: 16),
                ),
              )
            ],
          )),
          const VerticalDivider(),
          Expanded(
            child: Column(
              children: [
                // CupertinoButton(
                //     child: Icon(BoxIcons.bx_note), onPressed: () {}),
                Row(
                  children: [
                    Flexible(
                      child: DropdownButtonHideUnderline(
                        child: ButtonTheme(
                          alignedDropdown: true,
                          child: BlocBuilder<FetchOrderStatusCubit,
                              FetchOrderStatusState>(
                            builder: (context, state) {
                              return state.maybeWhen(orElse: () {
                                return Container();
                              }, loading: () {
                                return const CupertinoActivityIndicator();
                              }, success: (statuses) {
                                /// Make sure we have a value stored before displaying the text
                                return context
                                        .watch<ProcessedItemsCubit>()
                                        .state
                                        .where((element) =>
                                            element['order_id'] ==
                                                widget.orderId &&
                                            element['product_id'] ==
                                                widget.dits.product_id )
                                        .isNotEmpty
                                    ? 
                                    /// Display the selected status if it's already there
                                    Text(context
                                        .watch<ProcessedItemsCubit>()
                                        .state
                                        .where((element) =>
                                            element['order_id'] ==
                                                widget.orderId &&
                                            element['product_id'] ==
                                                widget.dits.product_id ).first['status'])
                                    : FormBuilderDropdown<dynamic>(
                                        name: 'status',
                                        onChanged: (e) async {
                                          if (e == 'Fully-Packed') {
                                            ///Accepted api call
                                            context
                                                .read<AcceptRejectCubit>()
                                                .actionArea(accept: [
                                              widget.acceptReject.copyWith(
                                                  status: 'A',
                                                  comment: 'Accept')
                                            ], orderId: widget.orderId);
                                            // TODO: This is a temporary solution
                                            context
                                                .read<ProcessedItemsCubit>()
                                                .state
                                                .add({
                                              'order_id': widget.orderId,
                                              'product_id':
                                                  widget.dits.product_id,
                                              'status': 'Accepted'
                                            });
                                          } else if (e == 'Rejected') {
                                            context
                                                .read<AcceptRejectCubit>()
                                                .actionArea(accept: [
                                              widget.acceptReject.copyWith(
                                                  status: 'R',
                                                  comment: 'Rejected')
                                            ], orderId: widget.orderId);
                                            context
                                                .read<ProcessedItemsCubit>()
                                                .state
                                                .add({
                                              'order_id': widget.orderId,
                                              'product_id':
                                                  widget.dits.product_id,
                                              'status': 'Rejected'
                                            });
                                          } else if (e == 'Missing') {
                                            /// Missing api call
                                            await _displayDialog(context);
                                            context
                                                .read<
                                                    AddMissingProductsCubitCubit>()
                                                .addMissing(
                                                    products: context
                                                        .read<MissingCubit>()
                                                        .state,
                                                    orderId: widget.orderId);
                                            context
                                                .read<ProcessedItemsCubit>()
                                                .state
                                                .add({
                                              'order_id': widget.orderId,
                                              'product_id':
                                                  widget.dits.product_id,
                                              'status': 'Missing'
                                            });
                                          }
                                        },
                                        isExpanded: true,
                                        items: [
                                          'Fully-Packed',
                                          'Rejected',
                                          'Missing'
                                        ]
                                            .map((e) => DropdownMenuItem(
                                                onTap: () {
                                                  // if (e == 'Fully-Packed') {
                                                  //   ///Accepted api call
                                                  //   context
                                                  //       .read<AcceptRejectCubit>()
                                                  //       .actionArea(accept: [
                                                  //     widget.acceptReject
                                                  //   ], orderId: widget.orderId);
                                                  // } else if (e == 'Rejected') {
                                                  //   /// Rejected api call

                                                  // } else if (e == 'Missing') {
                                                  //   /// Missing api call

                                                  // }
                                                },
                                                value: e,
                                                child: Text(e)))
                                            .toList()
                                        // List.generate(
                                        // statuses.length,
                                        // (index) => DropdownMenuItem(
                                        // value: int.parse(statuses[index]
                                        // .order_status_id
                                        // .toString()),
                                        // child: Row(
                                        // children:
                                        // [
                                        // CircleAvatar(
                                        //   backgroundColor: Color(
                                        //       int.parse(
                                        //           '0xFF${statuses[index].color}')
                                        // ),
                                        // ),
                                        //   const SizedBox(
                                        //     width: 10,
                                        //   ),
                                        //   Text(
                                        //     statuses[index].name!,
                                        //     style: const TextStyle(
                                        //         color: Colors.red),
                                        //   ),
                                        // ],
                                        // ),
                                        // )),
                                        ,
                                        // onChanged: (value) async {
                                        //   await ApiService.post(data: {
                                        //     'order_status_id': value!,
                                        //     'order_id': widget.orderId
                                        //   }, path: 'op/orderStatus');
                                        //   AppToast.showToast(
                                        //       message: 'Success', isError: false);
                                        // },
                                        hint: const Text("Status"));
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ]),
      ),
    );
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

class MissingCubit extends Cubit<List<Missing>> {
  MissingCubit(List<Missing> initialState) : super(initialState);
}
