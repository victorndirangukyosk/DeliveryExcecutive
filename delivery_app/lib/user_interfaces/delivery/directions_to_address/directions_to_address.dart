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
                          child: Text("Sarova Stanley",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18)),
                        ),
                      ),
                    ),
                  ),
                  CupertinoButton(
                      child: const Icon(Icons.dehaze),
                      padding: const EdgeInsets.all(0),
                      color: Palette.orangeColor,
                      onPressed: () async {
                        controller.currentLocation();
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
                        FaIcon(
                          FontAwesomeIcons.directions,
                          color: Palette.orangeColor,
                        ),
                        Text("5 KM From your location"),
                        FaIcon(
                          FontAwesomeIcons.clock,
                          color: Palette.orangeColor,
                        ),
                        Text("Estimated 5 minutes remaining"),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CupertinoButton(
                        child: const Text("Ready for delivery"),
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
