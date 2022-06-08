import 'package:delivery_app/cubits/get_assigned_cubit/filter_cubit/filteroptions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FilterCubit extends Cubit<FilterOptions> {
  FilterCubit() : super(FilterOptions.none());

  change({required FilterOptions filterOption}) {
    emit(filterOption);
  }
}
