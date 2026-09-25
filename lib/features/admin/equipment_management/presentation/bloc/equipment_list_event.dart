import 'package:equatable/equatable.dart';

abstract class EquipmentListEvent extends Equatable {
  const EquipmentListEvent();
  
  @override
  List<Object> get props => [];
}

class LoadEquipmentList extends EquipmentListEvent {}
