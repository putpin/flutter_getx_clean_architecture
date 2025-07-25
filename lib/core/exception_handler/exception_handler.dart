import 'dart:io';

import 'package:flutter_getx_clean_architecture/core/presentation/navigation/app_navigator.dart';
import 'package:flutter_getx_clean_architecture/core/utils/logger.dart';
import 'package:flutter_getx_clean_architecture/generated/locales.g.dart';
import 'package:flutter_getx_clean_architecture/routes/app_routes.dart';
import 'package:flutter_getx_clean_architecture/shared/exceptions/base/app_exception.dart';
import 'package:flutter_getx_clean_architecture/shared/exceptions/base/app_exception_wrapper.dart';
import 'package:flutter_getx_clean_architecture/shared/exceptions/remote/remote_exception.dart';
import 'package:get/get.dart';

class ExceptionHandler {
  final AppNavigator appNavigator;

  const ExceptionHandler({
    required this.appNavigator,
  });

  void handleException(
    AppExceptionWrapper appExceptionWrapper,
  ) {
    switch (appExceptionWrapper.appException.appExceptionType) {
      case AppExceptionType.remote:
        final exception = appExceptionWrapper.appException as RemoteException;
        switch (exception.kind) {
          case RemoteExceptionKind.noInternet:
          case RemoteExceptionKind.timeout:
            appNavigator.showSnackBar(
              message: LocaleKeys.app_cannotConnectToServer.tr,
            );
            break;
          case RemoteExceptionKind.serverDefined:
            if (exception.httpErrorCode == HttpStatus.unauthorized) {
              appNavigator.showSnackBar(
                message: 'Phiên đăng nhập đã hết hạn, vui lòng đăng nhập lại',
              );
              appNavigator.offAllNamed(AppRoutes.login.path);
              return;
            }

            if (appExceptionWrapper.overrideMessage != null) {
              appNavigator.showSnackBar(
                message: appExceptionWrapper.overrideMessage!,
              );
              return;
            }
            appNavigator.showSnackBar(
              message: exception.serverError?.errorMessage ??
                  LocaleKeys.app_somethingWentWrong.tr,
            );
            break;
          case RemoteExceptionKind.network:
            appNavigator.showSnackBar(
              message: LocaleKeys.app_cannotConnectToServer.tr,
            );
            break;
          default:
            // TODO: Ko xử lý những exception ko cần thiết như cancellation,...
            logger.e("Unknown error: $exception");
            break;
        }
        break;
      case AppExceptionType.remoteConfig:
        break;
      case AppExceptionType.custom:
      case AppExceptionType.uncaught:
        appNavigator.showSnackBar(
          message: LocaleKeys.app_somethingWentWrong.tr,
        );
        break;
    }
  }
}
