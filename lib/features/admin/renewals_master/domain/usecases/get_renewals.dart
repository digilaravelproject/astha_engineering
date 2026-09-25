import 'package:dartz/dartz.dart';
import 'package:safecheck_techno/core/error/failures.dart';
import 'package:safecheck_techno/features/admin/renewals_master/domain/entities/renewal_entity.dart';
import 'package:safecheck_techno/features/admin/renewals_master/domain/repositories/renewal_repository.dart';

class GetRenewals {
  final RenewalRepository repository;
  GetRenewals(this.repository);

  Future<Either<Failure, List<RenewalEntity>>> call() async {
    return await repository.getRenewals();
  }
}
