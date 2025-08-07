import 'package:flutter_getx_clean_architecture/core/data/data_source/network/network_src.dart';
import 'package:flutter_getx_clean_architecture/core/data/model/model_src.dart';
import 'package:flutter_getx_clean_architecture/features/login/domain/entity/login_request.dart';
import 'package:flutter_getx_clean_architecture/features/login/domain/repository/login_repository.dart';

class LoginRepositoryImpl extends LoginRepository {
  final NonAuthAppServerApiClient _nonAuthAppServerApiClient;

  LoginRepositoryImpl(this._nonAuthAppServerApiClient);

  @override
  Future<BaseResponse<String>> login({
    required LoginRequest request,
  }) async {
    final response = await _nonAuthAppServerApiClient.request(
      method: RestMethod.post,
      path: '/api/Authen/auth',
      body: request.toData().toJson(),
      cancelToken: cancelToken,
    );

    return BaseResponse<String>.fromJson(response);
  }
}
