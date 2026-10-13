import 'package:dartz/dartz.dart';
import 'package:astha_engineering/core/error/failures.dart';
import 'package:astha_engineering/features/admin/customer_management/data/datasources/customer_remote_data_source.dart';
import 'package:astha_engineering/features/admin/customer_management/domain/entities/customer_entity.dart';
import 'package:astha_engineering/features/admin/customer_management/domain/repositories/customer_repository.dart';

class CustomerRepositoryImpl implements CustomerRepository {
  final CustomerRemoteDataSource remoteDataSource;

  CustomerRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, List<CustomerEntity>>> getCustomers() async {
    try {
      final result = await remoteDataSource.getCustomers();
      return Right(result);
    } catch (e) {
      return const Left(ServerFailure('Failed to fetch customers'));
    }
  }

  @override
  Future<Either<Failure, CustomerEntity>> getCustomerById(String id) async {
    try {
      final result = await remoteDataSource.getCustomers();
      return Right(result.firstWhere((c) => c.id == id));
    } catch (e) {
      return const Left(ServerFailure('Customer not found'));
    }
  }

  @override
  Future<Either<Failure, void>> addCustomer(CustomerEntity customer) async {
    try {
      // TODO: Call remote data source add API
      await Future.delayed(const Duration(milliseconds: 500));
      return const Right(null);
    } catch (e) {
      return const Left(ServerFailure('Failed to add customer'));
    }
  }

  @override
  Future<Either<Failure, void>> updateCustomer(CustomerEntity customer) async {
    try {
      // TODO: Call remote data source update API
      await Future.delayed(const Duration(milliseconds: 500));
      return const Right(null);
    } catch (e) {
      return const Left(ServerFailure('Failed to update customer'));
    }
  }

  @override
  Future<Either<Failure, void>> deleteCustomer(String id) async {
    try {
      // TODO: Call remote data source delete API
      await Future.delayed(const Duration(milliseconds: 500));
      return const Right(null);
    } catch (e) {
      return const Left(ServerFailure('Failed to delete customer'));
    }
  }
}
