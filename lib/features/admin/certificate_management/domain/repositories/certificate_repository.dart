import 'package:dartz/dartz.dart';
import 'package:safecheck_techno/core/error/failures.dart';
import 'package:safecheck_techno/features/admin/certificate_management/domain/entities/certificate_entity.dart';

abstract class CertificateRepository {
  Future<Either<Failure, List<CertificateEntity>>> getCertificates();
}
