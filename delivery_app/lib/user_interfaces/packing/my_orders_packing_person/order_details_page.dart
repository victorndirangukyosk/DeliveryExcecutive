import 'package:delivery_app/configuration/configuration.dart';
import 'package:delivery_app/cubits/order_details_cubit/order_details_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderDetailsPage extends StatelessWidget {
  const OrderDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<OrderDetailsCubit, OrderDetailsState>(
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
              loading: () => const Center(
                    child: CircularProgressIndicator(
                      color: Palette.greenColor,
                    ),
                  ),
              success: (orderDetail) {
                return Container(
                  child: Text(orderDetail.order_id.toString()),
                );
              },
              orElse: () {
                return Container();
              });
        },
      ),
    );
  }
}
