import 'package:bloc/bloc.dart';
import 'package:delivery_app/models/order_details/de/general_details.dart';
import 'package:delivery_app/utilities/rest_client/rest_client.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'de_order_details_state.dart';
part 'de_order_details_cubit.freezed.dart';

class DeOrderDetailsCubit extends Cubit<DeOrderDetailsState> {
  DeOrderDetailsCubit() : super(DeOrderDetailsState.initial());

  getGeneralOrderDetails({required int orderId}) async {
    emit(DeOrderDetailsState.loading());
    try {
      var response = await RestClient().dio!.get(
          'https://stage.apiadmin.kwikbasket.com/api/deliveryexecutive/getorder/${orderId}');
      GeneralDetails generalDetails =
          GeneralDetails.fromJson(response.data['data']);
      emit(DeOrderDetailsState.success(generalDetails));
    } catch (e) {
      emit(DeOrderDetailsState.failed(e.toString()));
    }
  }
}
