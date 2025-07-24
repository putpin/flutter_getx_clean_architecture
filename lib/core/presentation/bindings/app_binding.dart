import 'package:flutter_getx_clean_architecture/core/data/data_source/local/app_hive.dart';
import 'package:flutter_getx_clean_architecture/core/presentation/controllers/app_controller.dart';
import 'package:flutter_getx_clean_architecture/core/presentation/navigation/navigation_src.dart';
import 'package:flutter_getx_clean_architecture/core/exception_handler/exception_handler.dart';
import 'package:get/get.dart';

import 'base_bindings.dart';

class AppBinding extends BaseBindings {
  @override
  Future<void> dependencies() async {
    await bindingsCore();
    super.dependencies();
  }

  Future<void> bindingsCore() async {
    await Get.putAsync(() => AppHive().init(), permanent: true);
    Get.put(AppNavigator(), permanent: true);
    Get.put(ExceptionHandler(appNavigator: Get.find()), permanent: true);
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
