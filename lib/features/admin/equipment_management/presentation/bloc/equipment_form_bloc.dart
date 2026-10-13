import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:astha_engineering/features/admin/equipment_management/domain/usecases/add_equipment.dart';
import 'package:astha_engineering/features/admin/equipment_management/domain/usecases/update_equipment.dart';
import 'package:astha_engineering/features/admin/equipment_management/presentation/bloc/equipment_form_event.dart';
import 'package:astha_engineering/features/admin/equipment_management/presentation/bloc/equipment_form_state.dart';

class EquipmentFormBloc extends Bloc<EquipmentFormEvent, EquipmentFormState> {
  final AddEquipment addEquipment;
  final UpdateEquipment updateEquipment;

  EquipmentFormBloc({
    required this.addEquipment,
    required this.updateEquipment,
  }) : super(EquipmentFormInitial()) {
    on<LoadEquipmentForEdit>(_onLoadForEdit);
    on<SaveEquipment>(_onSaveEquipment);
  }

  void _onLoadForEdit(LoadEquipmentForEdit event, Emitter<EquipmentFormState> emit) {
    emit(EquipmentFormPrefilled(event.equipment));
  }

  Future<void> _onSaveEquipment(SaveEquipment event, Emitter<EquipmentFormState> emit) async {
    emit(EquipmentFormLoading());
    try {
      final isEdit = event.equipment.id.isNotEmpty;
      final result = isEdit
          ? await updateEquipment(event.equipment)
          : await addEquipment(event.equipment);

      result.fold(
        (failure) => emit(EquipmentFormError(failure.message)),
        (_) => emit(EquipmentFormSuccess(
          isEdit ? 'Equipment updated successfully' : 'Equipment added successfully',
        )),
      );
    } catch (e) {
      emit(EquipmentFormError(e.toString()));
    }
  }
}
