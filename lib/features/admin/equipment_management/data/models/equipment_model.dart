import 'package:safecheck_techno/features/admin/equipment_management/domain/entities/equipment_entity.dart';

class EquipmentModel extends EquipmentEntity {
  const EquipmentModel({
    required super.id,
    required super.siteId,
    required super.equipmentName,
    required super.equipmentShortName,
    required super.formType,
    required super.manufacturerMake,
    required super.model,
    required super.serialNumber,
    required super.equipmentNumber,
    required super.ratedCapacity,
    required super.swlCapacity,
    super.description,
    required super.status,
    super.remarks,
    super.inspectionParameterIds,
    super.certificatePointIds,
    required super.createdAt,
  });

  factory EquipmentModel.fromJson(Map<String, dynamic> json) {
    return EquipmentModel(
      id: json['id'] as String,
      siteId: json['siteId'] as String,
      equipmentName: json['equipmentName'] as String,
      equipmentShortName: json['equipmentShortName'] as String? ?? '',
      formType: json['formType'] as String? ?? '',
      manufacturerMake: json['manufacturerMake'] as String? ?? '',
      model: json['model'] as String? ?? '',
      serialNumber: json['serialNumber'] as String? ?? '',
      equipmentNumber: json['equipmentNumber'] as String? ?? '',
      ratedCapacity: (json['ratedCapacity'] as num?)?.toDouble() ?? 0.0,
      swlCapacity: (json['swlCapacity'] as num?)?.toDouble() ?? 0.0,
      description: json['description'] as String?,
      status: json['status'] as String? ?? 'Active',
      remarks: json['remarks'] as String?,
      inspectionParameterIds: (json['inspectionParameterIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      certificatePointIds: (json['certificatePointIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      createdAt: DateTime.parse(json['createdAt'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'siteId': siteId,
      'equipmentName': equipmentName,
      'equipmentShortName': equipmentShortName,
      'formType': formType,
      'manufacturerMake': manufacturerMake,
      'model': model,
      'serialNumber': serialNumber,
      'equipmentNumber': equipmentNumber,
      'ratedCapacity': ratedCapacity,
      'swlCapacity': swlCapacity,
      'description': description,
      'status': status,
      'remarks': remarks,
      'inspectionParameterIds': inspectionParameterIds,
      'certificatePointIds': certificatePointIds,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  factory EquipmentModel.fromEntity(EquipmentEntity entity) {
    return EquipmentModel(
      id: entity.id,
      siteId: entity.siteId,
      equipmentName: entity.equipmentName,
      equipmentShortName: entity.equipmentShortName,
      formType: entity.formType,
      manufacturerMake: entity.manufacturerMake,
      model: entity.model,
      serialNumber: entity.serialNumber,
      equipmentNumber: entity.equipmentNumber,
      ratedCapacity: entity.ratedCapacity,
      swlCapacity: entity.swlCapacity,
      description: entity.description,
      status: entity.status,
      remarks: entity.remarks,
      inspectionParameterIds: entity.inspectionParameterIds,
      certificatePointIds: entity.certificatePointIds,
      createdAt: entity.createdAt,
    );
  }
}
