import 'package:dartz/dartz.dart';
import 'package:astha_engineering/core/error/failures.dart';
import 'package:astha_engineering/features/admin/site_management/domain/entities/site_entity.dart';

abstract class SiteRepository {
  Future<Either<Failure, List<SiteEntity>>> getSites();
  Future<Either<Failure, List<SiteEntity>>> getSitesByCustomerId(String customerId);
  Future<Either<Failure, SiteEntity>> getSiteById(String id);
  Future<Either<Failure, void>> addSite(SiteEntity site);
  Future<Either<Failure, void>> updateSite(SiteEntity site);
  Future<Either<Failure, void>> deleteSite(String id);
}
