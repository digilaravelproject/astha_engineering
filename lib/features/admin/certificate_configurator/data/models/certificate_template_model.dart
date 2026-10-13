import 'package:astha_engineering/features/admin/certificate_configurator/domain/entities/certificate_template_entity.dart';

class CertificateTemplateModel extends CertificateTemplateEntity {
  const CertificateTemplateModel({
    required super.id,
    required super.templateName,
    required super.equipmentType,
    required super.headerContent,
    required super.footerContent,
    required super.visibleFields,
    required super.showQrCode,
    required super.isActive,
  });

  factory CertificateTemplateModel.fromJson(Map<String, dynamic> json) {
    return CertificateTemplateModel(
      id: json['id'] as String,
      templateName: json['templateName'] as String,
      equipmentType: json['equipmentType'] as String? ?? 'General',
      headerContent: json['headerContent'] as String? ?? '',
      footerContent: json['footerContent'] as String? ?? '',
      visibleFields: (json['visibleFields'] as List<dynamic>?)?.map((e) => e.toString()).toList() ?? [],
      showQrCode: json['showQrCode'] as bool? ?? true,
      isActive: json['isActive'] as bool? ?? true,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'templateName': templateName,
        'equipmentType': equipmentType,
        'headerContent': headerContent,
        'footerContent': footerContent,
        'visibleFields': visibleFields,
        'showQrCode': showQrCode,
        'isActive': isActive,
      };
}
