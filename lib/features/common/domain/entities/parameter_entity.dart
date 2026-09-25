import 'package:equatable/equatable.dart';

class ParameterEntity extends Equatable {
  final String id;
  final String parameterType; // 'Equipment', 'Inspection', or 'Certificate'
  final String parameterName;
  final String fieldType; // Number, Text, Date, Dropdown, Radio, Checkbox, Image, Signature
  final String? unit; // kg, ton, bar, °C, etc. (Optional)
  final bool isRequired;
  final bool isActive;
  final int sortOrder;
  final List<String>? dropdownOptions; // For Dropdown/Radio/Checkbox fields

  const ParameterEntity({
    required this.id,
    required this.parameterType,
    required this.parameterName,
    required this.fieldType,
    this.unit,
    required this.isRequired,
    required this.isActive,
    required this.sortOrder,
    this.dropdownOptions,
  });

  @override
  List<Object?> get props => [
        id,
        parameterType,
        parameterName,
        fieldType,
        unit,
        isRequired,
        isActive,
        sortOrder,
        dropdownOptions,
      ];
}
