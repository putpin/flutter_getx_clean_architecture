import 'package:flutter_getx_clean_architecture/core/utils/utils_src.dart';
import 'package:get/get.dart';

extension GetInterfaceExt on GetInterface {
  /// Same as `Get.lazyPut` but requires a tag.
  void lazyPutTag<S>(
    InstanceBuilderCallback<S> builder, {
    required String tag,
    bool fenix = false,
  }) {
    lazyPut<S>(builder, tag: tag, fenix: fenix);
  }

  /// Same as `Get.put` but requires a tag.
  S putTag<S>(
    S dependency, {
    required String tag,
    bool permanent = false,
    InstanceBuilderCallback<S>? builder,
  }) =>
      put<S>(dependency, tag: tag, permanent: permanent);

  /// Same as `Get.find` but requires a tag.
  S findTag<S>({required String tag}) => find<S>(tag: tag);

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

  Future<T?>? toNamedTag<T>(
    String page, {
    String? tag,
    dynamic arguments,
    int? id,
    Map<String, String>? parameters,
  }) {
    return toNamed(
      '$page/${tag ?? uuidV4}',
      arguments: arguments,
      id: id,
      parameters: parameters,
    );
  }
}
