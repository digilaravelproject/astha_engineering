import 'package:dartz/dartz.dart';
import 'package:safecheck_techno/core/error/failures.dart';
import 'package:safecheck_techno/features/admin/user_management/domain/entities/user_entity.dart';
import 'package:safecheck_techno/features/admin/user_management/domain/repositories/user_repository.dart';

class GetUsers {
  final UserRepository repository;

  GetUsers(this.repository);

  Future<Either<Failure, List<UserEntity>>> call() async {
    return await repository.getUsers();
  }
}
