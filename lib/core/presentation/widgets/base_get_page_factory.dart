import 'package:flutter_getx_clean_architecture/core/presentation/controllers/base_getx_controller.dart';
import 'package:flutter_getx_clean_architecture/core/presentation/widgets/get_page_mixin.dart';
import 'package:get/get.dart';

abstract class BaseGetPageFactory<T extends BaseGetxController>
    extends GetView<T> with GetPageMixin {
  BaseGetPageFactory({super.key});

  @override
  bool get isFactory => true;
}
