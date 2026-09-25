import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safecheck_techno/features/admin/site_management/presentation/bloc/site_form_event.dart';
import 'package:safecheck_techno/features/admin/site_management/presentation/bloc/site_form_state.dart';

class SiteFormBloc extends Bloc<SiteFormEvent, SiteFormState> {
  SiteFormBloc() : super(SiteFormInitial()) {
    on<LoadSiteForEdit>(_onLoadForEdit);
    on<SaveSite>(_onSaveSite);
  }

  void _onLoadForEdit(LoadSiteForEdit event, Emitter<SiteFormState> emit) {
    emit(SiteFormPrefilled(event.site));
  }

  Future<void> _onSaveSite(SaveSite event, Emitter<SiteFormState> emit) async {
    emit(SiteFormLoading());
    try {
      // TODO: Inject and call AddSiteUseCase or UpdateSiteUseCase
      await Future.delayed(const Duration(seconds: 1));
      emit(const SiteFormSuccess('Site saved successfully'));
    } catch (e) {
      emit(SiteFormError(e.toString()));
    }
  }
}
