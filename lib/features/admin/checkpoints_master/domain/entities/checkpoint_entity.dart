import 'package:equatable/equatable.dart';

class CheckpointEntity extends Equatable {
  final String id;
  final String name;
  final String? description;
  final String equipmentType; // Which type of equipment this checkpoint belongs to
  final String fieldType;     // Text, Number, Dropdown, Checkbox, Radio, Image, Signature
  final List<String>? dropdownOptions;
  final String? unit;
  final bool isRequired;
  final bool isActive;
  final int sortOrder;

  const CheckpointEntity({
    required this.id,
    required this.name,
    this.description,
    required this.equipmentType,
    required this.fieldType,
    this.dropdownOptions,
    this.unit,
    required this.isRequired,
    required this.isActive,
    required this.sortOrder,
  });

  @override
  List<Object?> get props => [
        id, name, description, equipmentType, fieldType,
        dropdownOptions, unit, isRequired, isActive, sortOrder,
      ];
}
