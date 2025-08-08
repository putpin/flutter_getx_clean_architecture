import 'package:flutter_getx_clean_architecture/core/presentation/bindings/base_bindings.dart';
import 'package:flutter_getx_clean_architecture/features/home/presentation/controller/home_controller.dart';
import 'package:get/get.dart';

class HomeBinding extends BaseBindings {
  @override
  void bindingsController() {
    Get.lazyPut(() => HomeController());
  }

  @override
  void bindingsRepository() {
    // TODO: implement bindingsRepository
  }

  @override
  void bindingsUseCase() {
    // TODO: implement bindingsUseCase
  }
}
