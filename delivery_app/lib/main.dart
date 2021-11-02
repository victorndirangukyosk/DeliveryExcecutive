import 'package:flutter/material.dart';
import 'package:mpesa_flutter_plugin/mpesa_flutter_plugin.dart';

import 'app/app.dart';

main() async {
  MpesaFlutterPlugin.setConsumerKey('YpR2aAdj3lKJwwTAd5RPH7JEY33WKM2B');
  MpesaFlutterPlugin.setConsumerSecret('JawcOXVX88A7XUxj');
  runApp(KwikBasketDeliveryApp());
}
