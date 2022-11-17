import 'package:delivery_app/cubits/add_crates_cubit/add_crates_cubit.dart';
import 'package:delivery_app/cubits/crates_qr_cubit/crates_qr_cubit.dart';
import 'package:delivery_app/models/crate/crate.dart';
import 'package:delivery_app/models/order_details/order.dart';
import 'package:delivery_app/models/order_details/order_details.dart';
import 'package:delivery_app/user_interfaces/packing/items_processing/processed_order_list.dart';
import 'package:delivery_app/utilities/toast/toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class CratesPage extends StatefulWidget {
  final int orderId;
  const CratesPage({Key? key, required this.orderId}) : super(key: key);

  @override
  State<CratesPage> createState() => _CratesPageState();
}

class _CratesPageState extends State<CratesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
              '${context.watch<CratesQRCubit>().state.length} Scanned crates'),
        ),
        actions: const [
          InkWell(
            child: Tooltip(
              message: "Go back to add more crates",
              child: Icon(
                Icons.info_outline_rounded,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: AnimationLimiter(
        child: ListView.builder(
          itemBuilder: (context, index) {
            var crate = context.watch<CratesQRCubit>().state[index];
            return AnimationConfiguration.staggeredList(
              position: index,
              duration: const Duration(milliseconds: 375),
              child: SlideAnimation(
                verticalOffset: 50.0,
                child: FadeInAnimation(
                  child: ListTile(
                    title: Text(crate.color! + ' Crate'),
                    subtitle: Text(crate.serial_number!),
                    trailing: IconButton(
                        onPressed: () {
                          context.read<CratesQRCubit>().removeQR(
                              context.watch<CratesQRCubit>().state[index]);
                          setState(() {});
                        },
                        icon: const Icon(Icons.close)),
                  ),
                ),
              ),
            );
          },
          itemCount: context.watch<CratesQRCubit>().state.length,
        ),
      ),
      bottomNavigationBar: BlocConsumer<AddCratesCubit, AddCratesState>(
        listener: (context, state) {
          state.maybeWhen(
              orElse: () {},
              success: () {
                AppToast.showToast(message: 'Success', isError: false);
                // context.read<CratesQrCubit>().emit([]);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            OrderList(orderId: widget.orderId)));
              });
        },
        builder: (context, state) {
          return state.maybeWhen(
              loading: () => CircularProgressIndicator(),
              orElse: () {
                return CupertinoButton(
                    child: const Text('Submit'),
                    onPressed: () {
                      //TODO:REMOVE NAVIGATOR
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  OrderList(orderId: widget.orderId)));
                      context.read<AddCratesCubit>().addCrates(
                          crates: List.generate(
                            context.read<CratesQRCubit>().state.length,
                            (index) =>
                                context.read<CratesQRCubit>().state[index],
                          ),
                          orderId: widget.orderId);
                    });
              });
        },
      ),
    );
  }
}
