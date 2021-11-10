import 'package:auto_route/auto_route.dart';
import 'package:delivery_app/configuration/configuration.dart';
import 'package:delivery_app/routes/router.gr.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
                    AutoRouter.of(context).push(const ReadyForDelivery());
                  },
                ),
                PopupMenuItem<String>(
                  child: const Text('Show missing items.'),
                  value: 'missing_items',
                  onTap: () {},
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
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
            const Text(
              "Product notes",
              style: TextStyle(fontSize: 16),
            ),
            const NotesWidget(),
            const Text(
              "Order list",
              style: TextStyle(fontSize: 16),
            ),
            const Expanded(child: ProductList())
          ],
        ),
      ),
    );
  }
}

class NotesWidget extends StatelessWidget {
  const NotesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SingleNote(
        notes:
            "Lorem ipsum dolor sit amet, consectetur adi. Interdum et malesuada fames ac ante ipsum primis in faucibus. Mauris vel mattis massa, vitae tempor leo.");
  }
}

class SingleNote extends StatelessWidget {
  final String notes;
  const SingleNote({Key? key, required this.notes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          notes,
        ),
      ),
    );
  }
}
