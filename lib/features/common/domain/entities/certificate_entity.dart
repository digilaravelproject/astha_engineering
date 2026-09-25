import 'package:equatable/equatable.dart';

class CertificateEntity extends Equatable {
  final String id;
  final String certificateNumber;
  final String checklistId; // Linked to the checklist that generated this
  final String customerId; // Denormalized for easier querying
  final String siteId; // Denormalized for easier querying
  final String equipmentId; // Denormalized for easier querying
  
  final DateTime issueDate;
  final DateTime validUptoDate;
  final String pdfUrl; // Path or URL to the generated A4 PDF
  
  final String status; // Active, Expired, Revoked, etc.
  final DateTime createdAt;

  const CertificateEntity({
    required this.id,
    required this.certificateNumber,
    required this.checklistId,
    required this.customerId,
    required this.siteId,
    required this.equipmentId,
    required this.issueDate,
    required this.validUptoDate,
    required this.pdfUrl,
    required this.status,
    required this.createdAt,
  });

  @override
  List<Object?> get props => [
        id,
        certificateNumber,
        checklistId,
        customerId,
        siteId,
        equipmentId,
        issueDate,
        validUptoDate,
        pdfUrl,
        status,
        createdAt,
      ];
}
