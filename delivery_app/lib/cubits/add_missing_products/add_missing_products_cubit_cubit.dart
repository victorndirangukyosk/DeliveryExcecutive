import 'package:bloc/bloc.dart';
import 'package:delivery_app/models/missing/missing.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:delivery_app/services/api_service/api_service.dart';
part 'add_missing_products_cubit_state.dart';
part 'add_missing_products_cubit_cubit.freezed.dart';

class AddMissingProductsCubitCubit extends Cubit<AddMissingProductsCubitState> {
  AddMissingProductsCubitCubit()
      : super(AddMissingProductsCubitState.initial());

  addMissing({required List<Missing> products, required int orderId}) async {
    emit(const AddMissingProductsCubitState.loading());
    try {
      await ApiService.post(data: {
        'order_id': orderId,
        'products':
            List.generate(products.length, (index) => products[index].toJson())
      }, path: 'op/missingProducts');
      emit(const AddMissingProductsCubitState.success());
    } catch (e) {
      emit(AddMissingProductsCubitState.failed(e.toString()));
    }
  }
}
