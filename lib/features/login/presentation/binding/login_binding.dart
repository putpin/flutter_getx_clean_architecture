import 'package:flutter_getx_clean_architecture/core/presentation/bindings/base_bindings.dart';
import 'package:flutter_getx_clean_architecture/features/login/data/repository/login_repository_impl.dart';
import 'package:flutter_getx_clean_architecture/features/login/domain/repository/login_repository.dart';
import 'package:flutter_getx_clean_architecture/features/login/domain/usecase/login_use_case.dart';
import 'package:flutter_getx_clean_architecture/features/login/domain/usecase/save_auth_info_use_case.dart';
import 'package:flutter_getx_clean_architecture/features/login/presentation/controller/login_controller.dart';
import 'package:flutter_getx_clean_architecture/shared/utils/get_finder.dart';
import 'package:get/get.dart';

class LoginBinding extends BaseBindings {
  @override
  void bindingsController() {
    Get.lazyPut(
      () => LoginController(
        sl(),
        sl(),
      ),
    );
  }

  @override
  void bindingsRepository() {
    Get.lazyPut<LoginRepository>(() => LoginRepositoryImpl(sl(), sl(), sl()));
  }

  @override
  void bindingsUseCase() {
    Get.lazyPut(() => LoginUseCase(sl()));
    Get.lazyPut(() => SaveAuthInfoUseCase(sl()));
  }
}
