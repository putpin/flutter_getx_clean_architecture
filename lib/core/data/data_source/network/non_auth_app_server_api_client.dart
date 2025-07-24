import 'package:dio/dio.dart';
import 'package:flutter_getx_clean_architecture/core/data/data_source/network/dio_builder.dart';
import 'package:flutter_getx_clean_architecture/core/data/data_source/network/middleware/header_intercepter.dart';
import 'package:flutter_getx_clean_architecture/core/data/data_source/network/rest_api_client.dart';

class NonAuthAppServerApiClient extends RestApiClient {
  NonAuthAppServerApiClient(
    HeaderInterceptor headerInterceptor,
  ) : super(
          dio: DioBuilder.createDio(
            options:
                BaseOptions(baseUrl: 'https://vbhxh1.easyhrm.vn/api-mobile'),
            interceptors: [
              headerInterceptor,
            ],
          ),
        );
}
