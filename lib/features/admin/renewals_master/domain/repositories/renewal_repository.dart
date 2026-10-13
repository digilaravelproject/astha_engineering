import 'package:dartz/dartz.dart';
import 'package:astha_engineering/core/error/failures.dart';
import 'package:astha_engineering/features/admin/renewals_master/domain/entities/renewal_entity.dart';

abstract class RenewalRepository {
  Future<Either<Failure, List<RenewalEntity>>> getRenewals();
  Future<Either<Failure, List<RenewalEntity>>> getOverdueRenewals();
  Future<Either<Failure, List<RenewalEntity>>> getRenewalsByCustomerId(String customerId);
  Future<Either<Failure, void>> markRenewalCompleted(String id);
}
