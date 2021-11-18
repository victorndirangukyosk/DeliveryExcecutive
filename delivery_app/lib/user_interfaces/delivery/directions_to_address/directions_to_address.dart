import 'package:auto_route/auto_route.dart';
import 'package:delivery_app/configuration/configuration.dart';
import 'package:delivery_app/routes/router.gr.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DirectionsToAddress extends StatelessWidget {
  const DirectionsToAddress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = MapController(
      initMapWithUserPosition: false,
      initPosition: GeoPoint(latitude: -1.286389, longitude: 36.817223),
    );
    return Scaffold(
      body: Stack(
        children: [
          OSMFlutter(
            controller: controller,
            trackMyPosition: true,
            initZoom: 12,
            minZoomLevel: 8,
            maxZoomLevel: 14,
            stepZoom: 1.0,
            userLocationMarker: UserLocationMaker(
              personMarker: MarkerIcon(
                icon: const Icon(
                  Icons.location_history_rounded,
                  color: Colors.red,
                  size: 48,
                ),
              ),
              directionArrowMarker: MarkerIcon(
                icon: const Icon(
                  Icons.double_arrow,
                  size: 48,
                ),
              ),
            ),
            road: Road(
              startIcon: MarkerIcon(
                icon: const Icon(
                  Icons.person,
                  size: 64,
                  color: Colors.brown,
                ),
              ),
              endIcon: MarkerIcon(
                icon: const Icon(
                  Icons.person,
                  size: 64,
                  color: Colors.brown,
                ),
              ),
              roadColor: Colors.yellowAccent,
            ),
            markerOption: MarkerOption(
                defaultMarker: MarkerIcon(
              icon: const Icon(
                Icons.person_pin_circle,
                color: Colors.blue,
                size: 56,
              ),
            )),
          ),
          Positioned(
              right: 20,
              top: 60,
              left: 20,
              child: Row(
                children: [
                  const Expanded(
                    child: Card(
                      color: Colors.black54,
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Center(
                          child: Text('Sarova Stanley',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18)),
                        ),
                      ),
                    ),
                  ),
                  CupertinoButton(
                      child: const Icon(Icons.dehaze),
                      padding: const EdgeInsets.all(18),
                      color: Palette.orangeColor,
                      onPressed: () async {
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
                                          backgroundColor: Palette.orangeColor,
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
                                        const Text('Samuel Baraka'),
                                        const Text('sababuvercetti@gmail.com'),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        ListTile(
                                          onTap: () {},
                                          leading: const Icon(Icons.history),
                                          title: const Text('Order history'),
                                          trailing: const Icon(
                                              CupertinoIcons.forward),
                                          subtitle:
                                              const Text('View order history'),
                                        ),
                                        ListTile(
                                          onTap: () {},
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
                                            'About',
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
                      }),
                ],
              )),
          Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Card(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: const [
                        SizedBox(width: 10),
                        FaIcon(
                          FontAwesomeIcons.directions,
                          color: Palette.orangeColor,
                        ),
                        SizedBox(width: 10),
                        Text('Distance : 5KM', style: TextStyle(fontSize: 16)),
                        Expanded(child: SizedBox(width: 10)),
                        FaIcon(
                          FontAwesomeIcons.clock,
                          color: Palette.orangeColor,
                        ),
                        SizedBox(width: 10),
                        Text('Expected Delivery Time: 5 Minutes',
                            style: TextStyle(fontSize: 16)),
                        SizedBox(width: 10),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CupertinoButton(
                        child: const Text('Ready for delivery'),
                        color: Palette.greenColor,
                        onPressed: () {
                          AutoRouter.of(context).push(const ReadyForDelivery());
                        }),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
