import 'package:auto_route/auto_route.dart';
import 'package:calendar_time/calendar_time.dart';
import 'package:delivery_app/configuration/configuration.dart';
import 'package:delivery_app/cubits/select_date_cubit/select_date_cubit.dart';
import 'package:delivery_app/routes/router.gr.dart';
import 'package:delivery_app/user_interfaces/my_orders/my_orders_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainHomePage extends StatelessWidget {
  const MainHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        body: Stack(
          children: [
            const Positioned(
                top: 30,
                child: Text.rich(TextSpan(
                    text: "Kwik ",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w900,
                        color: Palette.orangeColor),
                    children: [
                      TextSpan(
                          text: "Delivery",
                          style: TextStyle(color: Palette.greenColor))
                    ])),
                left: 20),
            Positioned(
                top: 20,
                right: 20,
                child: GestureDetector(
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
                                                    "https://th.bing.com/th/id/R.a5758d6fb64904904ec75fd1f083e3fb?rik=QVwaYy2Fd7Xi%2fA&pid=ImgRaw&r=0"),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          const Text("Samuel Baraka"),
                                          const Text(
                                              "sababuvercetti@gmail.com"),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          ListTile(
                                            onTap: () {},
                                            leading: const Icon(Icons.history),
                                            title: const Text("Order history"),
                                            trailing: const Icon(
                                                CupertinoIcons.forward),
                                            subtitle: const Text(
                                                "View order history"),
                                          ),
                                          ListTile(
                                            onTap: () {},
                                            leading: const Icon(
                                                CupertinoIcons.settings),
                                            title: const Text("Settings"),
                                            trailing: const Icon(
                                                CupertinoIcons.forward),
                                            subtitle: const Text(
                                                "Application settings"),
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
                                              "About this application",
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
                )),
            Positioned(
                left: 20,
                top: 80,
                right: 20,
                bottom: 100,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CupertinoButton(
                      onPressed: () {},
                      padding: const EdgeInsets.all(0),
                      child: Container(
                        padding: const EdgeInsets.only(left: 20, right: 8),
                        decoration: BoxDecoration(
                            color: Palette.greenColor,
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          children: [
                            const Text(
                              "My Deliveries",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
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
                    Row(
                      children: [
                        const Text(
                          "My Orders",
                          style: TextStyle(
                              fontSize: 16,
                              color: Palette.greenColor,
                              fontWeight: FontWeight.bold),
                        ),
                        const Expanded(child: SizedBox()),
                        TextButton(
                            onPressed: () async {
                              var x = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(1970),
                                  lastDate: DateTime.now());
                              if (CalendarTime(x).isToday) {
                                context
                                    .read<SelectDateCubit>()
                                    .emit(DateTime.now());
                              } else {
                                context.read<SelectDateCubit>().emit(x!);
                              }
                            },
                            child: Text(CalendarTime(
                                    context.watch<SelectDateCubit>().state)
                                .toHuman
                                .replaceFirst("at 12:00 AM", "")))
                      ],
                    ),
                    const Expanded(child: MyOrdersList())
                  ],
                )),
            Positioned(
                bottom: 40,
                left: 0,
                right: 0,
                child: CupertinoButton(
                  onPressed: () {
                    AutoRouter.of(context).push(const DirectionsToAddress());
                  },
                  child: Card(
                    elevation: 20,
                    shape: const CircleBorder(),
                    child: CircleAvatar(
                        radius: 60,
                        backgroundColor: Palette.greenColor,
                        child: Center(
                            child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SvgPicture.asset(
                              'assets/gis_route.svg',
                              height: 50,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              "Start trip",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ))),
                  ),
                ))
          ],
        ));
  }
}
