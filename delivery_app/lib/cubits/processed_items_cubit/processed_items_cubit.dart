import 'package:hydrated_bloc/hydrated_bloc.dart';

class ProcessedItemsCubit extends HydratedCubit<List<Map<String, dynamic>>> {
  ProcessedItemsCubit() : super([]);

  @override
  List<Map<String, dynamic>>? fromJson(Map<String, dynamic> json) {
    return json['value'];
  }

  @override
  Map<String, dynamic>? toJson(List<Map<String, dynamic>> state) {
    return {'value': state};
  }

  // getProcessedItems() async {
  //   emit([]);
  //   try {
  //     var response = await RestClient().dio!.get(
  //         'https://stage.apiadmin.kwikbasket.com/api/op/getProcessedProducts/1');
  //     List orderProducts = response.data['data'];
  //     List<Map<String,dynamic>> odetailsList =
  //         List.generate(orderProducts.length, (index) {
  //       return orderProducts[index];
  //     });
  //     emit(odetailsList);
  //   } catch (e) {
  //     emit([]);
  //   }
  // }
}
