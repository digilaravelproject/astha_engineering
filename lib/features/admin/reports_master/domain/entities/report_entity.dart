import 'package:equatable/equatable.dart';

class ReportEntity extends Equatable {
  final String id;
  final String reportType; // Inspection Summary, Certificate Expiry, Customer Activity
  final String title;
  final DateTime generatedAt;
  final DateTime fromDate;
  final DateTime toDate;
  final String? customerId;
  final String? siteId;
  final String pdfUrl;

  const ReportEntity({
    required this.id,
    required this.reportType,
    required this.title,
    required this.generatedAt,
    required this.fromDate,
    required this.toDate,
    this.customerId,
    this.siteId,
    required this.pdfUrl,
  });

  @override
  List<Object?> get props => [
        id, reportType, title, generatedAt,
        fromDate, toDate, customerId, siteId, pdfUrl,
      ];
}
