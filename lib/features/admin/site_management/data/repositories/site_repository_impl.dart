import 'package:dartz/dartz.dart';
import 'package:astha_engineering/core/error/failures.dart';
import 'package:astha_engineering/features/admin/site_management/data/datasources/site_remote_data_source.dart';
import 'package:astha_engineering/features/admin/site_management/domain/entities/site_entity.dart';
import 'package:astha_engineering/features/admin/site_management/domain/repositories/site_repository.dart';

class SiteRepositoryImpl implements SiteRepository {
  final SiteRemoteDataSource remoteDataSource;

  SiteRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, List<SiteEntity>>> getSites() async {
    try {
      final result = await remoteDataSource.getSites();
      return Right(result);
    } catch (e) {
      return const Left(ServerFailure('Failed to fetch sites'));
    }
  }

  @override
  Future<Either<Failure, List<SiteEntity>>> getSitesByCustomerId(String customerId) async {
    try {
      final result = await remoteDataSource.getSites();
      return Right(result.where((s) => s.customerId == customerId).toList());
    } catch (e) {
      return const Left(ServerFailure('Failed to fetch sites'));
    }
  }

  @override
  Future<Either<Failure, SiteEntity>> getSiteById(String id) async {
    try {
      final result = await remoteDataSource.getSites();
      return Right(result.firstWhere((s) => s.id == id));
    } catch (e) {
      return const Left(ServerFailure('Site not found'));
    }
  }

  @override
  Future<Either<Failure, void>> addSite(SiteEntity site) async {
    try {
      await Future.delayed(const Duration(milliseconds: 500));
      return const Right(null);
    } catch (e) {
      return const Left(ServerFailure('Failed to add site'));
    }
  }

  @override
  Future<Either<Failure, void>> updateSite(SiteEntity site) async {
    try {
      await Future.delayed(const Duration(milliseconds: 500));
      return const Right(null);
    } catch (e) {
      return const Left(ServerFailure('Failed to update site'));
    }
  }

  @override
  Future<Either<Failure, void>> deleteSite(String id) async {
    try {
      await Future.delayed(const Duration(milliseconds: 500));
      return const Right(null);
    } catch (e) {
      return const Left(ServerFailure('Failed to delete site'));
    }
  }
}
