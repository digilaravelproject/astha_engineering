import 'package:safecheck_techno/features/common/checklist_management/domain/entities/checklist_entity.dart';

class ChecklistModel extends ChecklistEntity {
  const ChecklistModel({
    required super.id,
    required super.checklistNumber,
    required super.checklistType,
    required super.equipmentId,
    required super.inspectionDate,
    required super.typeOfTest,
    required super.testResult,
    super.loadTestWeight,
    required super.validity,
    required super.validityType,
    required super.inspectionEngineerId,
    super.representativeName,
    super.representativeEmail,
    super.representativeSignatureUrl,
    super.additionalInformation,
    super.inspectionPictureUrls,
    super.dynamicCheckpointsData,
    required super.status,
    required super.createdAt,
  });

  factory ChecklistModel.fromJson(Map<String, dynamic> json) {
    return ChecklistModel(
      id: json['id'] as String,
      checklistNumber: json['checklistNumber'] as String? ?? '',
      checklistType: json['checklistType'] as String? ?? 'New',
      equipmentId: json['equipmentId'] as String,
      inspectionDate: DateTime.parse(json['inspectionDate'] as String),
      typeOfTest: json['typeOfTest'] as String? ?? '',
      testResult: json['testResult'] as String? ?? '',
      loadTestWeight: json['loadTestWeight'] as String?,
      validity: (json['validity'] as num?)?.toInt() ?? 12,
      validityType: json['validityType'] as String? ?? 'Months',
      inspectionEngineerId: json['inspectionEngineerId'] as String,
      representativeName: json['representativeName'] as String?,
      representativeEmail: json['representativeEmail'] as String?,
      representativeSignatureUrl: json['representativeSignatureUrl'] as String?,
      additionalInformation: json['additionalInformation'] as String?,
      inspectionPictureUrls: (json['inspectionPictureUrls'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      dynamicCheckpointsData: json['dynamicCheckpointsData'] as Map<String, dynamic>? ?? {},
      status: json['status'] as String? ?? 'Draft',
      createdAt: DateTime.parse(json['createdAt'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'checklistNumber': checklistNumber,
      'checklistType': checklistType,
      'equipmentId': equipmentId,
      'inspectionDate': inspectionDate.toIso8601String(),
      'typeOfTest': typeOfTest,
      'testResult': testResult,
      'loadTestWeight': loadTestWeight,
      'validity': validity,
      'validityType': validityType,
      'inspectionEngineerId': inspectionEngineerId,
      'representativeName': representativeName,
      'representativeEmail': representativeEmail,
      'representativeSignatureUrl': representativeSignatureUrl,
      'additionalInformation': additionalInformation,
      'inspectionPictureUrls': inspectionPictureUrls,
      'dynamicCheckpointsData': dynamicCheckpointsData,
      'status': status,
      'createdAt': createdAt.toIso8601String(),
    };
  }
}
