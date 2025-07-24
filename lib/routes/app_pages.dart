import 'package:flutter_getx_clean_architecture/features/login/presentation/binding/login_binding.dart';
import 'package:flutter_getx_clean_architecture/features/login/presentation/login_page.dart';
import 'package:flutter_getx_clean_architecture/routes/app_routes.dart';
import 'package:flutter_getx_clean_architecture/main_dev.dart';
import 'package:get/get.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.home.path,
      page: () => HomePage(),
    ),
    GetPage(
      name: AppRoutes.login.path,
      page: () => LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: AppRoutes.productDetail.path,
      page: () => ProductDetailPage(),
      binding: ProductDetailBinding(),
    ),
    GetPage(
      name: AppRoutes.category.path,
      page: () => CategoryPage(),
      // binding: BindingsBuilder(
      //   () {
      //     Get.lazyPut<CategoryController>(() => CategoryController());
      //   },
      // ),
    ),
  ];
}
