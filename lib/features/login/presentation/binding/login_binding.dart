import 'package:flutter_getx_clean_architecture/core/presentation/bindings/base_bindings.dart';
import 'package:flutter_getx_clean_architecture/features/login/data/repository/login_repository_impl.dart';
import 'package:flutter_getx_clean_architecture/features/login/domain/repository/login_repository.dart';
import 'package:flutter_getx_clean_architecture/features/login/domain/usecase/login_use_case.dart';
import 'package:flutter_getx_clean_architecture/features/login/presentation/controller/login_controller.dart';
import 'package:get/get.dart';

class LoginBinding extends BaseBindings {
  @override
  void bindingsController() {
    Get.lazyPut(() => LoginController(Get.find()));
  }

  @override
  void bindingsRepository() {
    Get.lazyPut<LoginRepository>(() => LoginRepositoryImpl(Get.find()));
  }

  @override
  void bindingsUseCase() {
    Get.lazyPut(() => LoginUseCase(Get.find()));
  }
}
