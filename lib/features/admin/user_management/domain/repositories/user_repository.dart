import 'package:dartz/dartz.dart';
import 'package:astha_engineering/core/error/failures.dart';
import 'package:astha_engineering/features/admin/user_management/domain/entities/user_entity.dart';
import 'package:astha_engineering/core/enums/user_role.dart';

abstract class UserRepository {
  Future<Either<Failure, List<UserEntity>>> getUsers();
  Future<Either<Failure, UserEntity>> addUser({
    required String name,
    required String email,
    required String phone,
    required UserRole role,
  });
}
