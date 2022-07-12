import 'package:auto_route/auto_route.dart';
import 'package:delivery_app/configuration/configuration.dart';
import 'package:delivery_app/routes/router.gr.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ReadyForDelivery extends StatelessWidget {
  final int orderId;
  const ReadyForDelivery({Key? key, required this.orderId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
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
        iconTheme: const IconThemeData(color: Palette.orangeColor),
        actionsIconTheme: const IconThemeData(color: Palette.orangeColor),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                const Text(
                  'Ready for delivery',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Expanded(child: Container()),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(
                      onPressed: () {
                        AutoRouter.of(context)
                            .push(CustomerVerification(orderId: orderId));
                      },
                      icon: const Icon(
                        CupertinoIcons.check_mark,
                        size: 30,
                        color: Palette.greenColor,
                      )),
                )
              ],
            ),
            const Expanded(child: CustomerProductList()),
          ],
        ),
      ),
    );
  }
}

class CustomerProductList extends StatelessWidget {
  const CustomerProductList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 13,
      itemBuilder: (context, index) {
        return const CustomerProductListItem();
      },
      separatorBuilder: (context, index) {
        return const Divider();
      },
    );
  }
}

class CustomerProductListItem extends StatelessWidget {
  const CustomerProductListItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://st3.depositphotos.com/1003495/16332/i/600/depositphotos_163323236-stock-photo-heap-of-potatoes.jpg'),
            ),
            title: Text('Irish potatoes'),
            subtitle: Text('Quantity : 2 Tons'),
          ),
        ),
        CupertinoButton(
            onPressed: () {},
            padding: const EdgeInsets.all(8),
            child: const Icon(
              CupertinoIcons.clear_circled_solid,
              color: Colors.red,
              size: 30,
            )),
        const SizedBox(
          width: 20,
        ),
        CupertinoButton(
            onPressed: () {},
            padding: const EdgeInsets.all(8),
            child: const Icon(
              CupertinoIcons.check_mark_circled_solid,
              color: Colors.green,
              size: 30,
            )),
      ],
    );
  }
}
