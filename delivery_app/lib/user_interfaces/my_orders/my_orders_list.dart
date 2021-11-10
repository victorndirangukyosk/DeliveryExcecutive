import 'package:auto_route/auto_route.dart';
import 'package:delivery_app/configuration/configuration.dart';
import 'package:delivery_app/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyOrdersList extends StatelessWidget {
  const MyOrdersList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: List.generate(20, (index) => const SingleOrder()),
    );
  }
}

class SingleOrder extends StatelessWidget {
  const SingleOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      itemBuilder: (context) {
        return [
          PopupMenuItem<String>(
              child: const Text('View order.'),
              onTap: () {
                AutoRouter.of(context).push(const SingleOrderRoute());
              },
              value: 'view'),
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
          PopupMenuItem<String>(
            child: Row(
              children: const [
                FaIcon(
                  FontAwesomeIcons.directions,
                  color: Palette.orangeColor,
                ),
                SizedBox(
                  width: 10,
                ),
                Text("Directions to address.")
              ],
            ),
            value: 'missing_items',
            onTap: () {},
          ),
        ];
      },
      child: ListTile(
        leading: const CircleAvatar(),
        title: const Text("Order KBTYEONDKU by Sarova Stanley"),
        subtitle: const Text("Westlands CBD, 25KM away"),
        trailing: PopupMenuButton(
          child: const Icon(
            Icons.more_vert,
            color: Palette.greenColor,
          ),
          itemBuilder: (context) {
            return [
              PopupMenuItem<String>(
                  child: const Text('View order.'),
                  onTap: () {
                    AutoRouter.of(context).push(const SingleOrderRoute());
                  },
                  value: 'view'),
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
              PopupMenuItem<String>(
                child: Row(
                  children: const [
                    FaIcon(
                      FontAwesomeIcons.directions,
                      color: Palette.orangeColor,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text("Directions to address.")
                  ],
                ),
                value: 'missing_items',
                onTap: () {},
              ),
            ];
          },
        ),
      ),
    );
  }
}
