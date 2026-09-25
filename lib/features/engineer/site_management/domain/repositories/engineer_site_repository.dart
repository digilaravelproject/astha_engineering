import 'package:dartz/dartz.dart';
import 'package:safecheck_techno/core/error/failures.dart';
import 'package:safecheck_techno/features/admin/site_management/domain/entities/site_entity.dart';
import 'package:safecheck_techno/features/admin/equipment_management/domain/entities/equipment_entity.dart';

/// Engineer views assigned sites and their equipment
abstract class EngineerSiteRepository {
  Future<Either<Failure, List<SiteEntity>>> getAssignedSites(String engineerId);
  Future<Either<Failure, List<EquipmentEntity>>> getEquipmentsForSite(String siteId);
}
