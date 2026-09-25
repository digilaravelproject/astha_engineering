import 'package:dartz/dartz.dart';
import 'package:safecheck_techno/core/error/failures.dart';
import 'package:safecheck_techno/features/common/certificate_management/domain/entities/certificate_entity.dart';

abstract class CertificateRepository {
  Future<Either<Failure, List<CertificateEntity>>> getCertificates();
  Future<Either<Failure, List<CertificateEntity>>> getCertificatesByCustomerId(String customerId);
  Future<Either<Failure, List<CertificateEntity>>> getCertificatesBySiteId(String siteId);
  Future<Either<Failure, CertificateEntity>> getCertificateById(String id);
  Future<Either<Failure, void>> generateCertificate(String checklistId);
}
