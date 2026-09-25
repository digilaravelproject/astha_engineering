import 'package:safecheck_techno/features/common/domain/entities/certificate_entity.dart';

class CertificateModel extends CertificateEntity {
  const CertificateModel({
    required super.id,
    required super.certificateNumber,
    required super.checklistId,
    required super.customerId,
    required super.siteId,
    required super.equipmentId,
    required super.issueDate,
    required super.validUptoDate,
    required super.pdfUrl,
    required super.status,
    required super.createdAt,
  });

  factory CertificateModel.fromJson(Map<String, dynamic> json) {
    return CertificateModel(
      id: json['id'] as String,
      certificateNumber: json['certificateNumber'] as String,
      checklistId: json['checklistId'] as String,
      customerId: json['customerId'] as String,
      siteId: json['siteId'] as String,
      equipmentId: json['equipmentId'] as String,
      issueDate: DateTime.parse(json['issueDate'] as String),
      validUptoDate: DateTime.parse(json['validUptoDate'] as String),
      pdfUrl: json['pdfUrl'] as String? ?? '',
      status: json['status'] as String? ?? 'Active',
      createdAt: DateTime.parse(json['createdAt'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'certificateNumber': certificateNumber,
      'checklistId': checklistId,
      'customerId': customerId,
      'siteId': siteId,
      'equipmentId': equipmentId,
      'issueDate': issueDate.toIso8601String(),
      'validUptoDate': validUptoDate.toIso8601String(),
      'pdfUrl': pdfUrl,
      'status': status,
      'createdAt': createdAt.toIso8601String(),
    };
  }
}
