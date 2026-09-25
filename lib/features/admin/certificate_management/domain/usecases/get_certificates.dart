import 'package:dartz/dartz.dart';
import 'package:safecheck_techno/core/error/failures.dart';
import 'package:safecheck_techno/features/admin/certificate_management/domain/entities/certificate_entity.dart';
import 'package:safecheck_techno/features/admin/certificate_management/domain/repositories/certificate_repository.dart';

class GetCertificates {
  final CertificateRepository repository;

  GetCertificates(this.repository);

  Future<Either<Failure, List<CertificateEntity>>> call() async {
    return await repository.getCertificates();
  }
}
