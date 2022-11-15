import 'dart:io';

import 'package:delivery_app/cubits/customer_token.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';


class CustomerAuthInterceptor extends Interceptor {
  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    CustomerTokenCubit customerTokenCubit = GetIt.I<CustomerTokenCubit>();

    options.headers[HttpHeaders.authorizationHeader] =
        'Bearer ${customerTokenCubit.state}';

    options.headers[HttpHeaders.acceptHeader] = 'application/json';
    handler.next(options);
  }
}
