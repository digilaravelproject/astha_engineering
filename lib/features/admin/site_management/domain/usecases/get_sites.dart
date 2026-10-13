import 'package:dartz/dartz.dart';
import 'package:astha_engineering/core/error/failures.dart';
import 'package:astha_engineering/features/admin/site_management/domain/entities/site_entity.dart';
import 'package:astha_engineering/features/admin/site_management/domain/repositories/site_repository.dart';

class GetSites {
  final SiteRepository repository;

  GetSites(this.repository);

  Future<Either<Failure, List<SiteEntity>>> call() async {
    return await repository.getSites();
  }
}
