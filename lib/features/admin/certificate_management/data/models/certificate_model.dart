import 'package:safecheck_techno/features/admin/certificate_management/domain/entities/certificate_entity.dart';

class CertificateModel extends CertificateEntity {
  const CertificateModel({
    required super.id,
    required super.equipmentId,
    required super.certificateNumber,
    required super.issueDate,
    required super.expiryDate,
    required super.pdfUrl,
    required super.status,
    required super.createdAt,
  });

  factory CertificateModel.fromJson(Map<String, dynamic> json) {
    return CertificateModel(
      id: json['id'] as String,
      equipmentId: json['equipmentId'] as String,
      certificateNumber: json['certificateNumber'] as String,
      issueDate: DateTime.parse(json['issueDate'] as String),
      expiryDate: DateTime.parse(json['expiryDate'] as String),
      pdfUrl: json['pdfUrl'] as String,
      status: json['status'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'equipmentId': equipmentId,
      'certificateNumber': certificateNumber,
      'issueDate': issueDate.toIso8601String(),
      'expiryDate': expiryDate.toIso8601String(),
      'pdfUrl': pdfUrl,
      'status': status,
      'createdAt': createdAt.toIso8601String(),
    };
  }
}
