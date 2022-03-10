import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_beep/flutter_beep.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class CratesQRCubit extends Cubit<List<Barcode>> {
  CratesQRCubit(List<Barcode> initialState) : super([]);

  addQR(Barcode scanData) {
    var x = state.where((element) => element.code == scanData.code);
    if (x.isEmpty) {
      emit([...state, scanData]);
      FlutterBeep.beep();
    } else {
      // FlutterBeep.playSysSound(AndroidSoundIDs.TONE_SUP_ERROR);
    }
  }

  removeQR(Barcode scanData) {
    state.removeWhere((element) => element.code == scanData.code);
    emit(state);
  }
}
