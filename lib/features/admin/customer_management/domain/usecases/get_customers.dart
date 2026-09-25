import 'package:dartz/dartz.dart';
import 'package:safecheck_techno/core/error/failures.dart';
import 'package:safecheck_techno/features/admin/customer_management/domain/entities/customer_entity.dart';
import 'package:safecheck_techno/features/admin/customer_management/domain/repositories/customer_repository.dart';

class GetCustomers {
  final CustomerRepository repository;

  GetCustomers(this.repository);

  Future<Either<Failure, List<CustomerEntity>>> call() async {
    return await repository.getCustomers();
  }
}
