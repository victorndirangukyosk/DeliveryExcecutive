import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';

class DirectionsToAddress extends StatelessWidget {
  const DirectionsToAddress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          OSMFlutter(
            controller: MapController(
              initMapWithUserPosition: false,
              initPosition:
                  GeoPoint(latitude: 47.4358055, longitude: 8.4737324),
              areaLimit: BoundingBox(
                east: 10.4922941,
                north: 47.8084648,
                south: 45.817995,
                west: 5.9559113,
              ),
            ),
            trackMyPosition: false,
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
          )
        ],
      ),
    );
  }
}
