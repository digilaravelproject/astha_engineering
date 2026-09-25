import 'package:equatable/equatable.dart';

class CertificateEntity extends Equatable {
  final String id;
  final String equipmentId;
  final String certificateNumber;
  final DateTime issueDate;
  final DateTime expiryDate;
  final String pdfUrl;
  final String status;
  final DateTime createdAt;

  const CertificateEntity({
    required this.id,
    required this.equipmentId,
    required this.certificateNumber,
    required this.issueDate,
    required this.expiryDate,
    required this.pdfUrl,
    required this.status,
    required this.createdAt,
  });

  @override
  List<Object?> get props => [id, equipmentId, certificateNumber, issueDate, expiryDate, pdfUrl, status, createdAt];
}
