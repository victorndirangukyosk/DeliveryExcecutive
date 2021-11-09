import 'package:auto_route/auto_route.dart';
import 'package:delivery_app/configuration/configuration.dart';
import 'package:delivery_app/routes/router.gr.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ReadyForDelivery extends StatelessWidget {
  const ReadyForDelivery({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Ready for delivery",
          style: TextStyle(color: Palette.greenColor),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
                onPressed: () {
                  AutoRouter.of(context).push(CustomerVerification());
                },
                icon: const Icon(
                  CupertinoIcons.check_mark,
                  size: 30,
                  color: Palette.greenColor,
                )),
          )
        ],
        iconTheme: const IconThemeData(color: Palette.orangeColor),
        actionsIconTheme: const IconThemeData(color: Palette.orangeColor),
      ),
      body: const Padding(
        padding: EdgeInsets.all(8.0),
        child: CustomerProductList(),
      ),
    );
  }
}

class CustomerProductList extends StatelessWidget {
  const CustomerProductList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: List.generate(13, (index) => CustomerProductListItem()),
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
                  "https://st3.depositphotos.com/1003495/16332/i/600/depositphotos_163323236-stock-photo-heap-of-potatoes.jpg"),
            ),
            title: Text("Irish potatoes"),
            subtitle: Text("Quantity : 2 Tons"),
          ),
        ),
        CupertinoButton(
            onPressed: () {},
            padding: const EdgeInsets.all(8),
            color: Colors.red,
            child: const Icon(
              CupertinoIcons.clear_circled,
              size: 30,
            )),
        const SizedBox(
          width: 20,
        ),
        CupertinoButton(
            onPressed: () {},
            padding: const EdgeInsets.all(8),
            color: Colors.green,
            child: const Icon(
              CupertinoIcons.check_mark_circled,
              size: 30,
            )),
      ],
    );
  }
}
