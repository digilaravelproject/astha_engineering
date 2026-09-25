import 'package:dartz/dartz.dart';
import 'package:safecheck_techno/core/error/failures.dart';
import 'package:safecheck_techno/features/admin/user_management/domain/entities/user_entity.dart';
import 'package:safecheck_techno/core/enums/user_role.dart';

abstract class UserRepository {
  Future<Either<Failure, List<UserEntity>>> getUsers();
  Future<Either<Failure, UserEntity>> addUser({
    required String name,
    required String email,
    required String phone,
    required UserRole role,
  });
}
