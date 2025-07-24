import 'package:flutter_getx_clean_architecture/core/data/model/model_src.dart';
import 'package:flutter_getx_clean_architecture/core/domain/repository/base_repository.dart';
import 'package:flutter_getx_clean_architecture/features/login/domain/entity/login_request.dart';

abstract class LoginRepository extends BaseRepository {
  Future<BaseResponse<String>> login({
    required LoginRequest request,
  });
}
