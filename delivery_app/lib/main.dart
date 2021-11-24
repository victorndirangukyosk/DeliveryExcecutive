import 'dart:io';

import 'package:delivery_app/utilities/utilities.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'app/app.dart';

///This is the starting point for the application
main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //Set the license font the poppins google font
  LicenseRegistry.addLicense(() async* {
    final license = await rootBundle.loadString('google_fonts/OFL.txt');
    yield LicenseEntryWithLineBreaks(['google_fonts'], license);
  });
  // await [
  //   // Permission.camera,
  //   Permission.storage,
  // ].request();

  ///Allow getit reassignments for smoother debuging
  GetIt.I.allowReassignment = true;

  ///Register the rest client to be accessible throughout the app {DI}
  GetIt.I.registerSingleton<RestClient>(RestClient());

  ///Get directory to store all state persists (Securely 😊😊)
  Directory storageDirectory = await getTemporaryDirectory();

  /// Initialize hydrated storage for all state persists storage
  final storage =
      await HydratedStorage.build(storageDirectory: storageDirectory);

  /// Run the app Zoned in [HydratedBloc] overrides
  HydratedBlocOverrides.runZoned(() => runApp(KwikBasketDeliveryApp()),
      storage: storage);
}
