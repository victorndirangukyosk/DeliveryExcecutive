import 'package:auto_route/auto_route.dart';
import 'package:delivery_app/configuration/configuration.dart';
import 'package:delivery_app/cubits/crates_qr_cubit/crates_qr_cubit.dart';
import 'package:delivery_app/routes/router.gr.dart';
// import 'package:delivery_app/cubits/qr_scanner_cubit/qr_scanner_cubit.dart';
import 'package:delivery_app/user_interfaces/packing/items_processing/order_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class Scanner extends StatelessWidget {
  final TextEditingController textarea = TextEditingController();

  Scanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void _onQRViewCreated(QRViewController controller) {
      controller.scannedDataStream.listen((scanData) async {
        context.read<CratesQRCubit>().addQR(scanData);
      });
    }

    return Scaffold(
        appBar: AppBar(
          title: const Text('Scanner'),
          actions: [
            IconButton(
                onPressed: () {
                  AutoRouter.of(context).push(CratesRoute());
                },
                icon: const Icon(Icons.check))
          ],
        ),
        resizeToAvoidBottomInset: false,
        body: SafeArea(
            child: Center(
          child: Stack(
            children: [
              Column(
                children: <Widget>[
                  Expanded(
                    flex: 5,
                    child: Stack(
                      children: [
                        QRView(
                          key: GlobalKey(debugLabel: 'QR'),
                          onQRViewCreated: _onQRViewCreated,
                        ),
                        Center(
                          child: Container(
                            width: 300,
                            height: 300,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Palette.orangeColor,
                                width: 4,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  // ...List.generate(context.read<QRScannerCubit>().state.length,
                  //     (index) {
                  //   Barcode barcode =
                  //       context.read<QRScannerCubit>().state[index];
                  //   return ListTile(
                  //     title: Text(barcode.code!),
                  //     trailing: IconButton(
                  //         onPressed: () {
                  //           context.read<QRScannerCubit>().removeQR(barcode);
                  //         },
                  //         icon: const Icon(Icons.remove)),
                  //   );
                  // }),
                  const SizedBox(
                    height: 30,
                  ),
                  CupertinoButton(
                      child: const Text('Continue'),
                      padding: const EdgeInsets.symmetric(
                          vertical: 4, horizontal: 8),
                      color: Palette.orangeColor,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const OrderList()),
                        );
                      }),
                ],
              ),
            ],
          ),
        )));
  }
}
