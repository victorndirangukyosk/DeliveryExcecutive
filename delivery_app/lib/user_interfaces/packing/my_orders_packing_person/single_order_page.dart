import 'package:auto_route/auto_route.dart';
import 'package:delivery_app/configuration/configuration.dart';
import 'package:delivery_app/routes/router.gr.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'product_list.dart';

class SingleOrderPage extends StatelessWidget {
 
  const SingleOrderPage({Key? key, }) : super(key: key);

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
              Icons.dehaze,
              color: Palette.orangeColor,
              size: 40,
            ),
            itemBuilder: (context) {
              return [
                PopupMenuItem<String>(
                  child: const Text('Ready for delivery.'),
                  value: 'ready_for_delivery',
                  onTap: () {
                    AutoRouter.of(context)
                        .push(ReadyForDelivery());
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
          const SizedBox(
            width: 20,
          )
        ],
        title: const Text.rich(TextSpan(
            text: 'Kwik ',
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w900,
                color: Palette.orangeColor),
            children: [
              TextSpan(
                  text: 'Delivery', style: TextStyle(color: Palette.greenColor))
            ])),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Order details',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 70,
                    decoration: BoxDecoration(
                        color: Palette.greyColor,
                        border: Border.all(width: 1, color: Colors.grey),
                        borderRadius: BorderRadius.circular(5)),
                    child: const ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Palette.orangeColor,
                        child: FaIcon(
                          Icons.person,
                          color: Colors.white,
                        ),
                      ),
                      title: Text('Sarova Stanley'),
                      subtitle: Text('2 Days ago'),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Container(
                    height: 70,
                    decoration: BoxDecoration(
                        color: Palette.greyColor,
                        border: Border.all(width: 1, color: Colors.grey),
                        borderRadius: BorderRadius.circular(5)),
                    child: const ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Palette.orangeColor,
                        child: FaIcon(
                          FontAwesomeIcons.shoppingBasket,
                          color: Colors.white,
                        ),
                      ),
                      title: Text('Order number KBTYEONDKU'),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            ListTile(
              tileColor: Palette.greyColor,
              shape: RoundedRectangleBorder(
                  side: const BorderSide(width: 1, color: Colors.grey),
                  borderRadius: BorderRadius.circular(5)),
              leading: const CircleAvatar(
                backgroundColor: Palette.orangeColor,
                child: FaIcon(
                  Icons.location_pin,
                  color: Colors.white,
                ),
              ),
              title: const Text('Westlands, CBD'),
              subtitle: const Text('2 KM from your location'),
              trailing: IconButton(
                  onPressed: () {
                    // AutoRouter.of(context).push(const DirectionsToAddress());
                  },
                  tooltip: 'View directions.',
                  icon: const FaIcon(
                    FontAwesomeIcons.directions,
                    size: 30,
                    color: Palette.orangeColor,
                  )),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Product notes',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const NotesWidget(),
            const Text(
              'Order list',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
            'Lorem ipsum dolor sit amet, consectetur adi. Interdum et malesuada fames ac ante ipsum primis in faucibus. Mauris vel mattis massa, vitae tempor leo.');
  }
}

class SingleNote extends StatelessWidget {
  final String notes;
  const SingleNote({Key? key, required this.notes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: const BoxDecoration(
            color: Palette.greenColor,
            borderRadius: BorderRadius.all((Radius.circular(20)))),
        child: Text(notes, style: const TextStyle(color: Colors.white)),
      ),
    );
  }
}
