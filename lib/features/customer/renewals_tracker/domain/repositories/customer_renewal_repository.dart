import 'package:dartz/dartz.dart';
import 'package:astha_engineering/core/error/failures.dart';
import 'package:astha_engineering/features/admin/renewals_master/domain/entities/renewal_entity.dart';

/// Customer can view upcoming/overdue renewals for their sites
abstract class CustomerRenewalRepository {
  Future<Either<Failure, List<RenewalEntity>>> getRenewalsForCustomer(String customerId);
}
