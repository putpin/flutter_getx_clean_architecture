import 'package:flutter_getx_clean_architecture/core/utils/logger.dart';

class AppHive {
  Future<AppHive> init() async {
    await Future.delayed(const Duration(seconds: 1));
    return this;
  }

  Future<void> saveAccessToken(String accessToken) async {
    // Simulate saving access token to Hive
    logger.d('Access token saved: $accessToken');
  }

  String? get accessToken {
    // Simulate fetching access token from Hive
    return 'sample_access_token';
  }
}
