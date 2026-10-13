import 'package:dartz/dartz.dart';
import 'package:astha_engineering/core/error/failures.dart';
import 'package:astha_engineering/features/admin/checkpoints_master/domain/entities/checkpoint_entity.dart';
import 'package:astha_engineering/features/admin/checkpoints_master/domain/repositories/checkpoint_repository.dart';

class GetCheckpoints {
  final CheckpointRepository repository;
  GetCheckpoints(this.repository);

  Future<Either<Failure, List<CheckpointEntity>>> call() async {
    return await repository.getCheckpoints();
  }
}
