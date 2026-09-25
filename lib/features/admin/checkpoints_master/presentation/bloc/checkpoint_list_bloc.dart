import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safecheck_techno/features/admin/checkpoints_master/domain/usecases/get_checkpoints.dart';
import 'package:safecheck_techno/features/admin/checkpoints_master/presentation/bloc/checkpoint_list_event.dart';
import 'package:safecheck_techno/features/admin/checkpoints_master/presentation/bloc/checkpoint_list_state.dart';

class CheckpointListBloc extends Bloc<CheckpointListEvent, CheckpointListState> {
  final GetCheckpoints getCheckpoints;

  CheckpointListBloc({required this.getCheckpoints}) : super(CheckpointListInitial()) {
    on<LoadCheckpointList>(_onLoad);
  }

  Future<void> _onLoad(LoadCheckpointList event, Emitter<CheckpointListState> emit) async {
    emit(CheckpointListLoading());
    final result = await getCheckpoints();
    result.fold(
      (failure) => emit(CheckpointListError(failure.message)),
      (checkpoints) => emit(CheckpointListLoaded(checkpoints)),
    );
  }
}
