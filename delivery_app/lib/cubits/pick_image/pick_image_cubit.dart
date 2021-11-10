import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';

class PickImageCubit extends Cubit<File> {
  PickImageCubit(File initialState) : super(initialState);
}
