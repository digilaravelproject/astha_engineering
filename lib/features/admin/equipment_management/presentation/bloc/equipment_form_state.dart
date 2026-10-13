import 'package:equatable/equatable.dart';
import 'package:astha_engineering/features/admin/equipment_management/domain/entities/equipment_entity.dart';

abstract class EquipmentFormState extends Equatable {
  const EquipmentFormState();
  @override
  List<Object?> get props => [];
}

class EquipmentFormInitial extends EquipmentFormState {}

class EquipmentFormPrefilled extends EquipmentFormState {
  final EquipmentEntity equipment;
  const EquipmentFormPrefilled(this.equipment);
  @override
  List<Object?> get props => [equipment];
}

class EquipmentFormLoading extends EquipmentFormState {}

class EquipmentFormSuccess extends EquipmentFormState {
  final String message;
  const EquipmentFormSuccess(this.message);
  @override
  List<Object?> get props => [message];
}

class EquipmentFormError extends EquipmentFormState {
  final String message;
  const EquipmentFormError(this.message);
  @override
  List<Object?> get props => [message];
}
