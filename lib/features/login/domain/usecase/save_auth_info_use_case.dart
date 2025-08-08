import 'package:flutter_getx_clean_architecture/core/data/data_source/local/app_hive.dart';
import 'package:flutter_getx_clean_architecture/core/data/data_source/local/hive_keys.dart';
import 'package:flutter_getx_clean_architecture/core/domain/usecase/base_use_case.dart';

class SaveAuthInfoUseCase extends UseCase<SaveAuthInfoUseCaseInput, void> {
  final AppHive _appHive;

  SaveAuthInfoUseCase(this._appHive);

  @override
  Future<void> execute(SaveAuthInfoUseCaseInput input) {
    return Future.wait([
      _appHive.put(HiveKeys.keyUsername, input.username),
      _appHive.put(HiveKeys.keyJwtToken, input.accessToken),
    ]);
  }
}

class SaveAuthInfoUseCaseInput {
  final String username;
  final String accessToken;

  SaveAuthInfoUseCaseInput({
    required this.username,
    required this.accessToken,
  });
}
