part of 'get_bloc.dart';

abstract class GetState extends Equatable {
  const GetState();
  
  @override
  List<Object> get props => [];
}

class GetInitial extends GetState {}
