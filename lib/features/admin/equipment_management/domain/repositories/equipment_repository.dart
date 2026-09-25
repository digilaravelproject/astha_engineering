import 'package:dartz/dartz.dart';
import 'package:safecheck_techno/core/error/failures.dart';
import 'package:safecheck_techno/features/admin/equipment_management/domain/entities/equipment_entity.dart';

abstract class EquipmentRepository {
  Future<Either<Failure, List<EquipmentEntity>>> getEquipments();
  Future<Either<Failure, List<EquipmentEntity>>> getEquipmentsBySiteId(String siteId);
  Future<Either<Failure, EquipmentEntity>> getEquipmentById(String id);
  Future<Either<Failure, void>> addEquipment(EquipmentEntity equipment);
  Future<Either<Failure, void>> updateEquipment(EquipmentEntity equipment);
  Future<Either<Failure, void>> deleteEquipment(String id);
}
