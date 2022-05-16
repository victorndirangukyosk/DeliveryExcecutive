import 'package:bloc/bloc.dart';
import 'package:delivery_app/models/accept_reject/accept_reject.dart';
import 'package:delivery_app/services/api_service/api_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'accept_reject_state.dart';
part 'accept_reject_cubit.freezed.dart';

class AcceptRejectCubit extends Cubit<AcceptRejectState> {
  AcceptRejectCubit() : super(AcceptRejectState.initial());


  actionArea({required List<AcceptReject> crates, required int orderId}) async {
    emit(const AcceptRejectState.loading());
    try {
      await ApiService.post(data: {
        'order_id': orderId,
        'products':
            List.generate(crates.length, (index) => crates[index].toJson())
      }, path: 'deliveryexecutive/accept_rejectProducts');
      emit(const AcceptRejectState.success());
    } catch (e) {
      emit(AcceptRejectState.failed(e.toString()));
    }
  }
}
