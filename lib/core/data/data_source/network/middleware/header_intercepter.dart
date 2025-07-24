import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_getx_clean_architecture/core/data/data_source/network/middleware/base_intercepter.dart';
import 'package:flutter_getx_clean_architecture/core/utils/app_info.dart';

class HeaderInterceptor extends BaseInterceptor {
  HeaderInterceptor(this._appInfo);

  Map<String, dynamic> _headers = {};
  final AppInfo _appInfo;

  set headers(Map<String, dynamic> headers) {
    _headers = headers;
  }

  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final userAgentValue = userAgentClientHintsHeader();
    options.headers['User-Agent'] = userAgentValue;
    options.headers.addAll(_headers);
    handler.next(options);
  }

  String userAgentClientHintsHeader() {
    return '${Platform.operatingSystem} - ${_appInfo.versionName}(${_appInfo.versionCode})';
  }
}
