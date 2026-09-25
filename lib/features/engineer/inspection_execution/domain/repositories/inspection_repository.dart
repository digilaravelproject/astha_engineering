import 'package:dartz/dartz.dart';
import 'package:safecheck_techno/core/error/failures.dart';
import 'package:safecheck_techno/features/common/checklist_management/domain/entities/checklist_entity.dart';

/// Engineer submits and views inspection checklists
abstract class InspectionRepository {
  Future<Either<Failure, List<ChecklistEntity>>> getInspectionsByEngineer(String engineerId);
  Future<Either<Failure, ChecklistEntity>> getInspectionById(String id);
  Future<Either<Failure, void>> submitInspection(ChecklistEntity checklist);
  Future<Either<Failure, void>> saveDraft(ChecklistEntity checklist);
}
