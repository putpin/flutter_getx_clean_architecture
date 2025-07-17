import 'package:flutter/material.dart';
import 'package:flutter_getx_clean_architecture/core/presentation/bindings/base_bindings_tag.dart';
import 'package:get/get.dart';

class GetPageTag<T> extends GetPage<T> {
  GetPageTag({
    required String name,
    required super.page,
    super.title,
    super.participatesInRootNavigator,
    super.gestureWidth,
    super.maintainState = true,
    super.curve = Curves.linear,
    super.alignment,
    super.parameters,
    super.opaque = true,
    super.transitionDuration,
    super.popGesture,
    super.binding,
    super.bindings = const [],
    super.transition,
    super.customTransition,
    super.fullscreenDialog = false,
    super.children = const <GetPage>[],
    super.middlewares,
    super.unknownRoute,
    super.arguments,
    super.showCupertinoParallax = true,
    super.preventDuplicates = true,
  }) : super(name: '$name/:$tagParam');
}
