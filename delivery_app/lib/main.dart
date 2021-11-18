import 'package:delivery_app/utilities/utilities.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'app/app.dart';

///This is the starting point for the application
main() async {
  //Set the license font the poppins google font
  LicenseRegistry.addLicense(() async* {
    final license = await rootBundle.loadString('google_fonts/OFL.txt');
    yield LicenseEntryWithLineBreaks(['google_fonts'], license);
  });
  // await [
  //   Permission.camera,
  //   Permission.storage,
  // ].request();

  ///Allow getit reassignments for smoother debuging
  GetIt.I.allowReassignment = true;

  ///Register the rest client to be accessible throughout the app {DI}
  GetIt.I.registerSingleton<RestClient>(RestClient());

  runApp(KwikBasketDeliveryApp());
}
