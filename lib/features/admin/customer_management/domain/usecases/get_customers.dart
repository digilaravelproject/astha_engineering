import 'package:dartz/dartz.dart';
import 'package:astha_engineering/core/error/failures.dart';
import 'package:astha_engineering/features/admin/customer_management/domain/entities/customer_entity.dart';
import 'package:astha_engineering/features/admin/customer_management/domain/repositories/customer_repository.dart';

class GetCustomers {
  final CustomerRepository repository;

  GetCustomers(this.repository);

  Future<Either<Failure, List<CustomerEntity>>> call() async {
    return await repository.getCustomers();
  }
}
