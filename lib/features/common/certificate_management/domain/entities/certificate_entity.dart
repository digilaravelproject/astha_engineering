import 'package:equatable/equatable.dart';

class CertificateEntity extends Equatable {
  final String id;
  final String certificateNumber;
  final String checklistId;
  final String customerId;
  final String siteId;
  final String equipmentId;
  final DateTime issueDate;
  final DateTime validUptoDate;
  final String pdfUrl;
  final String status;
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
        id, certificateNumber, checklistId, customerId, siteId, equipmentId,
        issueDate, validUptoDate, pdfUrl, status, createdAt,
      ];
}
