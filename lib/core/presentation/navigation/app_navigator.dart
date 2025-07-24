import 'package:flutter/material.dart';
import 'package:flutter_getx_clean_architecture/core/presentation/widgets/base_get_bts_dialog.dart';
import 'package:get/get.dart';

class AppNavigator {
  Future<T?>? toNamed<T>(
    String page, {
    dynamic arguments,
    int? id,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
  }) {
    return Get.toNamed(
      page,
      arguments: arguments,
      id: id,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
    );
  }

  Future<T?>? offNamed<T>(
    String page, {
    dynamic arguments,
    int? id,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
  }) {
    return Get.offNamed(
      page,
      arguments: arguments,
      id: id,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
    );
  }

  void back<T>({
    T? result,
    bool closeOverlays = false,
    bool canPop = true,
    int? id,
  }) {
    Get.back<T>(
      result: result,
      closeOverlays: closeOverlays,
      canPop: canPop,
      id: id,
    );
  }

  Future<T?>? toNamedFactory<T>(
    String page, {
    dynamic arguments,
    int? id,
    Map<String, String>? parameters,
  }) {
    return Get.toNamed(
      page,
      arguments: arguments,
      id: id,
      preventDuplicates: false,
      parameters: parameters,
    );
  }

  Future<T?> showBottomSheet<T>(
    BaseGetBtsDialog bottomSheet, {
    RouteSettings? settings,
  }) {
    return Get.bottomSheet(
      bottomSheet,
      settings: settings,
    );
  }

  Future<T?> showDialog<T>(
    BaseGetBtsDialog dialog, {
    RouteSettings? settings,
  }) {
    return Get.dialog(
      dialog,
      routeSettings: settings,
    );
  }
}
