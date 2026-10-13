import 'package:dartz/dartz.dart';
import 'package:astha_engineering/core/error/failures.dart';
import 'package:astha_engineering/features/admin/certificate_management/domain/entities/certificate_entity.dart';

abstract class CertificateRepository {
  Future<Either<Failure, List<CertificateEntity>>> getCertificates();
}
