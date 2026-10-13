import 'package:dartz/dartz.dart';
import 'package:astha_engineering/core/error/failures.dart';
import 'package:astha_engineering/features/admin/site_management/domain/entities/site_entity.dart';
import 'package:astha_engineering/features/admin/site_management/domain/repositories/site_repository.dart';

class UpdateSite {
  final SiteRepository repository;
  UpdateSite(this.repository);

  Future<Either<Failure, void>> call(SiteEntity site) async {
    return await repository.updateSite(site);
  }
}
