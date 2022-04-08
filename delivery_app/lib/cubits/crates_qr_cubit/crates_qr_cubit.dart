import 'package:delivery_app/models/crate/crate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_beep/flutter_beep.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class CratesQRCubit extends Cubit<List<Crate>> {
  CratesQRCubit(List<Barcode> initialState) : super([]);

  addQR(Crate crate) {
    var x = state
        .where((element) => element.serial_number == crate.serial_number)
        .toList();
    if (x.isEmpty) {
      emit([...state, crate]);
      FlutterBeep.beep();
    } else {
      // FlutterBeep.playSysSound(AndroidSoundIDs.TONE_SUP_ERROR);
    }
  }

  removeQR(Crate crate) {
    state
        .removeWhere((element) => element.serial_number == crate.serial_number);
    emit(state);
  }
}
