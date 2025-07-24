enum AppRoutes {
  home,
  login,
  productDetail,
  category;

  String get path {
    return '/$name';
  }
}
