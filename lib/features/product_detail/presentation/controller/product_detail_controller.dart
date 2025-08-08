import 'package:flutter_getx_clean_architecture/core/presentation/controllers/base_getx_controller.dart';
import 'package:flutter_getx_clean_architecture/routes/app_routes.dart';

class ProductDetailController extends BaseGetxController {
  final int productId;

  ProductDetailController({
    required this.productId,
  });

  void goToAnotherProductDetail() {
    nav.toNamedFactory(
      AppRoutes.productDetail.path,
      arguments: productId + 1,
    );
  }
}
