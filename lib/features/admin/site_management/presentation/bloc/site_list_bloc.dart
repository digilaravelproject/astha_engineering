import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safecheck_techno/features/admin/site_management/domain/usecases/get_sites.dart';

import 'site_list_event.dart';
import 'site_list_state.dart';

class SiteListBloc extends Bloc<SiteListEvent, SiteListState> {
  final GetSites getSites;

  SiteListBloc({required this.getSites}) : super(SiteListInitial()) {
    on<LoadSiteList>(_onLoadSiteList);
  }

  Future<void> _onLoadSiteList(LoadSiteList event, Emitter<SiteListState> emit) async {
    emit(SiteListLoading());
    final result = await getSites();
    result.fold(
      (failure) => emit(SiteListError(failure.message)),
      (sites) => emit(SiteListLoaded(sites)),
    );
  }
}
