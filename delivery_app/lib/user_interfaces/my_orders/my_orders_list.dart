import 'package:delivery_app/configuration/configuration.dart';
import 'package:flutter/material.dart';

class MyOrdersList extends StatelessWidget {
  const MyOrdersList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: List.generate(20, (index) => SingleOrder()),
    );
  }
}

class SingleOrder extends StatelessWidget {
  const SingleOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      // onTap: () {},
      leading: const CircleAvatar(),
      title: const Text("Order KBTYEONDKU by Sarova Stanley"),
      subtitle: const Text("Westlands CBD, 25KM away"),
      trailing: PopupMenuButton(
        child: Icon(
          Icons.more_vert,
          color: Palette.greenColor,
        ),
        itemBuilder: (context) {
          return [
            PopupMenuItem<String>(
                child: const Text('View order.'),
                onTap: () {
                  print("View");
                },
                value: 'view'),
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
    );
  }
}
