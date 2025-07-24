import 'package:flutter_getx_clean_architecture/core/const/const.dart';
import 'package:dio/dio.dart';

class DioBuilder {
  const DioBuilder._();

  static Dio createDio({
    BaseOptions? options,
    List<Interceptor> interceptors = const [],
  }) {
    final dio = Dio(
      BaseOptions(
        connectTimeout: options?.connectTimeout ?? connectTimeout,
        receiveTimeout: options?.receiveTimeout ?? receiveTimeout,
        sendTimeout: options?.sendTimeout ?? sendTimeout,
        baseUrl: options?.baseUrl ?? '',
      ),
    );

    dio.interceptors.addAll(interceptors);

    return dio;
  }
}
