import 'package:flutter/foundation.dart';
import 'package:flutter_getx_clean_architecture/core/presentation/bindings/base_bindings.dart';
import 'package:get/get.dart';

const String tagParam = 'tag';

abstract class BaseBindingsTag extends BaseBindings {
  @override
  @nonVirtual
  void dependencies() {
    final tag = Get.parameters[tagParam];
    assert(
      tag != null,
      'Tag parameter is required for $runtimeType',
    );
    dependenciesTag(tag!);
  }

  void dependenciesTag(String tag);
}
