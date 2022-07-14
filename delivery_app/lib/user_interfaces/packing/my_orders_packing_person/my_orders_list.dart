import 'package:auto_route/auto_route.dart';
import 'package:delivery_app/configuration/configuration.dart';
import 'package:delivery_app/cubits/get_assigned_cubit/de/cubit/assigned_de_cubit.dart';
import 'package:delivery_app/models/assigned/de/assigned_de.dart';
import 'package:delivery_app/routes/router.gr.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyOrdersList extends StatelessWidget {
  final int orderId;
  const MyOrdersList({Key? key, required this.orderId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AssignedDeCubit, AssignedDeState>(
      listener: (context, state) {
        // TODO: implement listener
        state.maybeWhen(
            orElse: () {},
            failed: (e) {
              showDialog(
                  context: context,
                  builder: (context) {
                    return CupertinoAlertDialog(
                      title: Text('Error'),
                      content: Text(e),
                    );
                  });
            });
      },
      builder: (context, state) {
        return state.maybeWhen(
          loading: () {
            return const Center(
              child: CupertinoActivityIndicator(color: Palette.greenColor),
            );
          },
          success: (ordersde) {
            return ListView(
              physics: const BouncingScrollPhysics(),
              children: List.generate(
                  20,
                  (index) => SingleOrder(
                        index: index,
                        orderde: ordersde[index],
                        orderId: orderId,
                      )),
            );
          },
          orElse: () {
            return Container();
          },
        );
      },
    );
  }
}

class SingleOrder extends StatelessWidget {
  final int orderId;
  final AssignedDe orderde;
  final int index;
  const SingleOrder(
      {Key? key,
      required this.index,
      required this.orderde,
      required this.orderId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      itemBuilder: (context) {
        return [
          //CURRENT WORK IN PROGRESS
          PopupMenuItem<String>(
              child: const Text('View order.'),
              onTap: () {
                AutoRouter.of(context).push(SingleOrderRoute());
              },
              value: 'view'),
          PopupMenuItem<String>(
            child: const Text('Ready for delivery.'),
            value: 'ready_for_delivery',
            onTap: () {
              AutoRouter.of(context).push(ReadyForDelivery());
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
                Text('Directions to address.')
              ],
            ),
            value: 'directions',
            onTap: () {
              // AutoRouter.of(context).push(const DirectionsToAddress());
            },
          ),
        ];
      },
      child: ListTile(
        tileColor: index % 2 == -0 ? Colors.white : const Color(0xffF5F5F5),
        leading: const CircleAvatar(
          backgroundColor: Palette.orangeColor,
          radius: 25,
          child: Icon(
            Icons.person,
            size: 40,
            color: Colors.white,
          ),
        ),
        title: const Text('Order KBTYEONDKU by Sarova Stanley',
            style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: const Text('Westlands CBD, 25KM away'),
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
                    AutoRouter.of(context).push(SingleOrderRoute());
                  },
                  value: 'view'),
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
                    Text('Directions to address.')
                  ],
                ),
                value: 'directions',
                onTap: () {
                  AutoRouter.of(context)
                      .push(DirectionsToAddress(orderId: orderde.order_id!));
                },
              ),
            ];
          },
        ),
      ),
    );
  }
}
