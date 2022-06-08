import 'package:freezed_annotation/freezed_annotation.dart';

part 'filteroptions.freezed.dart';

@freezed
class FilterOptions with _$FilterOptions {
  factory FilterOptions.none() = _None;
  factory FilterOptions.deliveryDate() = _DeliveryDate;
  factory FilterOptions.timeslot(String timeslot) = _Timeslot;
  factory FilterOptions.orderStatus() = _OrderStatus;
  factory FilterOptions.dateAssigned(DateTime dateAssigned) = _DateAssigned;
  factory FilterOptions.monthYear() = _MonthYear;
}
