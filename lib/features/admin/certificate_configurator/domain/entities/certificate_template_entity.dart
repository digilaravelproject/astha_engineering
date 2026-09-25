import 'package:equatable/equatable.dart';

class CertificateTemplateEntity extends Equatable {
  final String id;
  final String templateName;
  final String equipmentType;
  final String headerContent;    // Company name, logo path etc.
  final String footerContent;
  final List<String> visibleFields; // Which fields to show on certificate
  final bool showQrCode;
  final bool isActive;

  const CertificateTemplateEntity({
    required this.id,
    required this.templateName,
    required this.equipmentType,
    required this.headerContent,
    required this.footerContent,
    required this.visibleFields,
    required this.showQrCode,
    required this.isActive,
  });

  @override
  List<Object?> get props => [
        id, templateName, equipmentType, headerContent,
        footerContent, visibleFields, showQrCode, isActive,
      ];
}
