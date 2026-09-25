import 'package:dartz/dartz.dart';
import 'package:safecheck_techno/core/error/failures.dart';
import 'package:safecheck_techno/features/admin/equipment_management/domain/entities/equipment_entity.dart';
import 'package:safecheck_techno/features/admin/equipment_management/domain/repositories/equipment_repository.dart';

class UpdateEquipment {
  final EquipmentRepository repository;
  UpdateEquipment(this.repository);

  Future<Either<Failure, void>> call(EquipmentEntity equipment) async {
    return await repository.updateEquipment(equipment);
  }
}
