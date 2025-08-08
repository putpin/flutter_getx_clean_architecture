import 'package:flutter_getx_clean_architecture/core/domain/entity/entity.dart';

class LoginRequest extends Entity {
  final String username;
  final String password;

  LoginRequest({
    required this.username,
    required this.password,
  });
}
