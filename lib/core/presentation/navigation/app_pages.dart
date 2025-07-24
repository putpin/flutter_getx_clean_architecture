import 'package:flutter_getx_clean_architecture/core/presentation/navigation/app_routes.dart';
import 'package:flutter_getx_clean_architecture/main_test.dart';
import 'package:get/get.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.home.path,
      page: () => HomePage(),
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
