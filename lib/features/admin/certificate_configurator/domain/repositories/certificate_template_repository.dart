import 'package:dartz/dartz.dart';
import 'package:astha_engineering/core/error/failures.dart';
import 'package:astha_engineering/features/admin/certificate_configurator/domain/entities/certificate_template_entity.dart';

abstract class CertificateTemplateRepository {
  Future<Either<Failure, List<CertificateTemplateEntity>>> getTemplates();
  Future<Either<Failure, CertificateTemplateEntity>> getTemplateById(String id);
  Future<Either<Failure, void>> saveTemplate(CertificateTemplateEntity template);
  Future<Either<Failure, void>> deleteTemplate(String id);
}
