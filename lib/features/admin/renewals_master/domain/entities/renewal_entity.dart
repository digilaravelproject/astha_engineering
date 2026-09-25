import 'package:equatable/equatable.dart';

class RenewalEntity extends Equatable {
  final String id;
  final String equipmentId;
  final String siteId;
  final String customerId;
  final String certificateId;
  final DateTime dueDate;
  final String status; // Pending, Overdue, Completed
  final String? reminderSentAt;

  const RenewalEntity({
    required this.id,
    required this.equipmentId,
    required this.siteId,
    required this.customerId,
    required this.certificateId,
    required this.dueDate,
    required this.status,
    this.reminderSentAt,
  });

  @override
  List<Object?> get props => [
        id, equipmentId, siteId, customerId,
        certificateId, dueDate, status, reminderSentAt,
      ];
}
