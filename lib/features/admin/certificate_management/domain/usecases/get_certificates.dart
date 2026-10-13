import 'package:dartz/dartz.dart';
import 'package:astha_engineering/core/error/failures.dart';
import 'package:astha_engineering/features/admin/certificate_management/domain/entities/certificate_entity.dart';
import 'package:astha_engineering/features/admin/certificate_management/domain/repositories/certificate_repository.dart';

class GetCertificates {
  final CertificateRepository repository;

  GetCertificates(this.repository);

  Future<Either<Failure, List<CertificateEntity>>> call() async {
    return await repository.getCertificates();
  }
}
