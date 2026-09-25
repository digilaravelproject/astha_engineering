import 'package:dartz/dartz.dart';
import 'package:safecheck_techno/core/error/failures.dart';
import 'package:safecheck_techno/features/admin/equipment_management/domain/entities/equipment_entity.dart';
import 'package:safecheck_techno/features/admin/equipment_management/domain/repositories/equipment_repository.dart';

class GetEquipments {
  final EquipmentRepository repository;

  GetEquipments(this.repository);

  Future<Either<Failure, List<EquipmentEntity>>> call() async {
    return await repository.getEquipments();
  }
}
