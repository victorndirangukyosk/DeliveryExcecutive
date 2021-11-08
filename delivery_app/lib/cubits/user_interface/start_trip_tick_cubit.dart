import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

class StartTripTickCubit extends Cubit<bool> {
  StartTripTickCubit(bool initialState) : super(initialState);
  tick() async {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      emit(!state);
    });
  }
}
