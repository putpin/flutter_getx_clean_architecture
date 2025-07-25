import 'package:flutter_getx_clean_architecture/shared/exceptions/base/app_exception.dart';

class LoginException extends AppException {
  LoginException({
    required this.kind,
    this.rootException,
  }) : super(AppExceptionType.custom);

  final LoginExceptionKind kind;
  final Object? rootException;

  @override
  String toString() =>
      "LoginException(kind: $kind, rootException: $rootException";
}

enum LoginExceptionKind {
  invalidUsernameOrPassword,
  userNotFound,
  accountLocked,
  unknownError,
}
