import 'package:astha_engineering/features/admin/renewals_master/domain/entities/renewal_entity.dart';

class RenewalModel extends RenewalEntity {
  const RenewalModel({
    required super.id,
    required super.equipmentId,
    required super.siteId,
    required super.customerId,
    required super.certificateId,
    required super.dueDate,
    required super.status,
    super.reminderSentAt,
  });

  factory RenewalModel.fromJson(Map<String, dynamic> json) {
    return RenewalModel(
      id: json['id'] as String,
      equipmentId: json['equipmentId'] as String,
      siteId: json['siteId'] as String,
      customerId: json['customerId'] as String,
      certificateId: json['certificateId'] as String,
      dueDate: DateTime.parse(json['dueDate'] as String),
      status: json['status'] as String? ?? 'Pending',
      reminderSentAt: json['reminderSentAt'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'equipmentId': equipmentId,
        'siteId': siteId,
        'customerId': customerId,
        'certificateId': certificateId,
        'dueDate': dueDate.toIso8601String(),
        'status': status,
        'reminderSentAt': reminderSentAt,
      };
}
