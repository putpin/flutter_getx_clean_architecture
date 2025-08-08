import 'package:flutter_getx_clean_architecture/core/data/data_source/network/network_src.dart';
import 'package:flutter_getx_clean_architecture/core/data/model/model_src.dart';
import 'package:flutter_getx_clean_architecture/features/login/domain/entity/login_request.dart';
import 'package:flutter_getx_clean_architecture/features/login/domain/repository/login_repository.dart';
import 'package:flutter_getx_clean_architecture/shared/mappers/login_request_data_mapper.dart';

class LoginRepositoryImpl extends LoginRepository {
  final NonAuthAppServerApiClient _nonAuthAppServerApiClient;
  final AuthAppServerApiClient _authAppServerApiClient;
  final LoginRequestDataMapper _loginRequestDataMapper;

  LoginRepositoryImpl(
    this._nonAuthAppServerApiClient,
    this._authAppServerApiClient,
    this._loginRequestDataMapper,
  );

  @override
  Future<BaseResponse<String>> login({
    required LoginRequest request,
  }) async {
    final response = await _nonAuthAppServerApiClient.request(
      method: RestMethod.post,
      path: '/api/Authen/auth',
      body: _loginRequestDataMapper.mapToData(request).toJson(),
      cancelToken: cancelToken,
    );

    return BaseResponse<String>.fromJson(response);
  }
}
