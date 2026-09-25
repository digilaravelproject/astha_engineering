import 'package:dartz/dartz.dart';
import 'package:safecheck_techno/core/error/failures.dart';
import 'package:safecheck_techno/features/common/certificate_management/domain/entities/certificate_entity.dart';

/// Engineer views certificates they generated
abstract class EngineerInspectionHistoryRepository {
  Future<Either<Failure, List<CertificateEntity>>> getCertificatesByEngineer(String engineerId);
  Future<Either<Failure, CertificateEntity>> getCertificateById(String id);
}
