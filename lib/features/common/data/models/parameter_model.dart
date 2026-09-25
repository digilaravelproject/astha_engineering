import 'package:safecheck_techno/features/common/domain/entities/parameter_entity.dart';

class ParameterModel extends ParameterEntity {
  const ParameterModel({
    required super.id,
    required super.parameterType,
    required super.parameterName,
    required super.fieldType,
    super.unit,
    required super.isRequired,
    required super.isActive,
    required super.sortOrder,
    super.dropdownOptions,
  });

  factory ParameterModel.fromJson(Map<String, dynamic> json) {
    return ParameterModel(
      id: json['id'] as String,
      parameterType: json['parameterType'] as String? ?? 'Inspection',
      parameterName: json['parameterName'] as String,
      fieldType: json['fieldType'] as String? ?? 'Text',
      unit: json['unit'] as String?,
      isRequired: json['isRequired'] as bool? ?? false,
      isActive: json['isActive'] as bool? ?? true,
      sortOrder: (json['sortOrder'] as num?)?.toInt() ?? 0,
      dropdownOptions: (json['dropdownOptions'] as List<dynamic>?)
          ?.map((e) => e.toString())
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'parameterType': parameterType,
      'parameterName': parameterName,
      'fieldType': fieldType,
      'unit': unit,
      'isRequired': isRequired,
      'isActive': isActive,
      'sortOrder': sortOrder,
      'dropdownOptions': dropdownOptions,
    };
  }
}
