import 'package:dartz/dartz.dart';
import 'package:astha_engineering/core/error/failures.dart';
import 'package:astha_engineering/features/common/certificate_management/domain/entities/certificate_entity.dart';

/// Customer can only VIEW certificates — no add/edit
abstract class CustomerCertificateRepository {
  Future<Either<Failure, List<CertificateEntity>>> getCertificatesForCustomer(String customerId);
  Future<Either<Failure, CertificateEntity>> getCertificateById(String id);
}
