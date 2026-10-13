import 'package:dartz/dartz.dart';
import 'package:astha_engineering/core/error/failures.dart';
import 'package:astha_engineering/features/common/checklist_management/domain/entities/checklist_entity.dart';

abstract class ChecklistRepository {
  Future<Either<Failure, List<ChecklistEntity>>> getChecklists();
  Future<Either<Failure, List<ChecklistEntity>>> getChecklistsByEquipmentId(String equipmentId);
  Future<Either<Failure, ChecklistEntity>> getChecklistById(String id);
  Future<Either<Failure, void>> addChecklist(ChecklistEntity checklist);
  Future<Either<Failure, void>> updateChecklist(ChecklistEntity checklist);
}
