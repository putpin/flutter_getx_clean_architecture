import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_getx_clean_architecture/core/config/env_config.dart';
import 'package:flutter_getx_clean_architecture/core/domain/repository/base_repository.dart';
import 'package:flutter_getx_clean_architecture/core/domain/usecase/base_use_case.dart';
import 'package:flutter_getx_clean_architecture/core/presentation/app.dart';
import 'package:flutter_getx_clean_architecture/core/presentation/bindings/app_binding.dart';
import 'package:flutter_getx_clean_architecture/core/presentation/bindings/base_bindings_factory.dart';
import 'package:flutter_getx_clean_architecture/core/presentation/controllers/base_getx_controller.dart';
import 'package:flutter_getx_clean_architecture/core/presentation/navigation/app_navigator.dart';
import 'package:flutter_getx_clean_architecture/routes/app_routes.dart';
import 'package:flutter_getx_clean_architecture/core/presentation/widgets/base_get_bts_dialog.dart';
import 'package:flutter_getx_clean_architecture/core/presentation/widgets/base_get_page_factory.dart';
import 'package:flutter_getx_clean_architecture/core/utils/utils_src.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppBinding().bind(env: AppEnv.prod);
  runApp(App());
}

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final products = List.generate(5, (index) => 'Product ${index + 1}');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (_, index) => ListTile(
          title: Text(products[index]),
          onTap: () {
            final appNavigator = Get.find<AppNavigator>();
            final productId = (index + 1).toString();
            appNavigator.toNamedFactory(
              AppRoutes.productDetail.path,
              arguments: productId,
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // final r = Get.findFactory<GetProductDetailUseCase>();
          // log('GetProductDetailUseCase instance: $r');
          // Get.showBottomSheet(
          //   ProductDetailPage(),
          //   settings: RouteSettings(
          //     arguments: '1',
          //   ),
          // );

          // Get.showDialog(
          //   ProductDetailPage(),
          //   settings: RouteSettings(
          //     arguments: '1',
          //   ),
          // );
        },
        child: const Icon(Icons.category),
      ),
    );
  }
}

class ProductDetailBinding extends BaseBindingsFactory {
  @override
  void bindingsFactoryRepository() {
    // inject the repository
    Get.lazyPutFactory<ProductDetailRepository>(
      () => ProductDetailRepositoryImpl(),
    );
  }

  @override
  void bindingsFactoryUseCase() {
    // inject the use case
    Get.lazyPutFactory<GetProductDetailUseCase>(
      () => GetProductDetailUseCase(Get.findFactory()),
    );
  }

  @override
  void bindingsFactoryController() {
    Get.lazyPutFactory(
      () => ProductDetailController(
        Get.findFactory(),
      ),
    );
  }
}

abstract class ProductDetailRepository extends BaseRepository {
  ProductDetailRepository() {
    log('ProductDetailRepository ctor called');
  }
}

class ProductDetailRepositoryImpl extends ProductDetailRepository {}

class GetProductDetailUseCase extends UseCase<String, String> {
  final ProductDetailRepository repository;

  GetProductDetailUseCase(this.repository);

  @override
  String execute(String input) {
    // Simulate fetching product detail
    return 'Details for product $input';
  }
}

class ProductDetailController extends BaseGetxController {
  final String productId = Get.arguments;
  final GetProductDetailUseCase getProductDetailUseCase;

  ProductDetailController(this.getProductDetailUseCase);

  late String productName;

  @override
  void onInit() {
    super.onInit();
    productName = 'Product $productId';
    debugPrint('Controller created for $productName');
  }

  void toProductDetailPage(String id) {
    appNavigator.toNamedFactory(
      AppRoutes.productDetail.path,
      arguments: id,
    );
  }
}

class ProductDetailPage extends BaseGetPageFactory<ProductDetailController> {
  ProductDetailPage({super.key});

  @override
  Widget buildPage(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(controller.productName)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Detail for ${controller.productName}'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Mở tiếp một ProductDetailPage mới
                final newId = (int.parse(controller.productId) + 1).toString();
                // appNavigator.toNamedFactory(
                //   '/product_detail',
                //   arguments: newId,
                // );
                controller.toProductDetailPage(newId);
              },
              child: const Text('Go to next product'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Get.toNamed(
                  AppRoutes.category.path,
                );
              },
              child: const Text('Go to Category Page'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                controller.showPageLoadingOverlay();

                Future.delayed(const Duration(seconds: 2), () {
                  controller.hidePageLoadingOverlay();
                });
              },
              child: const Text('ShowLoadingOverlay'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Get.showBottomSheet(
          //   ProductDetailPage(),
          //   settings: RouteSettings(
          //     arguments: '1',
          //   ),
          // );
        },
        child: const Icon(Icons.category),
      ),
    );
  }

  // @override
  // BaseBindingsFactory get binding => ProductDetailBinding();
}

class CategoryController extends BaseGetxController {
  final count = 0.obs;
}

class CategoryPage extends BaseGetBtsDialog<CategoryController> {
  CategoryPage({super.key});

  @override
  Widget buildPage(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Category Page')),
      body: Center(
        child: Obx(
          () {
            return Text('${controller.count.value} categories');
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.count.value++;
          appNavigator.showBottomSheet(
            CategoryPage(),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  @override
  BaseBindingsFactory get bindingFactory => BindingsFactoryBuilder(
        bindingsFactoryControllerBuilder: () {
          Get.lazyPutFactory<CategoryController>(
            () => CategoryController(),
          );
        },
      );
}
