import 'package:bloc/bloc.dart';
import 'package:delivery_app/models/odetails_list/de/odetails_de.dart';
import 'package:delivery_app/utilities/utilities.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'o_details_de_state.dart';
part 'o_details_de_cubit.freezed.dart';

class ODetailsDeCubit extends Cubit<ODetailsDeState> {
  ODetailsDeCubit() : super(ODetailsDeState.initial());

  getDeOrderDetails({required int orderId}) async {
    emit(ODetailsDeState.initial());
    try {
      var response = await RestClient().dio!.get(
          'https://stage.apiadmin.kwikbasket.com/api/deliveryexecutive/getOrderProducts/${orderId}');
      List orderProducts = response.data['data'];
      List<OdetailsDe> odeDetailsList =
          List.generate(orderProducts.length, (index) {
        return OdetailsDe.fromJson(orderProducts[index]);
      });
      // var orderStatusResponse =
      //     await ApiService.get(path: 'deliveryexecutive/getProcessedProducts/${orderId}', queryParameters: {});
      // List data = orderStatusResponse['data'];
      // var orderStatuses = data.map((e) {
      //   return ProcessedProducts.fromJson(e);
      // }).toList();
      emit(ODetailsDeState.success(odeDetailsList: odeDetailsList));
    } catch (e) {
      emit(ODetailsDeState.failed(e.toString()));
    }
  }
}
