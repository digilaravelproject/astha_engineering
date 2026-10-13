import 'package:dartz/dartz.dart';
import 'package:astha_engineering/core/error/failures.dart';
import 'package:astha_engineering/features/admin/equipment_management/domain/entities/equipment_entity.dart';
import 'package:astha_engineering/features/admin/equipment_management/domain/repositories/equipment_repository.dart';

class GetEquipments {
  final EquipmentRepository repository;

  GetEquipments(this.repository);

  Future<Either<Failure, List<EquipmentEntity>>> call() async {
    return await repository.getEquipments();
  }
}
