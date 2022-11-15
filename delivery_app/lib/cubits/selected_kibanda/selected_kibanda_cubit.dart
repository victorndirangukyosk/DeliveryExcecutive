import 'package:delivery_app/models/kibanda_model/kibanda.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SelectedKibandaCubit extends Cubit<Kibanda?> {
  SelectedKibandaCubit() : super(null);
  save(Kibanda? kibanda) {
    emit(kibanda);
  }
}