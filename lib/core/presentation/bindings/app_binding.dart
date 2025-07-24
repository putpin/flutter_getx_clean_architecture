import 'package:flutter_getx_clean_architecture/core/config/env_config.dart';
import 'package:flutter_getx_clean_architecture/core/data/data_source/local/app_hive.dart';
import 'package:flutter_getx_clean_architecture/core/data/data_source/network/network_src.dart';
import 'package:flutter_getx_clean_architecture/core/presentation/controllers/app_controller.dart';
import 'package:flutter_getx_clean_architecture/core/presentation/navigation/navigation_src.dart';
import 'package:flutter_getx_clean_architecture/core/exception_handler/exception_handler.dart';
import 'package:flutter_getx_clean_architecture/core/utils/app_info.dart';
import 'package:get/get.dart';

import 'base_bindings.dart';

class AppBinding extends BaseBindings {
  Future<void> bind({
    required AppEnv env,
  }) async {
    await bindingsCore(env);
    dependencies();
  }

  Future<void> bindingsCore(AppEnv env) async {
    Get.put<EnvConfig>(
      switch (env) {
        AppEnv.dev => EnvConfigDev(),
        AppEnv.prod => EnvConfigProd(),
      },
      permanent: true,
    );
    await [
      Get.putAsync(AppHive().init, permanent: true),
      Get.putAsync(AppInfo().init, permanent: true)
    ].wait;
    Get.put(AppNavigator(), permanent: true);
    Get.put(ExceptionHandler(appNavigator: Get.find()), permanent: true);

    Get.put(HeaderInterceptor(Get.find()), permanent: true);
    Get.put(AccessTokenInterceptor(Get.find()), permanent: true);
    Get.put(
      AuthAppServerApiClient(Get.find(), Get.find(), Get.find()),
      permanent: true,
    );
    Get.put(NonAuthAppServerApiClient(Get.find(), Get.find()), permanent: true);
  }

  @override
  void bindingsController() {
    Get.put(AppController(), permanent: true);
  }

  @override
  void bindingsRepository() {}

  @override
  void bindingsUseCase() {}
}
