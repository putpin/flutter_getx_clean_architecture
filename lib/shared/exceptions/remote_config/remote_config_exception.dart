import 'package:flutter_getx_clean_architecture/shared/exceptions/base/app_exception.dart';

class RemoteConfigException extends AppException {
  RemoteConfigException({required this.kind, this.rootException})
      : super(AppExceptionType.remoteConfig);

  final RemoteConfigExceptionKind kind;
  final Object? rootException;
}

enum RemoteConfigExceptionKind { platform, unknown, unSupportPlatform }
