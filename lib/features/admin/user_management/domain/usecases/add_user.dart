import 'package:dartz/dartz.dart';
import 'package:safecheck_techno/core/error/failures.dart';
import 'package:safecheck_techno/features/admin/user_management/domain/entities/user_entity.dart';
import 'package:safecheck_techno/features/admin/user_management/domain/repositories/user_repository.dart';
import 'package:safecheck_techno/core/enums/user_role.dart';

class AddUser {
  final UserRepository repository;

  AddUser(this.repository);

  Future<Either<Failure, UserEntity>> call({
    required String name,
    required String email,
    required String phone,
    required UserRole role,
  }) async {
    return await repository.addUser(
      name: name,
      email: email,
      phone: phone,
      role: role,
    );
  }
}
