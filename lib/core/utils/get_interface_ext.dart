import 'package:flutter/widgets.dart';
import 'package:flutter_getx_clean_architecture/core/presentation/widgets/base_get_bottom_sheet.dart';
import 'package:get/get.dart';

extension GetInterfaceExt on GetInterface {
  static int _tag = 0;

  String get tag => 'SDS_$_tag';

  /// Same as `Get.lazyPut` but create new instance with a tag.
  void lazyPutFactory<S>(
    InstanceBuilderCallback<S> builder, {
    bool fenix = false,
  }) {
    lazyPut<S>(
      builder,
      tag: tag,
      fenix: fenix,
    );
  }

  /// Same as `Get.put` but create new instance with a tag.
  S putFactory<S>(
    S dependency, {
    bool permanent = false,
    InstanceBuilderCallback<S>? builder,
  }) =>
      put<S>(
        dependency,
        tag: tag,
        permanent: permanent,
      );

  /// Same as `Get.find` but returns the instance with a current tag.
  S findFactory<S>() => find<S>(
        tag: tag,
      );

  /// The findOrNull method will return the instance if it is registered;
  /// otherwise, it will return null.
  S? findOrNull<S>({String? tag}) {
    if (isRegistered<S>(tag: tag)) {
      return find<S>(tag: tag);
    }
    return null;
  }

  T? safeArguments<T>() {
    final arguments = Get.arguments;
    return arguments is T? ? arguments : null;
  }

  static void increaseTag() {
    ++_tag;
  }

  Future<T?>? toNamedFactory<T>(
    String page, {
    dynamic arguments,
    int? id,
    Map<String, String>? parameters,
  }) {
    increaseTag();
    return toNamed(
      page,
      arguments: arguments,
      id: id,
      preventDuplicates: false,
      parameters: parameters,
    );
  }

  Future<T?> showBottomSheet<T>(
    BaseGetBottomSheet bottomSheet, {
    RouteSettings? settings,
  }) {
    return Get.bottomSheet(
      bottomSheet,
      settings: settings,
    );
  }

  Future<T?> showDialog<T>(
    BaseGetBottomSheet dialog, {
    RouteSettings? settings,
  }) {
    return Get.dialog(
      dialog,
      routeSettings: settings,
    );
  }
}
