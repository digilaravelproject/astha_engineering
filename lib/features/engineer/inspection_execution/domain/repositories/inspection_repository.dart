import 'package:dartz/dartz.dart';
import 'package:astha_engineering/core/error/failures.dart';
import 'package:astha_engineering/features/common/checklist_management/domain/entities/checklist_entity.dart';

/// Engineer submits and views inspection checklists
abstract class InspectionRepository {
  Future<Either<Failure, List<ChecklistEntity>>> getInspectionsByEngineer(String engineerId);
  Future<Either<Failure, ChecklistEntity>> getInspectionById(String id);
  Future<Either<Failure, void>> submitInspection(ChecklistEntity checklist);
  Future<Either<Failure, void>> saveDraft(ChecklistEntity checklist);
}
