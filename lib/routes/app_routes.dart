enum AppRoutes {
  home,
  productDetail,
  category;

  String get path {
    return '/$name';
  }
}
