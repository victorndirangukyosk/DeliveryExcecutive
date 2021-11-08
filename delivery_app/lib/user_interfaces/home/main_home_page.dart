import 'package:delivery_app/configuration/configuration.dart';
import 'package:delivery_app/cubits/user_interface/home_bottom_navigation_index_cubit.dart';
import 'package:delivery_app/cubits/user_interface/start_trip_tick_cubit.dart';
import 'package:delivery_app/user_interfaces/home/home_tab/home_tab.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'history_tab/history_tab.dart';

class MainHomePage extends StatelessWidget {
  const MainHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = const [HomeTab(), HistoryTab()];

    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        body: Stack(
          children: [
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
                                          CircleAvatar(
                                            radius: 58,
                                            backgroundColor:
                                                Palette.orangeColor,
                                            child: const CircleAvatar(
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
                                            leading: Icon(
                                              CupertinoIcons.info,
                                              color: Palette.greenColor,
                                            ),
                                            title: Text(
                                              "About",
                                              style: TextStyle(
                                                  color: Palette.greenColor),
                                            ),
                                            trailing: Icon(
                                              CupertinoIcons.forward,
                                              color: Palette.greenColor,
                                            ),
                                            subtitle: const Text(
                                              "About this application",
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  )));
                        },
                        child: Center(
                            child: Icon(
                          Icons.dehaze,
                          size: 40,
                          color: Palette.greenColor,
                        ))),
                  ),
                )),
            Positioned(
                left: 20,
                top: 80,
                right: 20,
                child: Column(
                  children: [
                    Text(
                      "My Orders",
                      style: TextStyle(
                          fontSize: 30,
                          color: Palette.orangeColor,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                )),
            Positioned(
                bottom: 40,
                left: 0,
                right: 0,
                child: CupertinoButton(
                  onPressed: () {},
                  child: CircleAvatar(
                    // radius: context.watch<StartTripTickCubit>().state ? 50 : 70,
                    radius: 50,
                    backgroundColor: Palette.greenColor,
                    child: Stack(
                      children: const [
                        SpinKitRipple(
                          color: Colors.white,
                          size: 200,
                        ),
                        Center(
                            child: Text(
                          "Start trip",
                          style: TextStyle(color: Colors.white),
                        ))
                      ],
                    ),
                  ),
                ))
          ],
        ));
  }
}
