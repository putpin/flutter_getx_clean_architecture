import 'package:flutter_getx_clean_architecture/core/data/model/province_data.dart';
import 'package:flutter_getx_clean_architecture/core/domain/entity/province.dart';
import 'package:flutter_getx_clean_architecture/shared/mappers/base/base_data_mapper.dart';

class ProvinceDataMapper extends BaseDataMapper<ProvinceData, Province> {
  @override
  Province mapToEntity(ProvinceData? data) {
    return Province(
      id: data?.id ?? '',
      name: data?.name ?? '',
      code: data?.code ?? '',
    );
  }
}
