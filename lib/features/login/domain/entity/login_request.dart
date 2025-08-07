import 'package:flutter_getx_clean_architecture/core/domain/entity/base/entity.dart';
import 'package:flutter_getx_clean_architecture/features/login/data/model/login_request_data.dart';

class LoginRequest extends Entity {
  final String username;
  final String password;

  LoginRequest({
    required this.username,
    required this.password,
  });

  LoginRequestData toData() {
    return LoginRequestData(
      username: username,
      password: password,
    );
  }
}
