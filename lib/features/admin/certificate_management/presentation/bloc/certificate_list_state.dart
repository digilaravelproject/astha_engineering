import 'package:equatable/equatable.dart';
import 'package:safecheck_techno/features/admin/certificate_management/domain/entities/certificate_entity.dart';

abstract class CertificateListState extends Equatable {
  const CertificateListState();
  
  @override
  List<Object> get props => [];
}

class CertificateListInitial extends CertificateListState {}
class CertificateListLoading extends CertificateListState {}
class CertificateListLoaded extends CertificateListState {
  final List<CertificateEntity> certificates; 
  const CertificateListLoaded(this.certificates);
  
  @override
  List<Object> get props => [certificates];
}
class CertificateListError extends CertificateListState {
  final String message;
  const CertificateListError(this.message);
  
  @override
  List<Object> get props => [message];
}
