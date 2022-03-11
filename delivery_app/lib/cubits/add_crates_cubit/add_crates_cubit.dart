import 'package:bloc/bloc.dart';
import 'package:delivery_app/services/api_service/api_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../models/crate/crate.dart';

part 'add_crates_state.dart';
part 'add_crates_cubit.freezed.dart';

class AddCratesCubit extends Cubit<AddCratesState> {
  AddCratesCubit() : super(AddCratesState.initial());

  addCrates({required List<Crate> crates, required int orderId}) async {
    emit(const AddCratesState.loading());
    try {
      await ApiService.post(data: {
        'order_id': orderId,
        'crates':
            List.generate(crates.length, (index) => crates[index].toJson())
      }, path: 'op/crateMapping');
      emit(const AddCratesState.success());
    } catch (e) {
      emit(AddCratesState.failed(e.toString()));
    }
  }
}
