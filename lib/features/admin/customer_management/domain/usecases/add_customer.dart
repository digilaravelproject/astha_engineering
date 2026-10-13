import 'package:dartz/dartz.dart';
import 'package:astha_engineering/core/error/failures.dart';
import 'package:astha_engineering/features/admin/customer_management/domain/entities/customer_entity.dart';
import 'package:astha_engineering/features/admin/customer_management/domain/repositories/customer_repository.dart';

class AddCustomer {
  final CustomerRepository repository;
  AddCustomer(this.repository);

  Future<Either<Failure, void>> call(CustomerEntity customer) async {
    return await repository.addCustomer(customer);
  }
}
