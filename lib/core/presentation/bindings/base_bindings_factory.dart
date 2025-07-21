import 'package:flutter/foundation.dart';
import 'package:flutter_getx_clean_architecture/core/presentation/bindings/base_bindings.dart';
import 'package:flutter_getx_clean_architecture/core/utils/get_interface_ext.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

abstract class BaseBindingsFactory extends BaseBindings {
  @override
  @nonVirtual
  void dependencies() {
    GetInterfaceExt.increaseTag();
    dependenciesFactory();
  }

  void dependenciesFactory();
}

class BindingsFactoryBuilder<T> extends BaseBindingsFactory {
  /// Register your dependencies in the [builder] callback.
  final BindingBuilderCallback builder;

  BindingsFactoryBuilder(this.builder);

  @override
  void dependenciesFactory() {
    builder();
  }
}
