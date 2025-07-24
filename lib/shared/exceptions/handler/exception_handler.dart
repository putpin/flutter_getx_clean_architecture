import 'package:flutter_getx_clean_architecture/core/presentation/navigation/app_navigator.dart';
import 'package:flutter_getx_clean_architecture/core/utils/logger.dart';
import 'package:flutter_getx_clean_architecture/shared/exceptions/base/app_exception.dart';
import 'package:flutter_getx_clean_architecture/shared/exceptions/base/app_exception_wrapper.dart';
import 'package:flutter_getx_clean_architecture/shared/exceptions/remote/remote_exception.dart';

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
            // navigator.showSnackBar(
            //   message: l10n.cannotConnectToServer,
            // );
            break;
          case RemoteExceptionKind.serverDefined:
            if (appExceptionWrapper.overrideMessage != null) {
              // navigator.showSnackBar(
              //   message: appExceptionWrapper.overrideMessage!,
              // );
              return;
            }
            // navigator.showSnackBar(
            //   message: exception.serverError?.errorMessage ?? l10n.somethingWentWrong,
            // );
            break;
          case RemoteExceptionKind.network:
            // navigator.showSnackBar(
            //   message: l10n.cannotConnectToServer,
            // );
            break;
          default:
            // TODO: Ko xử lý những exception ko cần thiết như cancellation,...
            logger.e("Unknown error: $exception");
            break;
        }
        break;
      case AppExceptionType.remoteConfig:
        break;
      case AppExceptionType.uncaught:
        // navigator.showSnackBar(
        //   message: l10n.somethingWentWrong,
        // );
        break;
    }
  }
}
