import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safecheck_techno/features/admin/equipment_management/domain/usecases/get_equipments.dart';

import 'equipment_list_event.dart';
import 'equipment_list_state.dart';

class EquipmentListBloc extends Bloc<EquipmentListEvent, EquipmentListState> {
  final GetEquipments getEquipments;

  EquipmentListBloc({required this.getEquipments}) : super(EquipmentListInitial()) {
    on<LoadEquipmentList>(_onLoadEquipmentList);
  }

  Future<void> _onLoadEquipmentList(LoadEquipmentList event, Emitter<EquipmentListState> emit) async {
    emit(EquipmentListLoading());
    final result = await getEquipments();
    result.fold(
      (failure) => emit(EquipmentListError(failure.message)),
      (equipments) => emit(EquipmentListLoaded(equipments)),
    );
  }
}
