import 'package:delivery_app/configuration/configuration.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'product_list.dart';

class SingleOrderPage extends StatelessWidget {
  const SingleOrderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Palette.orangeColor),
        actionsIconTheme: const IconThemeData(color: Palette.orangeColor),
        actions: [
          PopupMenuButton(
            child: const Icon(
              Icons.more_vert,
              color: Palette.greenColor,
            ),
            itemBuilder: (context) {
              return [
                PopupMenuItem<String>(
                  child: const Text('Ready for delivery.'),
                  value: 'ready_for_delivery',
                  onTap: () {
                    print("ready");
                  },
                ),
                PopupMenuItem<String>(
                  child: const Text('Show missing items.'),
                  value: 'missing_items',
                  onTap: () {
                    print("Show missing items");
                  },
                ),
              ];
            },
          ),
        ],
        title: const Text(
          "Order details",
          style: TextStyle(color: Palette.greenColor),
        ),
      ),
      body: Column(
        children: [
          const ListTile(
            leading: FaIcon(
              FontAwesomeIcons.building,
              color: Palette.greenColor,
            ),
            title: Text("Sarova Stanley"),
          ),
          const ListTile(
            title: Text("Order number KBTYEONDKU"),
            subtitle: Text("2 Days ago"),
          ),
          ListTile(
            leading: const Icon(
              CupertinoIcons.location,
              color: Colors.green,
            ),
            title: const Text("Westlands, CBD"),
            subtitle: const Text("2 KM from your location"),
            trailing: IconButton(
                onPressed: () {},
                tooltip: 'View directions.',
                icon: const FaIcon(
                  FontAwesomeIcons.directions,
                  color: Palette.orangeColor,
                )),
          ),
          const Text("Order list"),
          Expanded(child: ProductList())
        ],
      ),
    );
  }
}
