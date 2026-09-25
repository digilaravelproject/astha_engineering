import 'package:dartz/dartz.dart';
import 'package:safecheck_techno/core/error/failures.dart';
import 'package:safecheck_techno/features/admin/site_management/domain/entities/site_entity.dart';
import 'package:safecheck_techno/features/admin/site_management/domain/repositories/site_repository.dart';

class GetSites {
  final SiteRepository repository;

  GetSites(this.repository);

  Future<Either<Failure, List<SiteEntity>>> call() async {
    return await repository.getSites();
  }
}
