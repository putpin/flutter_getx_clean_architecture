import 'package:flutter/material.dart';
import 'package:flutter_getx_clean_architecture/core/presentation/controllers/app_controller.dart';
import 'package:flutter_getx_clean_architecture/core/presentation/navigation/navigation_src.dart';
import 'package:flutter_getx_clean_architecture/core/presentation/widgets/base_get_page.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

class App extends BaseGetPage<AppController> {
  App({super.key});

  @override
  bool get isAppWidget => true;

  @override
  Widget buildPage(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter GetX Clean Architecture',
      initialRoute: AppRoutes.home.path,
      getPages: AppPages.pages,
    );
  }
}
