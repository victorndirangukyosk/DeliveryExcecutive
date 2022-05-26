import 'package:hydrated_bloc/hydrated_bloc.dart';

class ProcessedItemsCubit extends Cubit<List<Map<String, dynamic>>> {
  ProcessedItemsCubit() : super([]);

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
