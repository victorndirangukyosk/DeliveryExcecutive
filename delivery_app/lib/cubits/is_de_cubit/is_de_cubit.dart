import 'package:hydrated_bloc/hydrated_bloc.dart';

class IsDeCubit extends HydratedCubit<bool> {
  IsDeCubit(bool state) : super(state);

  @override
  bool? fromJson(Map<String, dynamic> json) {
    return json['val'];
  }

  @override
  Map<String, dynamic>? toJson(bool state) {
    return {'val': state};
  }
}
