import 'package:dartz/dartz.dart';
import 'package:astha_engineering/core/error/failures.dart';
import 'package:astha_engineering/features/admin/user_management/data/datasources/user_remote_data_source.dart';
import 'package:astha_engineering/features/admin/user_management/domain/entities/user_entity.dart';
import 'package:astha_engineering/features/admin/user_management/domain/repositories/user_repository.dart';
import 'package:astha_engineering/core/enums/user_role.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource remoteDataSource;

  UserRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, List<UserEntity>>> getUsers() async {
    try {
      final remoteUsers = await remoteDataSource.getUsers();
      return Right(remoteUsers);
    } catch (e) {
      return const Left(ServerFailure('Failed to fetch users'));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> addUser({
    required String name,
    required String email,
    required String phone,
    required UserRole role,
  }) async {
    try {
      final remoteUser = await remoteDataSource.addUser(
        name: name,
        email: email,
        phone: phone,
        role: role,
      );
      return Right(remoteUser);
    } catch (e) {
      return const Left(ServerFailure('Failed to add user'));
    }
  }
}
