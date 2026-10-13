import 'package:dartz/dartz.dart';
import 'package:astha_engineering/core/error/failures.dart';
import 'package:astha_engineering/features/common/certificate_management/domain/entities/certificate_entity.dart';

abstract class CertificateRepository {
  Future<Either<Failure, List<CertificateEntity>>> getCertificates();
  Future<Either<Failure, List<CertificateEntity>>> getCertificatesByCustomerId(String customerId);
  Future<Either<Failure, List<CertificateEntity>>> getCertificatesBySiteId(String siteId);
  Future<Either<Failure, CertificateEntity>> getCertificateById(String id);
  Future<Either<Failure, void>> generateCertificate(String checklistId);
}
