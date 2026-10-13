import 'package:dartz/dartz.dart';
import 'package:astha_engineering/core/error/failures.dart';
import 'package:astha_engineering/features/admin/user_management/domain/entities/user_entity.dart';
import 'package:astha_engineering/features/admin/user_management/domain/repositories/user_repository.dart';

class GetUsers {
  final UserRepository repository;

  GetUsers(this.repository);

  Future<Either<Failure, List<UserEntity>>> call() async {
    return await repository.getUsers();
  }
}
