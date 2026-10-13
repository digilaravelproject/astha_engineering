import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:astha_engineering/features/admin/renewals_master/domain/usecases/get_renewals.dart';
import 'package:astha_engineering/features/admin/renewals_master/presentation/bloc/renewal_list_event.dart';
import 'package:astha_engineering/features/admin/renewals_master/presentation/bloc/renewal_list_state.dart';

class RenewalListBloc extends Bloc<RenewalListEvent, RenewalListState> {
  final GetRenewals getRenewals;

  RenewalListBloc({required this.getRenewals}) : super(RenewalListInitial()) {
    on<LoadRenewalList>(_onLoad);
  }

  Future<void> _onLoad(LoadRenewalList event, Emitter<RenewalListState> emit) async {
    emit(RenewalListLoading());
    final result = await getRenewals();
    result.fold(
      (failure) => emit(RenewalListError(failure.message)),
      (renewals) => emit(RenewalListLoaded(renewals)),
    );
  }
}
