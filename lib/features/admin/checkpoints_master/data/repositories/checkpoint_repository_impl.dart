import 'package:dartz/dartz.dart';
import 'package:safecheck_techno/core/error/failures.dart';
import 'package:safecheck_techno/features/admin/checkpoints_master/data/datasources/checkpoint_remote_data_source.dart';
import 'package:safecheck_techno/features/admin/checkpoints_master/domain/entities/checkpoint_entity.dart';
import 'package:safecheck_techno/features/admin/checkpoints_master/domain/repositories/checkpoint_repository.dart';

class CheckpointRepositoryImpl implements CheckpointRepository {
  final CheckpointRemoteDataSource remoteDataSource;
  CheckpointRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, List<CheckpointEntity>>> getCheckpoints() async {
    try {
      return Right(await remoteDataSource.getCheckpoints());
    } catch (e) {
      return const Left(ServerFailure('Failed to fetch checkpoints'));
    }
  }

  @override
  Future<Either<Failure, List<CheckpointEntity>>> getCheckpointsByEquipmentType(String type) async {
    try {
      final all = await remoteDataSource.getCheckpoints();
      return Right(all.where((c) => c.equipmentType == type).toList());
    } catch (e) {
      return const Left(ServerFailure('Failed to fetch checkpoints'));
    }
  }

  @override
  Future<Either<Failure, void>> addCheckpoint(CheckpointEntity checkpoint) async {
    try {
      await Future.delayed(const Duration(milliseconds: 500));
      return const Right(null);
    } catch (e) {
      return const Left(ServerFailure('Failed to add checkpoint'));
    }
  }

  @override
  Future<Either<Failure, void>> updateCheckpoint(CheckpointEntity checkpoint) async {
    try {
      await Future.delayed(const Duration(milliseconds: 500));
      return const Right(null);
    } catch (e) {
      return const Left(ServerFailure('Failed to update checkpoint'));
    }
  }

  @override
  Future<Either<Failure, void>> deleteCheckpoint(String id) async {
    try {
      await Future.delayed(const Duration(milliseconds: 500));
      return const Right(null);
    } catch (e) {
      return const Left(ServerFailure('Failed to delete checkpoint'));
    }
  }
}
