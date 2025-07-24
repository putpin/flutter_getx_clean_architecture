class AppHive {
  Future<AppHive> init() async {
    await Future.delayed(Duration(seconds: 1));
    return this;
  }
}
