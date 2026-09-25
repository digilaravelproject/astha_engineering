import 'package:equatable/equatable.dart';
import 'package:safecheck_techno/features/admin/equipment_management/domain/entities/equipment_entity.dart';

abstract class EquipmentListState extends Equatable {
  const EquipmentListState();
  
  @override
  List<Object> get props => [];
}

class EquipmentListInitial extends EquipmentListState {}
class EquipmentListLoading extends EquipmentListState {}
class EquipmentListLoaded extends EquipmentListState {
  final List<EquipmentEntity> equipments; 
  const EquipmentListLoaded(this.equipments);
  
  @override
  List<Object> get props => [equipments];
}
class EquipmentListError extends EquipmentListState {
  final String message;
  const EquipmentListError(this.message);
  
  @override
  List<Object> get props => [message];
}
