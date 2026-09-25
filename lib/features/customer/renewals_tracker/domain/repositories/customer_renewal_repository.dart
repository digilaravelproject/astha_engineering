import 'package:dartz/dartz.dart';
import 'package:safecheck_techno/core/error/failures.dart';
import 'package:safecheck_techno/features/admin/renewals_master/domain/entities/renewal_entity.dart';

/// Customer can view upcoming/overdue renewals for their sites
abstract class CustomerRenewalRepository {
  Future<Either<Failure, List<RenewalEntity>>> getRenewalsForCustomer(String customerId);
}
