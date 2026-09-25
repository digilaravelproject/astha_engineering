import 'package:equatable/equatable.dart';

class EquipmentEntity extends Equatable {
  final String id;
  final String siteId;
  final String equipmentName;
  final String equipmentShortName;
  final String formType;
  final String manufacturerMake;
  final String model;
  final String serialNumber;
  final String equipmentNumber;
  final double ratedCapacity;
  final double swlCapacity;
  final String? description;
  final String status;
  final String? remarks;
  // Note: Inspection Parameters and Certificate Points are dynamic and 
  // will be handled as JSON strings or separate list of parameter IDs.
  final List<String> inspectionParameterIds;
  final List<String> certificatePointIds;
  final DateTime createdAt;

  const EquipmentEntity({
    required this.id,
    required this.siteId,
    required this.equipmentName,
    required this.equipmentShortName,
    required this.formType,
    required this.manufacturerMake,
    required this.model,
    required this.serialNumber,
    required this.equipmentNumber,
    required this.ratedCapacity,
    required this.swlCapacity,
    this.description,
    required this.status,
    this.remarks,
    this.inspectionParameterIds = const [],
    this.certificatePointIds = const [],
    required this.createdAt,
  });

  EquipmentEntity copyWith({
    String? id,
    String? siteId,
    String? equipmentName,
    String? equipmentShortName,
    String? formType,
    String? manufacturerMake,
    String? model,
    String? serialNumber,
    String? equipmentNumber,
    double? ratedCapacity,
    double? swlCapacity,
    String? description,
    String? status,
    String? remarks,
    List<String>? inspectionParameterIds,
    List<String>? certificatePointIds,
    DateTime? createdAt,
  }) {
    return EquipmentEntity(
      id: id ?? this.id,
      siteId: siteId ?? this.siteId,
      equipmentName: equipmentName ?? this.equipmentName,
      equipmentShortName: equipmentShortName ?? this.equipmentShortName,
      formType: formType ?? this.formType,
      manufacturerMake: manufacturerMake ?? this.manufacturerMake,
      model: model ?? this.model,
      serialNumber: serialNumber ?? this.serialNumber,
      equipmentNumber: equipmentNumber ?? this.equipmentNumber,
      ratedCapacity: ratedCapacity ?? this.ratedCapacity,
      swlCapacity: swlCapacity ?? this.swlCapacity,
      description: description ?? this.description,
      status: status ?? this.status,
      remarks: remarks ?? this.remarks,
      inspectionParameterIds: inspectionParameterIds ?? this.inspectionParameterIds,
      certificatePointIds: certificatePointIds ?? this.certificatePointIds,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  List<Object?> get props => [
        id,
        siteId,
        equipmentName,
        equipmentShortName,
        formType,
        manufacturerMake,
        model,
        serialNumber,
        equipmentNumber,
        ratedCapacity,
        swlCapacity,
        description,
        status,
        remarks,
        inspectionParameterIds,
        certificatePointIds,
        createdAt,
      ];
}
