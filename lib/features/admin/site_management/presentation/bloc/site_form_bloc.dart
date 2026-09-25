import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safecheck_techno/features/admin/site_management/domain/usecases/add_site.dart';
import 'package:safecheck_techno/features/admin/site_management/domain/usecases/update_site.dart';
import 'package:safecheck_techno/features/admin/site_management/presentation/bloc/site_form_event.dart';
import 'package:safecheck_techno/features/admin/site_management/presentation/bloc/site_form_state.dart';

class SiteFormBloc extends Bloc<SiteFormEvent, SiteFormState> {
  final AddSite addSite;
  final UpdateSite updateSite;

  SiteFormBloc({
    required this.addSite,
    required this.updateSite,
  }) : super(SiteFormInitial()) {
    on<LoadSiteForEdit>(_onLoadForEdit);
    on<SaveSite>(_onSaveSite);
  }

  void _onLoadForEdit(LoadSiteForEdit event, Emitter<SiteFormState> emit) {
    emit(SiteFormPrefilled(event.site));
  }

  Future<void> _onSaveSite(SaveSite event, Emitter<SiteFormState> emit) async {
    emit(SiteFormLoading());
    try {
      final isEdit = event.site.id.isNotEmpty;
      final result = isEdit
          ? await updateSite(event.site)
          : await addSite(event.site);

      result.fold(
        (failure) => emit(SiteFormError(failure.message)),
        (_) => emit(SiteFormSuccess(
          isEdit ? 'Site updated successfully' : 'Site added successfully',
        )),
      );
    } catch (e) {
      emit(SiteFormError(e.toString()));
    }
  }
}
