import 'package:bloc/bloc.dart';
import 'package:delivery_app/models/transactions/transactions.dart';
import 'package:delivery_app/utilities/rest_service/rest_service.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


part 'transaction_state.dart';
part 'transaction_cubit.freezed.dart';

class TransactionCubit extends Cubit<TransactionState> {
  TransactionCubit() : super(TransactionState.initial());

  getallTransactions() async {
    emit(const TransactionState.loading());
    try {
      var response = await ApiService().getData(
        path: 'customer/transactions/AllTransactions',
      );
      List pendingTransactions = response['data']['pending_transactions'];
      List successfulTransactions = response['data']['success_transactions'];
      List cancelledTransactions = response['data']['cancelled_transactions'];
      emit(TransactionState.success(
        pendingTransactions: List.generate(pendingTransactions.length,
            (index) => Transactions.fromJson(pendingTransactions[index])),
        successfulTransactions: List.generate(successfulTransactions.length,
            (index) => Transactions.fromJson(successfulTransactions[index])),
        cancelledTransactions: List.generate(cancelledTransactions.length,
            (index) => Transactions.fromJson(cancelledTransactions[index])),
      ));
    } catch (e) {
      emit(TransactionState.failed(e.toString()));
    }
  }
}
