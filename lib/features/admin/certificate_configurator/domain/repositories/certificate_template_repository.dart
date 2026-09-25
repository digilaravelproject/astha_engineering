import 'package:dartz/dartz.dart';
import 'package:safecheck_techno/core/error/failures.dart';
import 'package:safecheck_techno/features/admin/certificate_configurator/domain/entities/certificate_template_entity.dart';

abstract class CertificateTemplateRepository {
  Future<Either<Failure, List<CertificateTemplateEntity>>> getTemplates();
  Future<Either<Failure, CertificateTemplateEntity>> getTemplateById(String id);
  Future<Either<Failure, void>> saveTemplate(CertificateTemplateEntity template);
  Future<Either<Failure, void>> deleteTemplate(String id);
}
