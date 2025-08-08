import 'package:flutter_getx_clean_architecture/core/presentation/bindings/base_bindings_factory.dart';
import 'package:flutter_getx_clean_architecture/features/product_detail/presentation/controller/product_detail_controller.dart';
import 'package:flutter_getx_clean_architecture/shared/utils/utils_src.dart';
import 'package:get/get.dart';

class ProductDetailBinding extends BaseBindingsFactory {
  @override
  void bindingsFactoryController() {
    Get.lazyPutFactory<ProductDetailController>(
      () => ProductDetailController(
        productId: Get.arguments as int,
      ),
    );
  }

  @override
  void bindingsFactoryRepository() {
    // TODO: implement bindingsFactoryRepository
  }

  @override
  void bindingsFactoryUseCase() {
    // TODO: implement bindingsFactoryUseCase
  }
}
