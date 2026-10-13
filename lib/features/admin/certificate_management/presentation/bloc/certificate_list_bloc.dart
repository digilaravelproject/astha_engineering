import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:astha_engineering/features/admin/certificate_management/domain/usecases/get_certificates.dart';

import 'certificate_list_event.dart';
import 'certificate_list_state.dart';

class CertificateListBloc extends Bloc<CertificateListEvent, CertificateListState> {
  final GetCertificates getCertificates;

  CertificateListBloc({required this.getCertificates}) : super(CertificateListInitial()) {
    on<LoadCertificateList>(_onLoadCertificateList);
  }

  Future<void> _onLoadCertificateList(LoadCertificateList event, Emitter<CertificateListState> emit) async {
    emit(CertificateListLoading());
    final result = await getCertificates();
    result.fold(
      (failure) => emit(CertificateListError(failure.message)),
      (certificates) => emit(CertificateListLoaded(certificates)),
    );
  }
}
