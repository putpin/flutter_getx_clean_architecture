import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_getx_clean_architecture/core/domain/repository/base_repository.dart';
import 'package:flutter_getx_clean_architecture/core/domain/usecase/base_use_case.dart';
import 'package:flutter_getx_clean_architecture/core/presentation/controllers/base_getx_controller.dart';
import 'package:flutter_getx_clean_architecture/core/presentation/widgets/base_get_page.dart';
import 'package:flutter_getx_clean_architecture/core/presentation/widgets/base_get_page_factory.dart';
import 'package:flutter_getx_clean_architecture/core/utils/utils_src.dart';
import 'package:get/get.dart';

void main() {
  runApp(GetMaterialApp(
    title: 'Product Detail Demo',
    initialRoute: '/',
    getPages: AppRoutes.routes,
  ));
}

class AppRoutes {
  static final routes = [
    GetPage(
      name: '/',
      page: () => HomePage(),
    ),
    GetPage(
      name: '/product_detail',
      page: () => ProductDetailPage(),
      binding: ProductDetailBinding(),
    ),
    GetPage(
      name: '/category',
      page: () => CategoryPage(),
      binding: BindingsBuilder(
        () {
          Get.lazyPut<CategoryController>(() => CategoryController());
        },
      ),
    ),
  ];
}

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final products = List.generate(5, (index) => 'Product ${index + 1}');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (_, index) => ListTile(
          title: Text(products[index]),
          onTap: () {
            final productId = (index + 1).toString();
            Get.toNamedFactory(
              '/product_detail',
              arguments: productId,
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final r = Get.findFactory<GetProductDetailUseCase>();
          log('GetProductDetailUseCase instance: $r');
        },
        child: Icon(Icons.category),
      ),
    );
  }
}

class ProductDetailBinding extends Bindings {
  @override
  void dependencies() {
    // inject the repository
    Get.lazyPutFactory<ProductDetailRepository>(
      () => ProductDetailRepositoryImpl(),
    );

    // inject the use case
    Get.lazyPutFactory<GetProductDetailUseCase>(
      () => GetProductDetailUseCase(Get.findFactory()),
    );

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
}

class ProductDetailPage extends BaseGetPageFactory<ProductDetailController> {
  ProductDetailPage({super.key});

  // @override
  // String? get tag => _tag;

  // Phải lấy tag và lưu vào 1 biến thay vì Get.parameters['tag'] trong getter tag bên trên
  // vì Get.parameters['tag'] sẽ bị thay đổi mỗi khi chuyển trang
  // final _tag = Get.parameters['tag'];

  @override
  Widget buildPage(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(controller.productName)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Detail for ${controller.productName}'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Mở tiếp một ProductDetailPage mới
                final newId = (int.parse(controller.productId) + 1).toString();
                Get.toNamedFactory(
                  '/product_detail',
                  arguments: newId,
                );
              },
              child: Text('Go to next product'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Get.toNamed('/category');
              },
              child: Text('Go to Category Page'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                controller.showLoadingOverlay();

                Future.delayed(Duration(seconds: 2), () {
                  controller.hideLoadingOverlay();
                });
              },
              child: Text('ShowLoadingOverlay'),
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryController extends BaseGetxController {
  final count = 0.obs;
}

class CategoryPage extends BaseGetPage<CategoryController> {
  CategoryPage({super.key});

  @override
  Widget buildPage(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Category Page')),
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
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
