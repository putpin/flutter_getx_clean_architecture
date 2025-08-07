import 'package:flutter_getx_clean_architecture/shared/entity/province.dart';
import 'package:flutter_getx_clean_architecture/shared/model/province_data.dart';
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
