import 'package:equatable/equatable.dart';

abstract class CertificateListEvent extends Equatable {
  const CertificateListEvent();
  
  @override
  List<Object> get props => [];
}

class LoadCertificateList extends CertificateListEvent {}
