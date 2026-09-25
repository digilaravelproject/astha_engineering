import 'package:dartz/dartz.dart';
import 'package:safecheck_techno/core/error/failures.dart';
import 'package:safecheck_techno/features/admin/equipment_management/data/datasources/equipment_remote_data_source.dart';
import 'package:safecheck_techno/features/admin/equipment_management/domain/entities/equipment_entity.dart';
import 'package:safecheck_techno/features/admin/equipment_management/domain/repositories/equipment_repository.dart';

class EquipmentRepositoryImpl implements EquipmentRepository {
  final EquipmentRemoteDataSource remoteDataSource;

  EquipmentRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, List<EquipmentEntity>>> getEquipments() async {
    try {
      final result = await remoteDataSource.getEquipments();
      return Right(result);
    } catch (e) {
      return const Left(ServerFailure('Failed to fetch equipments'));
    }
  }

  @override
  Future<Either<Failure, List<EquipmentEntity>>> getEquipmentsBySiteId(String siteId) async {
    try {
      final result = await remoteDataSource.getEquipments();
      return Right(result.where((e) => e.siteId == siteId).toList());
    } catch (e) {
      return const Left(ServerFailure('Failed to fetch equipments'));
    }
  }

  @override
  Future<Either<Failure, EquipmentEntity>> getEquipmentById(String id) async {
    try {
      final result = await remoteDataSource.getEquipments();
      return Right(result.firstWhere((e) => e.id == id));
    } catch (e) {
      return const Left(ServerFailure('Equipment not found'));
    }
  }

  @override
  Future<Either<Failure, void>> addEquipment(EquipmentEntity equipment) async {
    try {
      await Future.delayed(const Duration(milliseconds: 500));
      return const Right(null);
    } catch (e) {
      return const Left(ServerFailure('Failed to add equipment'));
    }
  }

  @override
  Future<Either<Failure, void>> updateEquipment(EquipmentEntity equipment) async {
    try {
      await Future.delayed(const Duration(milliseconds: 500));
      return const Right(null);
    } catch (e) {
      return const Left(ServerFailure('Failed to update equipment'));
    }
  }

  @override
  Future<Either<Failure, void>> deleteEquipment(String id) async {
    try {
      await Future.delayed(const Duration(milliseconds: 500));
      return const Right(null);
    } catch (e) {
      return const Left(ServerFailure('Failed to delete equipment'));
    }
  }
}
