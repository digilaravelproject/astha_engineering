import 'package:astha_engineering/features/admin/checkpoints_master/domain/entities/checkpoint_entity.dart';

class CheckpointModel extends CheckpointEntity {
  const CheckpointModel({
    required super.id,
    required super.name,
    super.description,
    required super.equipmentType,
    required super.fieldType,
    super.dropdownOptions,
    super.unit,
    required super.isRequired,
    required super.isActive,
    required super.sortOrder,
  });

  factory CheckpointModel.fromJson(Map<String, dynamic> json) {
    return CheckpointModel(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String?,
      equipmentType: json['equipmentType'] as String? ?? 'General',
      fieldType: json['fieldType'] as String? ?? 'Text',
      dropdownOptions: (json['dropdownOptions'] as List<dynamic>?)?.map((e) => e.toString()).toList(),
      unit: json['unit'] as String?,
      isRequired: json['isRequired'] as bool? ?? false,
      isActive: json['isActive'] as bool? ?? true,
      sortOrder: (json['sortOrder'] as num?)?.toInt() ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
        'equipmentType': equipmentType,
        'fieldType': fieldType,
        'dropdownOptions': dropdownOptions,
        'unit': unit,
        'isRequired': isRequired,
        'isActive': isActive,
        'sortOrder': sortOrder,
      };
}
