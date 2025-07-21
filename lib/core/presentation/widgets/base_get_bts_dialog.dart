import 'package:flutter_getx_clean_architecture/core/presentation/bindings/base_bindings_factory.dart';
import 'package:flutter_getx_clean_architecture/core/presentation/controllers/base_getx_controller.dart';
import 'package:flutter_getx_clean_architecture/core/presentation/widgets/get_page_mixin.dart';
import 'package:flutter_getx_clean_architecture/core/utils/utils_src.dart';
import 'package:get/get.dart';

abstract class BaseGetBtsDialog<T extends BaseGetxController> extends GetView<T>
    with GetPageMixin {
  BaseGetBtsDialog({super.key});

  @override
  T get controller => _controller;

  late final _controller = () {
    bindingFactory.dependencies();
    return Get.findFactory<T>();
  }();

  BaseBindingsFactory get bindingFactory;
}
