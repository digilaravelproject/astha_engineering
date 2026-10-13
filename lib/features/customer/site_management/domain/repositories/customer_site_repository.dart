import 'package:dartz/dartz.dart';
import 'package:astha_engineering/core/error/failures.dart';
import 'package:astha_engineering/features/admin/site_management/domain/entities/site_entity.dart';

/// Customer can only VIEW their own sites
abstract class CustomerSiteRepository {
  Future<Either<Failure, List<SiteEntity>>> getSitesForCustomer(String customerId);
  Future<Either<Failure, SiteEntity>> getSiteById(String id);
}
