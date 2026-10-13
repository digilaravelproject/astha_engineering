import 'package:dartz/dartz.dart';
import 'package:astha_engineering/core/error/failures.dart';
import 'package:astha_engineering/features/admin/checkpoints_master/domain/entities/checkpoint_entity.dart';

abstract class CheckpointRepository {
  Future<Either<Failure, List<CheckpointEntity>>> getCheckpoints();
  Future<Either<Failure, List<CheckpointEntity>>> getCheckpointsByEquipmentType(String type);
  Future<Either<Failure, void>> addCheckpoint(CheckpointEntity checkpoint);
  Future<Either<Failure, void>> updateCheckpoint(CheckpointEntity checkpoint);
  Future<Either<Failure, void>> deleteCheckpoint(String id);
}
