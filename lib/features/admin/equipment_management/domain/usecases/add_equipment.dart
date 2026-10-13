import 'package:dartz/dartz.dart';
import 'package:astha_engineering/core/error/failures.dart';
import 'package:astha_engineering/features/admin/equipment_management/domain/entities/equipment_entity.dart';
import 'package:astha_engineering/features/admin/equipment_management/domain/repositories/equipment_repository.dart';

class AddEquipment {
  final EquipmentRepository repository;
  AddEquipment(this.repository);

  Future<Either<Failure, void>> call(EquipmentEntity equipment) async {
    return await repository.addEquipment(equipment);
  }
}
