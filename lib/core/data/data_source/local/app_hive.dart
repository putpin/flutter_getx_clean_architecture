class AppHive {
  Future<AppHive> init() async {
    await Future.delayed(Duration(seconds: 1));
    return this;
  }

  String? get accessToken {
    // Simulate fetching access token from Hive
    return 'sample_access_token';
  }
}
