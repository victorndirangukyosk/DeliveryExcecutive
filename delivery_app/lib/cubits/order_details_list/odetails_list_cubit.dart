import 'package:bloc/bloc.dart';
import 'package:delivery_app/models/odetails_list/odetails_list.dart';
import 'package:delivery_app/models/order_status.dart';
import 'package:delivery_app/models/processed_products/processed_products.dart';
import 'package:delivery_app/services/services.dart';
import 'package:delivery_app/utilities/utilities.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'odetails_list_state.dart';
part 'odetails_list_cubit.freezed.dart';

class OdetailsListCubit extends Cubit<OdetailsListState> {
  OdetailsListCubit() : super(OdetailsListState.initial());

  getOdetails({required int orderId}) async {
    emit(OdetailsListState.loading());
    try {
      var response = await RestClient().dio!.get(
          'https://stage.apiadmin.kwikbasket.com/api/op/getOrderProducts/${orderId}');
      List orderProducts = response.data['data'];
      List<OdetailsList> odetailsList =
          List.generate(orderProducts.length, (index) {
        return OdetailsList.fromJson(orderProducts[index]);
      });
      // var orderStatusResponse =
      //     await ApiService.get(path: 'deliveryexecutive/getProcessedProducts/${orderId}', queryParameters: {});
      // List data = orderStatusResponse['data'];
      // var orderStatuses = data.map((e) {
      //   return ProcessedProducts.fromJson(e);
      // }).toList();
      emit(OdetailsListState.success(odetailsList: odetailsList, status: []));
    } catch (e) {
      emit(OdetailsListState.failed(e.toString()));
    }
  }
}
