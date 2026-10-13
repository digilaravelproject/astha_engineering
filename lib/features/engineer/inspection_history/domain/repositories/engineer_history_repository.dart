import 'package:dartz/dartz.dart';
import 'package:astha_engineering/core/error/failures.dart';
import 'package:astha_engineering/features/common/certificate_management/domain/entities/certificate_entity.dart';

/// Engineer views certificates they generated
abstract class EngineerInspectionHistoryRepository {
  Future<Either<Failure, List<CertificateEntity>>> getCertificatesByEngineer(String engineerId);
  Future<Either<Failure, CertificateEntity>> getCertificateById(String id);
}
