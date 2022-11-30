// ignore_for_file: use_build_context_synchronously

import 'package:auto_route/auto_route.dart';
import 'package:calendar_time/calendar_time.dart';
import 'package:delivery_app/configuration/app_theme.dart';
import 'package:delivery_app/configuration/constant_values/constants.dart';
import 'package:delivery_app/configuration/palette/palette.dart';
import 'package:delivery_app/cubits/authentication/customer_cookie_cubit.dart';
import 'package:delivery_app/cubits/authentication/customer_token.dart';
import 'package:delivery_app/cubits/authentication/token_cubit.dart';
import 'package:delivery_app/cubits/cubits.dart';
import 'package:delivery_app/cubits/get_assigned_cubit/de/cubit/assigned_de_cubit.dart';
import 'package:delivery_app/cubits/kibandalist/kibandalist_cubit.dart';
import 'package:delivery_app/cubits/selected_kibanda/selected_kibanda_cubit.dart';
import 'package:delivery_app/cubits/transactions/transaction_cubit.dart';
import 'package:delivery_app/cubits/ui_cubits/home_bottom_index_cubit.dart';
import 'package:delivery_app/cubits/ui_cubits/transaction_top_index_cubit.dart';
import 'package:delivery_app/models/assigned/de/assigned_de.dart';
import 'package:delivery_app/models/customer_token_model.dart';
import 'package:delivery_app/models/odetails_list/de/odetails_de.dart';
import 'package:delivery_app/models/transactions/transactions.dart';
import 'package:delivery_app/routes/router.gr.dart';

import 'package:delivery_app/user_interfaces/packing/my_orders_packing_person/order_details_page.dart';
import 'package:delivery_app/user_interfaces/settings/settings_page.dart';
import 'package:delivery_app/utilities/rest_service/rest_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get_it/get_it.dart';
import 'package:form_builder_extra_fields/form_builder_extra_fields.dart';

class MainHomeDeliveryExecutivePage extends StatelessWidget {
  const MainHomeDeliveryExecutivePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      HomeWidget(),
      // BasketWidget(),
      OptionsWidget(),
      // TransactionPage(),
    ];
    Size size = MediaQuery.of(context).size;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    context.read<AssignedDeCubit>().getAssignedDeOrders();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          elevation: 0,
          // leading: Icon(
          //   Icons.menu,
          //   color: Palette.greenColor,
          // ),
          backgroundColor: Colors.white,
          title: const Text.rich(TextSpan(
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
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
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
                                          const Text('Stalluri'),
                                          const Text('stalluri@gmail.com'),
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
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          SettingsPage()));
                                            },
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
                                              AutoRouter.of(context)
                                                  .replace(SplashScreen());
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
                        child: const Icon(
                          Icons.dehaze,
                          size: 40,
                          color: Palette.orangeColor,
                        )),
                  ),
                ),
              ],
            ),
          ]),
      body: pages[context.watch<HomeBottomIndexCubit>().state],
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: true,
        selectedIconTheme: IconThemeData(color: Palette.orangeColor),
        selectedItemColor: Palette.orangeColor,
        unselectedItemColor: Palette.placeholderGrey,
        onTap: (val) {
          context.read<HomeBottomIndexCubit>().change(val);
        },
        currentIndex: context.watch<HomeBottomIndexCubit>().state,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                CupertinoIcons.home,
              ),
              label: 'Home'),
          // BottomNavigationBarItem(
          //     icon: Icon(CupertinoIcons.bag), label: 'Baskets'),
          BottomNavigationBarItem(
              icon: Icon(
                FontAwesomeIcons.moneyBillWheat,
                color: Palette.orangeColor,
              ),
              label: 'Transactions'),
        ],
      ),
    );
  }
}

class OptionsWidget extends StatefulWidget {
  const OptionsWidget({Key? key}) : super(key: key);

  @override
  State<OptionsWidget> createState() => _OptionsWidgetState();
}

class _OptionsWidgetState extends State<OptionsWidget> {
  @override
  Widget build(BuildContext context) {
    var _chosenValue;
    return Scaffold(
      appBar: AppBar(
        title: Text('Customer Select'),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(0.0),
          child: BlocBuilder<KibandalistCubit, KibandalistState>(
            builder: (context, state) {
              return state.maybeWhen(
                  loading: () => const Center(
                        child: CircularProgressIndicator(),
                      ),
                  success: ((kibandaskistores) => DropdownButton<String>(
                        onChanged: (value) {},
                        value: _chosenValue,
                        //elevation: 5,
                        style: TextStyle(color: Colors.black),

                        items: <String>[
                          'Android',
                          'IOS',
                          'Flutter',
                          'Node',
                          'Java',
                          'Python',
                          'PHP',
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        hint: Text(
                          "Please Select a Kibanda",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                        // onChanged: (String value) {
                        //   setState(() {
                        //     _chosenValue = value;
                        //   });
                        // },
                      )),
                  orElse: () {
                    return Container();
                  });
            },
          ),
        ),
      ),
    );
    // Center(
    //   child: Flexible(child: BlocBuilder<KibandalistCubit, KibandalistState>(
    //     builder: (context, state) {
    //       return state.maybeWhen(
    //           loading: () => const Center(
    //                 child: CircularProgressIndicator(),
    //               ),
    //           success: ((kibandaskistores) => Container(
    //                 decoration: BoxDecoration(
    //                   color: Colors.black,
    //                 ),
    //                 child: FormBuilderSearchableDropdown<String>(
    //                   name: '',
    //                   decoration: const InputDecoration(
    //                     labelText: 'Select Kibanda',
    //                   ),
    //                   popupProps: const PopupProps.menu(
    //                       showSearchBox: true, title: Text('Search Kibanda')),
    //                   items: kibandaskistores!
    //                       .map((e) => e.firstname! + ' ' + e.lastname!)
    //                       .toList(),
    //                   onChanged: (val) async {
    //                     var selectedKibanda = kibandaskistores!.firstWhere(
    //                         (element) =>
    //                             element.firstname! + ' ' + element.lastname! ==
    //                             val);
    //                     context
    //                         .read<SelectedKibandaCubit>()
    //                         .save(selectedKibanda);
    //                     var response = await ApiService.postCustomer(
    //                         data: {'telephone': selectedKibanda.telephone},
    //                         path: 'customer/login/loginascustomer');
    //                     var data = response['token'];
    //                     var cookieData = response['cookie'];
    //                     context.read<CustomerTokenCubit>().emit(data);
    //                     // context.read<TokenCubit>().emit(data);
    //                     context.read<CustomerCookieCubit>().emit(cookieData);
    //                     CustomerCookieCubit cookieCubit =
    //                         BlocProvider.of<CustomerCookieCubit>(context);
    //                     GetIt.I.registerSingleton(cookieCubit);
    //                     GetIt.I.registerSingleton<CustomerTokenModel>(
    //                         CustomerTokenModel(
    //                             token: data, cookie: cookieData));

    //                     /// This [val] is the value of the selected item (Customer ID)
    //                     // context
    //                     //     .read<VendorProductsCubit>()
    //                     //     .getVendorProductsByAllCategories(
    //                     //         customerId: selectedKibanda
    //                     //             .customer_id as int);
    //                     context.read<TransactionCubit>().getallTransactions();
    //                     // context.read()<KibandaListCubit>()
    //                     // getVibandas();
    //                   },
    //                 ),
    //               )),
    //           orElse: () {
    //             return Container();
    //           });
    //     },
    //   )),
    // );
  }
}

class TransactionPage extends StatelessWidget {
  const TransactionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      SuccessfulWidget(),
      PendingWidget(
        orderData: {},
      ),
      CancelledWidget()
    ];
    return Stack(
      children: [
        Scaffold(
          // appBar: AppBar(
          //   title: const Text('My Transactions'),
          //   // backButton: () => Navigator.of(context).pop(),
          //   actions: [
          //     // if (this.model!.selectedTab == "Pending Payments")
          //     IconButton(
          //       onPressed: () {},
          //       // onPressed: this.model!.paySelected,
          //       icon: const Icon(Icons.payments),
          //     ),
          //   ],
          // ),
          body: SingleChildScrollView(
            child: Column(
              // key: UniqueKey(),
              children: [
                SizedBox(
                  height: 130000,
                ),
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: Palette.greenColor,
                      borderRadius: BorderRadius.circular(10)),
                  child: IntrinsicHeight(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Row(
                        //   children: const [
                        //     Text(
                        //       'Pick your Kibanda here ',
                        //       style: TextStyle(
                        //         fontFamily: 'Red Hat Display-BoldItalic',
                        //         fontStyle: FontStyle.italic,
                        //       ),
                        //     ),
                        //     Icon(
                        //       Boxicons.bx_arrow_from_left,
                        //       size: 14,
                        //     ),
                        //   ],
                        // ),
                        Flexible(child:
                            BlocBuilder<KibandalistCubit, KibandalistState>(
                          builder: (context, state) {
                            return state.maybeWhen(
                                loading: () => const Center(
                                      child: CircularProgressIndicator(),
                                    ),
                                success: ((kibandaskistores) =>
                                    FormBuilderSearchableDropdown<String>(
                                      name: '',
                                      decoration: const InputDecoration(
                                        labelText: 'Select Kibanda',
                                      ),
                                      popupProps: const PopupProps.menu(
                                          showSearchBox: true,
                                          title: Text('Search Kibanda')),
                                      items: kibandaskistores!
                                          .map((e) =>
                                              e.firstname! + ' ' + e.lastname!)
                                          .toList(),
                                      onChanged: (val) async {
                                        var selectedKibanda = kibandaskistores!
                                            .firstWhere((element) =>
                                                element.firstname! +
                                                    ' ' +
                                                    element.lastname! ==
                                                val);
                                        context
                                            .read<SelectedKibandaCubit>()
                                            .save(selectedKibanda);
                                        var response = await ApiService
                                            .postCustomer(data: {
                                          'telephone': selectedKibanda.telephone
                                        }, path: 'customer/login/loginascustomer');
                                        var data = response['token'];
                                        var cookieData = response['cookie'];
                                        context
                                            .read<CustomerTokenCubit>()
                                            .emit(data);
                                        // context.read<TokenCubit>().emit(data);
                                        context
                                            .read<CustomerCookieCubit>()
                                            .emit(cookieData);
                                        CustomerCookieCubit cookieCubit =
                                            BlocProvider.of<
                                                CustomerCookieCubit>(context);
                                        GetIt.I.registerSingleton(cookieCubit);
                                        GetIt.I.registerSingleton<
                                                CustomerTokenModel>(
                                            CustomerTokenModel(
                                                token: data,
                                                cookie: cookieData));

                                        /// This [val] is the value of the selected item (Customer ID)
                                        // context
                                        //     .read<VendorProductsCubit>()
                                        //     .getVendorProductsByAllCategories(
                                        //         customerId: selectedKibanda
                                        //             .customer_id as int);
                                        context
                                            .read<TransactionCubit>()
                                            .getallTransactions();
                                      },
                                    )),
                                orElse: () {
                                  return Container();
                                });
                          },
                        )),
                      ],
                    ),
                  ),
                ),
                pages[context.watch<TransactionIndexCubit>().state],
              ],
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            showUnselectedLabels: true,
            selectedIconTheme: IconThemeData(color: Palette.orangeColor),
            selectedItemColor: Palette.orangeColor,
            unselectedItemColor: Palette.placeholderGrey,
            onTap: (val) {
              context.read<TransactionIndexCubit>().change(val);
            },
            currentIndex: context.watch<TransactionIndexCubit>().state,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(
                    CupertinoIcons.hand_thumbsup,
                  ),
                  label: 'Successful'),
              // BottomNavigationBarItem(
              //     icon: Icon(CupertinoIcons.bag), label: 'Baskets'),
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.timer_fill), label: 'Pending'),
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.return_icon), label: 'Cancelled'),
            ],
          ),
        ),
      ],
    );
  }
}

class PendingWidget extends StatelessWidget {
  final Map<String, dynamic> orderData;
  const PendingWidget({Key? key, required this.orderData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Pending Transactions',
          style: TextStyle(
            fontFamily: 'Red Hat Display-Medium ',
            // fontStyle: FontStyle.italic,
            fontSize: 24,
            // fontWeight: FontWeight.bold,
            // color: Palette.orangeColor,
          ),
        ),
        automaticallyImplyLeading: false,
        elevation: 0,
        // backgroundColor: Colors.white,
      ),
      body: BlocConsumer<TransactionCubit, TransactionState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return state.maybeWhen(loading: () {
            return const Center(
              child: CircularProgressIndicator(color: Palette.greenColor),
            );
          }, success: (pendingTransactions, successfulTransactions,
              cancelledTransactions) {
            return AnimationLimiter(
              child: ListView.builder(
                itemCount: pendingTransactions.length,
                itemBuilder: (BuildContext context, int index) {
                  return AnimationConfiguration.staggeredList(
                    position: index,
                    duration: const Duration(milliseconds: 500),
                    child: SlideAnimation(
                        verticalOffset: 50.0,
                        child: FadeInAnimation(
                            child: CardTwo(
                          pendingTransactions: pendingTransactions[index],
                          orderReference: '',
                          orderData: orderData,
                        ))),
                  );
                },
              ),
            );
          }, orElse: () {
            return Container();
          });
        },
      ),
    );
  }
}

class SuccessfulWidget extends StatelessWidget {
  const SuccessfulWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Successful Transactions',
            style: TextStyle(
              fontFamily: 'Red Hat Display-Medium ',
              // fontStyle: FontStyle.italic,
              fontSize: 24,
              // fontWeight: FontWeight.bold,
              // color: Palette.orangeColor,
            ),
          ),
          automaticallyImplyLeading: false,
          elevation: 0,
          // backgroundColor: Colors.white,
        ),
        body: BlocConsumer<TransactionCubit, TransactionState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            return state.maybeWhen(loading: () {
              return const Center(
                child: CircularProgressIndicator(color: Palette.greenColor),
              );
            }, success: (pendingTransactions, successfulTransactions,
                cancelledTransactions) {
              return cancelledTransactions.isEmpty
                  ? Center(
                      child: Text('No Orders have been paid yet'),
                    )
                  : AnimationLimiter(
                      child: ListView.builder(
                        itemCount: successfulTransactions.length,
                        itemBuilder: (BuildContext context, int index) {
                          return AnimationConfiguration.staggeredList(
                            position: index,
                            duration: const Duration(milliseconds: 500),
                            child: SlideAnimation(
                                verticalOffset: 50.0,
                                child: FadeInAnimation(
                                    child: CardOne(
                                  successfulTransactions:
                                      successfulTransactions[index],
                                ))),
                          );
                        },
                      ),
                    );
            }, orElse: () {
              return Center(
                child: Text(
                  'You do not have any Transactions yet',
                  style: TextStyle(color: Palette.orangeColor),
                ),
              );
            });
          },
        ),
      ),
    );
  }
}

class CardOne extends StatelessWidget {
  final Transactions successfulTransactions;
  const CardOne({Key? key, required this.successfulTransactions})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // key: ValueKey(data.orderId),
      margin: EdgeInsets.only(bottom: 4),
      padding: const EdgeInsets.only(top: 12, bottom: 12, right: 16, left: 8),
      color: AppTheme.colorWhite,
      child: Row(
        children: [
          SizedBox(
            height: 30,
            width: 30,
            // child: Checkbox(
            //   value: Transaction.isSelected,
            //   onChanged: (val) {
            //     // setState(() {
            //     //   data.isSelected = val;
            //     // });
            //   },
            // ),
          ),
          Constants.widthSizeBox,
          Expanded(
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text.rich(
                        TextSpan(
                          text: "Order Id : ",
                          style: TextStyle(
                            color: AppTheme.colorDarkGrey,
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                          children: [
                            TextSpan(
                              text: successfulTransactions.orderId,
                              style: TextStyle(
                                color: AppTheme.colorDarkGrey,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Text(
                      // "${data.currencyCode} ${data.total}",
                      'KES 6590',
                      style: const TextStyle(
                        color: AppTheme.colorDarkGrey,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                Constants.heightSizeBox,
                Row(
                  children: [
                    Text.rich(
                      TextSpan(
                        text: "Order Date : ",
                        style: TextStyle(
                          color: AppTheme.colorDarkGrey,
                          fontWeight: FontWeight.w600,
                        ),
                        children: [
                          TextSpan(
                            text: CalendarTime(DateTime.parse(
                                    successfulTransactions.date_added!))
                                .toHuman,
                            style: TextStyle(
                              color: AppTheme.colorDarkGrey,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text.rich(
                        TextSpan(
                          text: "Payment Methods : ",
                          style: TextStyle(
                            color: AppTheme.colorDarkGrey,
                            fontWeight: FontWeight.w600,
                          ),
                          children: [
                            TextSpan(
                              text: "Mpesa on Delivery",
                              style: TextStyle(
                                color: AppTheme.colorDarkGrey,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        // var amount = numberFunction(getNumPrice(data.total!));
                        // amount = amount.replaceAll(".", "");
                        // var orderIds = [];
                        // orderIds.add(data.orderId);
                        // this.model!.payNowButton(amount, orderIds);
                      },
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 2, horizontal: 8),
                        color: AppTheme.colorPerpal,
                        child: Text(
                          "PAY NOW",
                          style: TextStyle(
                            color: AppTheme.colorWhite,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CardTwo extends StatelessWidget {
  final String orderReference;
  final Map<String, dynamic> orderData;
  final Transactions pendingTransactions;
  const CardTwo({
    Key? key,
    required this.pendingTransactions,
    required this.orderReference,
    required this.orderData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // key: ValueKey(data.orderId),
      margin: EdgeInsets.only(bottom: 4),
      padding: const EdgeInsets.only(top: 12, bottom: 12, right: 16, left: 8),
      color: AppTheme.colorWhite,
      child: Row(
        children: [
          SizedBox(
            height: 30,
            width: 30,
            // child: Checkbox(
            //   value: Transaction.isSelected,
            //   onChanged: (val) {
            //     // setState(() {
            //     //   data.isSelected = val;
            //     // });
            //   },
            // ),
          ),
          Constants.widthSizeBox,
          Expanded(
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text.rich(
                        TextSpan(
                          text: "Order Id : ",
                          style: TextStyle(
                            color: AppTheme.colorDarkGrey,
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                          children: [
                            TextSpan(
                              text: pendingTransactions.orderId,
                              style: TextStyle(
                                color: AppTheme.colorDarkGrey,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Text(
                      // "${data.currencyCode} ${data.total}",
                      "${'KES'} ${pendingTransactions.total!}",

                      style: const TextStyle(
                        color: AppTheme.colorDarkGrey,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                Constants.heightSizeBox,
                Row(
                  children: [
                    Text.rich(
                      TextSpan(
                        text: "Order Date : ",
                        style: TextStyle(
                          color: AppTheme.colorDarkGrey,
                          fontWeight: FontWeight.w600,
                        ),
                        children: [
                          TextSpan(
                            text: CalendarTime(DateTime.parse(
                                    pendingTransactions.date_added!))
                                .toHuman,
                            style: TextStyle(
                              color: AppTheme.colorDarkGrey,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text.rich(
                        TextSpan(
                          text: "Payment Method : ",
                          style: TextStyle(
                            color: AppTheme.colorDarkGrey,
                            fontWeight: FontWeight.w600,
                          ),
                          children: [
                            TextSpan(
                              text: pendingTransactions.paymentMethod,
                              style: TextStyle(
                                color: AppTheme.colorDarkGrey,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        // var data = orderData;
                        // data.addAll({

                        //   "payment_method": 'mpesa on delivery',
                        //   "dropoff_notes": '',
                        //   "payment_method_code": 'mod',
                        //   "shipping_address_id": context
                        //       .read<SelectedKibandaCubit>()
                        //       .state!
                        //       .address_id!,
                        //   // "shipping_city_id": context
                        //   //     .read<DeliveryAddressSelectionCubit>()
                        //   //     .state!
                        //   //     .address_id!,
                        //   // 'login_latitude':
                        //   //     context.read<UserLocationCubit>().state.latitude,
                        //   // 'login_longitude':
                        //   //     context.read<UserLocationCubit>().state.longitude,
                        //   'login_mode': 'm',
                        //   "payment_method['code']": context
                        //       .read<SelectedPaymentMethodCubit>()
                        //       .state!
                        //       .code!,
                        //   "payment_method['sort_order']": context
                        //           .read<SelectedPaymentMethodCubit>()
                        //           .state!
                        //           .sort_order ??
                        //       '0',
                        //   "payment_method['terms']": context
                        //           .read<SelectedPaymentMethodCubit>()
                        //           .state!
                        //           .terms ??
                        //       '',
                        //   "payment_method['title']": context
                        //           .read<SelectedPaymentMethodCubit>()
                        //           .state!
                        //           .title ??
                        //       '',
                        //   'mpesa_refrence_id':
                        //       orderData['order_reference_number']
                        // });
                        // var phoneData = AutoRouter.of(context).push(
                        //     MpesaPaymentRoute(
                        //         orderReference:
                        //             orderData['order_reference_number'],
                        //         data: data));
                        // data.addAll(phoneData as Map<String, dynamic>);
                        // context.read<PlaceOrderCubit>().placeOrderMpesa(data);
                      },
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 2, horizontal: 8),
                        color: AppTheme.colorPerpal,
                        child: Text(
                          "PAY NOW",
                          style: TextStyle(
                            color: AppTheme.colorWhite,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CardThree extends StatelessWidget {
  final Transactions cancelledTransactions;
  const CardThree({Key? key, required this.cancelledTransactions})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // key: ValueKey(data.orderId),
      margin: EdgeInsets.only(bottom: 4),
      padding: const EdgeInsets.only(top: 12, bottom: 12, right: 16, left: 8),
      color: AppTheme.colorWhite,
      child: Row(
        children: [
          SizedBox(
            height: 30,
            width: 30,
            // child: Checkbox(
            //   value: Transaction.isSelected,
            //   onChanged: (val) {
            //     // setState(() {
            //     //   data.isSelected = val;
            //     // });
            //   },
            // ),
          ),
          Constants.widthSizeBox,
          Expanded(
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text.rich(
                        TextSpan(
                          text: "Order Id : ",
                          style: TextStyle(
                            color: AppTheme.colorDarkGrey,
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                          children: [
                            TextSpan(
                              text: cancelledTransactions.orderId,
                              style: TextStyle(
                                color: AppTheme.colorDarkGrey,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Text(
                      // "${data.currencyCode} ${data.total}",
                      'KES 6590',
                      style: const TextStyle(
                        color: AppTheme.colorDarkGrey,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                Constants.heightSizeBox,
                Row(
                  children: [
                    Text.rich(
                      TextSpan(
                        text: "Order Date : ",
                        style: TextStyle(
                          color: AppTheme.colorDarkGrey,
                          fontWeight: FontWeight.w600,
                        ),
                        children: [
                          TextSpan(
                            text: CalendarTime(DateTime.parse(
                                    cancelledTransactions.date_added!))
                                .toHuman,
                            style: TextStyle(
                              color: AppTheme.colorDarkGrey,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text.rich(
                        TextSpan(
                          text: "Payment Methods : ",
                          style: TextStyle(
                            color: Palette.orangeColor,
                            fontWeight: FontWeight.w600,
                          ),
                          children: [
                            TextSpan(
                              text: "Mpesa on Delivery",
                              style: TextStyle(
                                color: Palette.orangeColor,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        // var amount = numberFunction(getNumPrice(data.total!));
                        // amount = amount.replaceAll(".", "");
                        // var orderIds = [];
                        // orderIds.add(data.orderId);
                        // this.model!.payNowButton(amount, orderIds);
                      },
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 2, horizontal: 8),
                        color: Palette.orangeColor,
                        child: Text(
                          "PAY NOW",
                          style: TextStyle(
                            color: Palette.orangeColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CancelledWidget extends StatelessWidget {
  const CancelledWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Cancelled Transactions',
          style: TextStyle(
            fontFamily: 'Red Hat Display-Medium ',
            // fontStyle: FontStyle.italic,
            fontSize: 24,
            // fontWeight: FontWeight.bold,
            // color: Palette.orangeColor,
          ),
        ),
        automaticallyImplyLeading: false,
        elevation: 0,
        // backgroundColor: Colors.white,
      ),
      body: BlocConsumer<TransactionCubit, TransactionState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return state.maybeWhen(loading: () {
            return const Center(
              child: CircularProgressIndicator(color: Palette.greenColor),
            );
          }, success: (pendingTransactions, successfulTransactions,
              cancelledTransactions) {
            return cancelledTransactions.isEmpty
                ? const Center(
                    child: Text('No cancelled transactions'),
                  )
                : AnimationLimiter(
                    child: ListView.builder(
                      itemCount: cancelledTransactions.length,
                      itemBuilder: (BuildContext context, int index) {
                        return AnimationConfiguration.staggeredList(
                          position: index,
                          duration: const Duration(milliseconds: 500),
                          child: SlideAnimation(
                              verticalOffset: 50.0,
                              child: FadeInAnimation(
                                  child: CardThree(
                                cancelledTransactions:
                                    cancelledTransactions[index],
                              ))),
                        );
                      },
                    ),
                  );
          }, orElse: () {
            return Container();
          });
        },
      ),
    );
  }
}

class HomeWidget extends StatelessWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AssignedDeCubit, AssignedDeState>(
          listener: (context, state) {
        state.maybeWhen(
            orElse: () {},
            failed: (e) {
              showDialog(
                  context: context,
                  builder: (context) {
                    return CupertinoAlertDialog(
                      title: Text('Error'),
                      content: Text('Ooops! you might be disconnected'),
                    );
                  });
            });
      }, builder: (context, state) {
        return state.maybeWhen(
          loading: () {
            return const Center(
              child: CupertinoActivityIndicator(color: Palette.greenColor),
            );
          },
          success: (ordersde) {
            return Column(
              children: [
                const SizedBox(height: 20),
                Container(
                  height: 40,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: Palette.greenColor,
                      borderRadius: BorderRadius.circular(10)),
                  child: IntrinsicHeight(
                    child: Row(
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Text(
                          'My orders',
                          maxLines: 1,
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontFamily: 'Helvetica',
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: Stack(
                    children: [
                      LayoutBuilder(
                        builder:
                            (BuildContext context, BoxConstraints constraints) {
                          if (constraints.maxWidth <= 610) {
                            return AnimationLimiter(
                              child: ListView.builder(
                                  itemCount: ordersde.length,
                                  shrinkWrap: true,
                                  physics: const BouncingScrollPhysics(
                                      parent: AlwaysScrollableScrollPhysics()),
                                  itemBuilder: (BuildContext context, index) {
                                    return AnimationConfiguration.staggeredList(
                                      position: index,
                                      duration:
                                          const Duration(milliseconds: 500),
                                      child: SlideAnimation(
                                        verticalOffset: 50.0,
                                        child: FadeInAnimation(
                                          child: CardWidget(
                                            orderde: ordersde[index],
                                          ),
                                        ),
                                      ),
                                    );
                                  }),
                            );
                          } else {
                            return GridView.builder(
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        childAspectRatio: 9 / 2,
                                        crossAxisSpacing: 5,
                                        mainAxisSpacing: 5),
                                itemCount: ordersde.length,
                                itemBuilder: (BuildContext ctx, index) {
                                  return CardTwoo(
                                    orderde: ordersde[index],
                                  );
                                });
                          }
                        },
                      ),

                      // SingleChildScrollView(
                      //   child: Container(
                      //     child: Column(
                      //         // mainAxisAlignment: MainAxisAlignment.center,
                      //         // children: List.generate(100, (index) => CardWidget())),
                      //         children: [
                      //           ...List.generate(
                      //               ordersde.length,
                      //               (index) => CardWidget(
                      //                     orderde: ordersde[index],
                      //                   ))
                      //         ]),
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ],
            );
          },
          orElse: () {
            return Container();
          },
        );
      }),
    );
  }
}

class CardTwoo extends StatelessWidget {
  final AssignedDe orderde;
  const CardTwoo({
    Key? key,
    required this.orderde,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(16.0)),
      child: FittedBox(
        child: Container(
            margin: const EdgeInsets.all(30.0),
            decoration: BoxDecoration(
                // color: Palette.orangeBackgroundColor,
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(10.0),
                    bottomLeft: Radius.circular(10.0),
                    bottomRight: Radius.circular(10.0),
                    topLeft: Radius.circular(10.0)),
                border: Border.all(width: 1, color: Colors.black)),
            constraints: const BoxConstraints(
              maxHeight: double.infinity,
            ),
            child: Column(children: [
              Container(
                height: height / 4,
                padding: const EdgeInsets.all(8),
                // width: width,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                // crossAxisAlignment: CrossAxisAlignment.start,
                                // mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  const Text(
                                    "Order Id",
                                    style: TextStyle(
                                      fontFamily: 'Red Hat Display',
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Palette.orangeColor,
                                    ),
                                  ),
                                  SizedBox(width: width * 0.01),
                                  Text(
                                    orderde.order_id!.toString(),
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Palette.placeholderGrey,
                                      // color: Colors.orange,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: height * 0.02),
                              Row(
                                // crossAxisAlignment: CrossAxisAlignment.start,
                                // mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  const Text(
                                    "Customer Name",
                                    style: TextStyle(
                                      fontFamily: 'Red Hat Display',
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Palette.orangeColor,
                                    ),
                                  ),
                                  SizedBox(width: width * 0.01),
                                  Text(
                                    orderde.firstname!,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Palette.placeholderGrey,
                                      // color: Colors.orange,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: height * 0.02),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Text(
                                    "Order Status",
                                    style: TextStyle(
                                        fontFamily: 'Red Hat Display',
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Palette.orangeColor),
                                  ),
                                  SizedBox(width: width * 0.01),
                                  Text(
                                    orderde.order_status!.toString(),
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Palette.placeholderGrey,
                                    ),
                                  ),
                                ],
                              ),
                            ]),
                        const SizedBox(width: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                const Text(
                                  'Delivery Location',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Palette.orangeColor,
                                    fontFamily: 'Red Hat Display',
                                  ),
                                ),
                                SizedBox(width: width * 0.01),
                              ],
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 150,
                                  child: Text(
                                    orderde.shipping_address!,
                                    maxLines: 3,
                                    overflow: TextOverflow.clip,
                                    // softWrap: false,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Palette.placeholderGrey,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Spacer(),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: CupertinoButton.filled(
                                // style: ElevatedButton.styleFrom(
                                //   // primary: Colors.black,
                                //   minimumSize: const Size.fromHeight(50), // NEW
                                // ),
                                onPressed: () {
                                  AutoRouter.of(context)
                                      .push(DirectionsToAddress(
                                    orderId: orderde.order_id!,
                                  ));
                                  // AutoRouter.of(context)
                                  //     .push(ReadyForDelivery());
                                },
                                child: const Text(
                                  'Start Trip ',
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Text(
                                  'Number of Products',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Palette.orangeColor,
                                    fontFamily: 'Red Hat Display',
                                  ),
                                ),
                                SizedBox(width: width * 0.01),
                                Text(
                                  // order.delivery_date!,
                                  orderde.products_count.toString(),
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Palette.placeholderGrey,
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: height * 0.02),
                            Row(
                              children: [
                                const Text(
                                  'Date of Delivery',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Palette.orangeColor,
                                    fontFamily: 'Red Hat Display',
                                  ),
                                ),
                                SizedBox(width: width * 0.01),
                                Text(
                                  // order.delivery_date!,
                                  CalendarTime(DateTime.parse(
                                          orderde.delivery_date!))
                                      .toHuman,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Palette.placeholderGrey,
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: height * 0.02),
                            Row(children: [
                              const Text(
                                "Time of Delivery",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: 'Red Hat Display',
                                  fontWeight: FontWeight.bold,
                                  color: Palette.orangeColor,
                                ),
                              ),
                              SizedBox(width: width * 0.01),
                              Text(
                                orderde.delivery_timeslot!,
                                // CalendarTime(DateTime.parse(order.delivery_timeslot!))
                                //     .toHuman,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Palette.placeholderGrey,
                                ),
                              )
                            ]),
                          ],
                        ),
                      ]),
                ),
              ),
            ])),
      ),
    );
  }
}

class CardWidget extends StatelessWidget {
  final AssignedDe orderde;
  const CardWidget({
    Key? key,
    required this.orderde,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(16.0)),
      child: FittedBox(
        child: Container(
            margin: const EdgeInsets.all(30.0),
            decoration: BoxDecoration(
                // color: Palette.orangeBackgroundColor,
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(10.0),
                    bottomLeft: Radius.circular(10.0),
                    bottomRight: Radius.circular(10.0),
                    topLeft: Radius.circular(10.0)),
                border: Border.all(width: 1, color: Colors.black)),
            constraints: const BoxConstraints(
              maxHeight: double.infinity,
            ),
            child: Column(children: [
              Container(
                height: height / 4,
                padding: const EdgeInsets.all(8),
                // width: width,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                // crossAxisAlignment: CrossAxisAlignment.start,
                                // mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  const Text(
                                    "Order Id",
                                    style: TextStyle(
                                      fontFamily: 'Red Hat Display',
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Palette.orangeColor,
                                    ),
                                  ),
                                  SizedBox(width: width * 0.01),
                                  Text(
                                    orderde.order_id!.toString(),
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Palette.placeholderGrey,
                                      // color: Colors.orange,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: height * 0.02),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Text(
                                    "Customer",
                                    style: TextStyle(
                                        fontFamily: 'Red Hat Display',
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Palette.orangeColor),
                                  ),
                                  SizedBox(width: width * 0.01),
                                  Text(
                                    orderde.firstname!,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Palette.placeholderGrey,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: height * 0.02),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Text(
                                    "Order Status",
                                    style: TextStyle(
                                        fontFamily: 'Red Hat Display',
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Palette.orangeColor),
                                  ),
                                  SizedBox(width: width * 0.01),
                                  Text(
                                    orderde.order_status!.toString(),
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Palette.placeholderGrey,
                                    ),
                                  ),
                                ],
                              ),
                            ]),
                        const SizedBox(width: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                const Text(
                                  'Delivery Location',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Palette.orangeColor,
                                    fontFamily: 'Red Hat Display',
                                  ),
                                ),
                                SizedBox(width: width * 0.01),
                              ],
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 150,
                                  child: Text(
                                    orderde.shipping_address!,
                                    maxLines: 3,
                                    overflow: TextOverflow.clip,
                                    // softWrap: false,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Palette.placeholderGrey,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            const Spacer(
                              flex: 3,
                            ),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: CupertinoButton.filled(
                                // style: ElevatedButton.styleFrom(
                                //   // primary: Colors.black,
                                //   minimumSize: const Size.fromHeight(50), // NEW
                                // ),
                                onPressed: () {
                                  AutoRouter.of(context)
                                      .push(DirectionsToAddress(
                                    orderId: orderde.order_id!,
                                  ));
                                },
                                child: const Text(
                                  'Start Trip ',
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Text(
                                  'Number of Products',
                                  style: TextStyle(
                                      fontFamily: 'Red Hat Display',
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Palette.orangeColor),
                                ),
                                SizedBox(width: width * 0.01),
                                Text(
                                  orderde.products_count!.toString(),
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Palette.placeholderGrey,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: height * 0.02),
                            Row(
                              children: [
                                const Text(
                                  'Date of Delivery',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Palette.orangeColor,
                                    fontFamily: 'Red Hat Display',
                                  ),
                                ),
                                SizedBox(width: width * 0.01),
                                Text(
                                  // order.delivery_date!,
                                  CalendarTime(DateTime.parse(
                                          orderde.delivery_date!))
                                      .toHuman,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Palette.placeholderGrey,
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: height * 0.02),
                            Row(children: [
                              const Text(
                                "Time of Delivery",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: 'Red Hat Display',
                                  fontWeight: FontWeight.bold,
                                  color: Palette.orangeColor,
                                ),
                              ),
                              SizedBox(width: width * 0.01),
                              Text(
                                orderde.delivery_timeslot!,
                                // CalendarTime(DateTime.parse(order.delivery_timeslot!))
                                //     .toHuman,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Palette.placeholderGrey,
                                ),
                              )
                            ]),
                          ],
                        ),
                      ]),
                ),
              ),
            ])),
      ),
    );
  }
}
