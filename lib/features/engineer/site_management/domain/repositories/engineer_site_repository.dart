import 'package:dartz/dartz.dart';
import 'package:astha_engineering/core/error/failures.dart';
import 'package:astha_engineering/features/admin/site_management/domain/entities/site_entity.dart';
import 'package:astha_engineering/features/admin/equipment_management/domain/entities/equipment_entity.dart';

/// Engineer views assigned sites and their equipment
abstract class EngineerSiteRepository {
  Future<Either<Failure, List<SiteEntity>>> getAssignedSites(String engineerId);
  Future<Either<Failure, List<EquipmentEntity>>> getEquipmentsForSite(String siteId);
}
