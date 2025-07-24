import 'package:dio/dio.dart';
import 'package:flutter_getx_clean_architecture/core/data/data_source/local/app_hive.dart';
import 'package:flutter_getx_clean_architecture/core/data/data_source/network/middleware/base_intercepter.dart';

class AccessTokenInterceptor extends BaseInterceptor {
  AccessTokenInterceptor(this._appHive);

  final AppHive _appHive;

  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final accessToken = _appHive.accessToken;
    if (accessToken != null && accessToken.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $accessToken';
    }

    handler.next(options);
  }
}
