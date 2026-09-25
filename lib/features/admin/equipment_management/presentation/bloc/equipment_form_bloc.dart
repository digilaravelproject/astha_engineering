import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safecheck_techno/features/admin/equipment_management/presentation/bloc/equipment_form_event.dart';
import 'package:safecheck_techno/features/admin/equipment_management/presentation/bloc/equipment_form_state.dart';

class EquipmentFormBloc extends Bloc<EquipmentFormEvent, EquipmentFormState> {
  EquipmentFormBloc() : super(EquipmentFormInitial()) {
    on<LoadEquipmentForEdit>(_onLoadForEdit);
    on<SaveEquipment>(_onSaveEquipment);
  }

  void _onLoadForEdit(LoadEquipmentForEdit event, Emitter<EquipmentFormState> emit) {
    emit(EquipmentFormPrefilled(event.equipment));
  }

  Future<void> _onSaveEquipment(SaveEquipment event, Emitter<EquipmentFormState> emit) async {
    emit(EquipmentFormLoading());
    try {
      // TODO: Inject and call AddEquipmentUseCase or UpdateEquipmentUseCase
      await Future.delayed(const Duration(seconds: 1));
      emit(const EquipmentFormSuccess('Equipment saved successfully'));
    } catch (e) {
      emit(EquipmentFormError(e.toString()));
    }
  }
}
