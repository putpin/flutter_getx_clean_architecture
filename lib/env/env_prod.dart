import 'package:envied/envied.dart';

part 'env_prod.g.dart';

@Envied(path: 'lib/env/.env.prod')
abstract class EnvProd {
  @EnviedField(varName: 'BASE_URL', obfuscate: true)
  static final String baseUrl = _EnvProd.baseUrl;
}
