import 'package:envied/envied.dart';

part 'env_dev.g.dart';

@Envied(path: 'lib/env/.env.dev')
abstract class EnvDev {
  @EnviedField(varName: 'BASE_URL', obfuscate: false)
  static const String baseUrl = _EnvDev.baseUrl;
}
