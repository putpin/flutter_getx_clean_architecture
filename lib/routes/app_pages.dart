import 'package:flutter_getx_clean_architecture/features/home/presentation/binding/home_binding.dart';
import 'package:flutter_getx_clean_architecture/features/home/presentation/home_page.dart';
import 'package:flutter_getx_clean_architecture/features/login/presentation/binding/login_binding.dart';
import 'package:flutter_getx_clean_architecture/features/login/presentation/login_page.dart';
import 'package:flutter_getx_clean_architecture/features/product_detail/presentation/binding/product_detail_binding.dart';
import 'package:flutter_getx_clean_architecture/features/product_detail/presentation/product_detail_page.dart';
import 'package:flutter_getx_clean_architecture/routes/app_routes.dart';
import 'package:get/get.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.home.path,
      page: () => HomePage(),
      binding: HomeBinding(),
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
  ];
}
