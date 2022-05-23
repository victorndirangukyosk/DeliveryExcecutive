import 'package:bloc/bloc.dart';
import 'package:delivery_app/models/filter_flag/filter_flag.dart';
import 'package:delivery_app/services/api_service/api_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'filter_flag_state.dart';
part 'filter_flag_cubit.freezed.dart';

class FilterFlagCubit extends Cubit<FilterFlagState> {
  FilterFlagCubit() : super(FilterFlagState.initial());

  filterFlag({
    required List<FilterFlag> accept,
    required int orderId,
  }) async {
    emit(const FilterFlagState.loading());
    try {
      await ApiService.getData( path: 'deliveryexecutive/accept_rejectProducts/order_id/$orderId');
      emit(const FilterFlagState.success());
    } catch (e) {
      emit(FilterFlagState.failed(e.toString()));
    }
  }
}
