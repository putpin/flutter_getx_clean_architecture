import 'dart:async';
import 'package:flutter_getx_clean_architecture/core/presentation/controllers/app_controller.dart';
import 'package:flutter_getx_clean_architecture/core/presentation/navigation/navigation_src.dart';
import 'package:flutter_getx_clean_architecture/core/utils/logger.dart';
import 'package:flutter_getx_clean_architecture/shared/exceptions/base/app_exception.dart';
import 'package:flutter_getx_clean_architecture/shared/exceptions/base/app_exception_wrapper.dart';
import 'package:flutter_getx_clean_architecture/shared/exceptions/remote/remote_exception.dart';
import 'package:flutter_getx_clean_architecture/shared/exceptions/uncaught/app_uncaught_exception.dart';
import 'package:get/get.dart';

/// typedef action for [buildState] method
typedef ActionCallback = FutureOr<void> Function();

/// typedef onError for [buildState] method
typedef OnErrorCallback = FutureOr<AppException?> Function(AppException error);

/// typedef for onFinally for [buildState] method
typedef OnFinallyCallback = FutureOr<void> Function();

abstract class BaseGetxController extends GetxController {
  late final AppController appController;
  late final AppNavigator appNavigator;

  final isLoading = false.obs;
  final isLoadingOverlay = false.obs;

  /// [action] Nếu bên trong hàm action có gọi hàm bất đồng bộ thì
  /// `BẮT BUỘC` phải `await` để `buildState` có thể bắt được lỗi nếu xảy ra
  Future<void> buildState({
    required ActionCallback action,
    OnErrorCallback? onError,
    OnFinallyCallback? onFinally,
    bool showLoading = false,
    bool showLoadingOverlay = false,
    bool handleError = true,
    String? overrideErrorMessage,
  }) async {
    bool hideLoadingOnFinally = true;
    try {
      if (showLoadingOverlay) {
        showPageLoadingOverlay();
      }

      if (showLoading) {
        showPageLoading();
      }

      await action();
    } catch (e, stackTrace) {
      logger.e(e);
      logger.i(stackTrace);
      final appException = e is AppException ? e : AppUncaughtException(e);

      if (appException.appExceptionType == AppExceptionType.remote) {
        final remoteException = appException as RemoteException;
        if (remoteException.kind == RemoteExceptionKind.cancellation) {
          hideLoadingOnFinally = false;
        }
      }

      // onError nếu được truyền vào sẽ luôn được gọi để controller xử lý thêm nếu cần
      // Nếu onError trả về null thì lỗi đã được xử lý và không cần xử lý tiếp nữa, còn nếu trả về một exception khác để core sẽ xử lý tiếp
      final unHandledException = await onError?.call(appException);
      if (unHandledException == null) {
        return;
      }

      if (handleError) {
        // Tự động xử lý exception đã biết
        _handleException(
          AppExceptionWrapper(
            appException: onError != null ? unHandledException : appException,
            stackTrace: stackTrace,
            overrideMessage: overrideErrorMessage,
          ),
        );
      }
    } finally {
      if (hideLoadingOnFinally) {
        if (showLoading) {
          hidePageLoading();
        }

        if (showLoadingOverlay) {
          hidePageLoadingOverlay();
        }
      }

      await onFinally?.call();
    }
  }

  void _handleException(
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

  void showPageLoading() {
    isLoading.value = true;
  }

  void hidePageLoading() {
    isLoading.value = false;
  }

  void showPageLoadingOverlay() {
    isLoadingOverlay.value = true;
  }

  void hidePageLoadingOverlay() {
    isLoadingOverlay.value = false;
  }
}
