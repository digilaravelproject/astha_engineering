import 'package:astha_engineering/features/admin/reports_master/domain/entities/report_entity.dart';

class ReportModel extends ReportEntity {
  const ReportModel({
    required super.id,
    required super.reportType,
    required super.title,
    required super.generatedAt,
    required super.fromDate,
    required super.toDate,
    super.customerId,
    super.siteId,
    required super.pdfUrl,
  });

  factory ReportModel.fromJson(Map<String, dynamic> json) {
    return ReportModel(
      id: json['id'] as String,
      reportType: json['reportType'] as String,
      title: json['title'] as String,
      generatedAt: DateTime.parse(json['generatedAt'] as String),
      fromDate: DateTime.parse(json['fromDate'] as String),
      toDate: DateTime.parse(json['toDate'] as String),
      customerId: json['customerId'] as String?,
      siteId: json['siteId'] as String?,
      pdfUrl: json['pdfUrl'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'reportType': reportType,
        'title': title,
        'generatedAt': generatedAt.toIso8601String(),
        'fromDate': fromDate.toIso8601String(),
        'toDate': toDate.toIso8601String(),
        'customerId': customerId,
        'siteId': siteId,
        'pdfUrl': pdfUrl,
      };
}
