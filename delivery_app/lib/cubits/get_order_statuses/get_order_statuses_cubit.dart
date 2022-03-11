import 'package:bloc/bloc.dart';

import 'package:delivery_app/models/get_orders_state/get_orders_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:delivery_app/utilities/utilities.dart';

part 'get_order_statuses_state.dart';
part 'get_order_statuses_cubit.freezed.dart';

class GetOrderStatusesCubit extends Cubit<GetOrderStatusesState> {
  GetOrderStatusesCubit() : super(GetOrderStatusesState.initial());
  getOrdersState() async {
    emit(const GetOrderStatusesState.loading());
    try {
      var response = await RestClient().dio!.get(
            'https://stage.apiadmin.kwikbasket.com/api/getorderStatuses',
          );
      List ordersinJson = response.data['data'];
      List<GetOrdersState> status = List.generate(ordersinJson.length,
          ((index) => GetOrdersState.fromJson(ordersinJson[index])));

      emit(GetOrderStatusesState.success(status));
    } catch (e) {
      emit(GetOrderStatusesState.failed(e.toString()));
    }
  }
}
