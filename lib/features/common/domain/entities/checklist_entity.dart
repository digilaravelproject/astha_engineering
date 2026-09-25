import 'package:equatable/equatable.dart';

class ChecklistEntity extends Equatable {
  final String id;
  final String checklistNumber;
  final String checklistType; // New / Renewal
  final String equipmentId;
  final DateTime inspectionDate;
  
  // Test Details
  final String typeOfTest; // Visual / Load / Drop / Load & Drop
  final String testResult; // Fit For Use / Needs Repairs / Unfit For Use
  final String? loadTestWeight;
  
  // Validity
  final int validity;
  final String validityType; // Days / Months
  
  // Personnel
  final String inspectionEngineerId;
  final String? representativeName;
  final String? representativeEmail;
  final String? representativeSignatureUrl;
  
  // Extras
  final String? additionalInformation;
  final List<String> inspectionPictureUrls;
  final Map<String, dynamic> dynamicCheckpointsData; // JSON map for dynamic fields

  final String status;
  final DateTime createdAt;

  const ChecklistEntity({
    required this.id,
    required this.checklistNumber,
    required this.checklistType,
    required this.equipmentId,
    required this.inspectionDate,
    required this.typeOfTest,
    required this.testResult,
    this.loadTestWeight,
    required this.validity,
    required this.validityType,
    required this.inspectionEngineerId,
    this.representativeName,
    this.representativeEmail,
    this.representativeSignatureUrl,
    this.additionalInformation,
    this.inspectionPictureUrls = const [],
    this.dynamicCheckpointsData = const {},
    required this.status,
    required this.createdAt,
  });

  @override
  List<Object?> get props => [
        id,
        checklistNumber,
        checklistType,
        equipmentId,
        inspectionDate,
        typeOfTest,
        testResult,
        loadTestWeight,
        validity,
        validityType,
        inspectionEngineerId,
        representativeName,
        representativeEmail,
        representativeSignatureUrl,
        additionalInformation,
        inspectionPictureUrls,
        dynamicCheckpointsData,
        status,
        createdAt,
      ];
}
