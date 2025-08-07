import 'package:equatable/equatable.dart';
import 'package:flutter_getx_clean_architecture/core/domain/entity/entity.dart';

/// Tỉnh
class Province extends Equatable implements Entity {
  /// Mã tỉnh
  final String id;

  /// Tên tỉnh
  final String name;

  /// Mã hành chính
  final String code;

  const Province({
    required this.id,
    required this.name,
    required this.code,
  });

  @override
  List<Object?> get props => [id, name, code];
}
