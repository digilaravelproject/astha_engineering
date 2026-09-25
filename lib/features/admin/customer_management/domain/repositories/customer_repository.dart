import 'package:dartz/dartz.dart';
import 'package:safecheck_techno/core/error/failures.dart';
import 'package:safecheck_techno/features/admin/customer_management/domain/entities/customer_entity.dart';

abstract class CustomerRepository {
  Future<Either<Failure, List<CustomerEntity>>> getCustomers();
  Future<Either<Failure, CustomerEntity>> getCustomerById(String id);
  Future<Either<Failure, void>> addCustomer(CustomerEntity customer);
  Future<Either<Failure, void>> updateCustomer(CustomerEntity customer);
  Future<Either<Failure, void>> deleteCustomer(String id);
}
