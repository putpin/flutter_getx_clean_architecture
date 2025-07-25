import 'package:flutter_getx_clean_architecture/core/presentation/controllers/base_getx_controller.dart';
import 'package:flutter_getx_clean_architecture/core/utils/logger.dart';
import 'package:flutter_getx_clean_architecture/features/login/domain/entity/login_request.dart';
import 'package:flutter_getx_clean_architecture/features/login/domain/exception/login_exception.dart';
import 'package:flutter_getx_clean_architecture/features/login/domain/usecase/login_use_case.dart';

class LoginController extends BaseGetxController {
  final LoginUseCase _loginUseCase;

  LoginController(
    this._loginUseCase,
  );

  Future<void> login() async {
    await buildState(
      showLoadingOverlay: true,
      action: () async {
        // Example usage of the login use case
        final loginRequest = LoginRequest(
          username: 'sd8888k17',
          password: 'Viettel@7891',
        );
        final accessToken = await _loginUseCase.execute(loginRequest);
        logger.d('Login result: $accessToken');
        // TODO Save access token to local storage
      },
      onError: (error) {
        if (error is LoginException &&
            error.kind == LoginExceptionKind.invalidUsernameOrPassword) {
          appNavigator.showSnackBar(
              message: "Tài khoản hoặc mật khẩu không đúng");
          return null;
        }

        return error;
      },
    );
  }
}
