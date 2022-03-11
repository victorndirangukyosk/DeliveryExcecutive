
import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_orders_state.freezed.dart';
part 'get_orders_state.g.dart';

@freezed
class GetOrdersState with _$GetOrdersState {
  factory GetOrdersState(

    num? order_status_id,
    String? name,
  ) = _GetOrdersState;
	
  factory GetOrdersState.fromJson(Map<String, dynamic> json) =>
			_$GetOrdersStateFromJson(json);
}
