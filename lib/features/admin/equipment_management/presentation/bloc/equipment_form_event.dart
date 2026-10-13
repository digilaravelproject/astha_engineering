import 'package:equatable/equatable.dart';
import 'package:astha_engineering/features/admin/equipment_management/domain/entities/equipment_entity.dart';

abstract class EquipmentFormEvent extends Equatable {
  const EquipmentFormEvent();
  @override
  List<Object?> get props => [];
}

class LoadEquipmentForEdit extends EquipmentFormEvent {
  final EquipmentEntity equipment;
  const LoadEquipmentForEdit(this.equipment);
  @override
  List<Object?> get props => [equipment];
}

class SaveEquipment extends EquipmentFormEvent {
  final EquipmentEntity equipment;
  const SaveEquipment(this.equipment);
  @override
  List<Object?> get props => [equipment];
}
