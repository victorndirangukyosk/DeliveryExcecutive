import 'package:delivery_app/configuration/configuration.dart';
import 'package:delivery_app/user_interfaces/packing/items_processing/order_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:url_launcher/url_launcher.dart';

class Scanner extends StatefulWidget {
  const Scanner({Key? key}) : super(key: key);

  @override
  _ScannerState createState() => _ScannerState();
}

class _ScannerState extends State<Scanner> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  late QRViewController controller;
  TextEditingController textarea = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   title: Text("Scanner"),
        // ),
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
                          key: qrKey,
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
                  const Expanded(
                    flex: 1,
                    child: Center(
                      child: TextField(
                        // ignore: todo
                        //TODO:CORRECT THIS CONTROLLER ERROR
                        // controller: textarea,
                        keyboardType: TextInputType.multiline,
                        maxLines: 5,
                        decoration: InputDecoration(
                            hintText: 'Selected Crates',
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                              width: 5,
                              color: Palette.orangeColor,
                            ))),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: const [
                      // Expanded(
                      //   flex: 1,
                      //   child: TextField(
                      //     // ignore: todo
                      //     //TODO:CORRECT THIS CONTROLLER ERROR
                      //     // controller: textarea,
                      //     keyboardType: TextInputType.multiline,
                      //     maxLines: 5,
                      //     decoration: InputDecoration(
                      //         hintText: 'Notes',
                      //         focusedBorder: OutlineInputBorder(
                      //             borderSide: BorderSide(
                      //           width: 5,
                      //           color: Palette.orangeColor,
                      //         ))),
                      //   ),
                      // ),
                      Expanded(
                          flex: 2, child: Icon(FontAwesomeIcons.plusCircle)),
                      Expanded(
                          flex: 2, child: Icon(FontAwesomeIcons.minusCircle)),
                    ],
                  ),
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

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) async {
      controller.pauseCamera();
      if (await canLaunch(scanData.code!)) {
        await launch(scanData.code!);
        controller.resumeCamera();
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Could not find viable url'),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    Text('Barcode Type: ${describeEnum(scanData.format)}'),
                    Text('Data: ${scanData.code}'),
                  ],
                ),
              ),
              actions: <Widget>[
                TextButton(
                  child: Text('Ok'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        ).then((value) => controller.resumeCamera());
      }
    });
  }
}
