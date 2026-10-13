import 'package:dio/dio.dart';
import 'package:astha_engineering/features/admin/user_management/data/models/user_model.dart';
import 'package:astha_engineering/core/enums/user_role.dart';
// Note: In real app, you would inject Dio or ApiClient here.

abstract class UserRemoteDataSource {
  Future<List<UserModel>> getUsers();
  Future<UserModel> addUser({
    required String name,
    required String email,
    required String phone,
    required UserRole role,
  });
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final Dio dio;

  UserRemoteDataSourceImpl(this.dio);

  @override
  Future<List<UserModel>> getUsers() async {
    // Simulate API call
    await Future.delayed(const Duration(milliseconds: 800));
    return [
      UserModel(
        id: '1',
        name: 'John Doe',
        email: 'john@example.com',
        phone: '1234567890',
        role: UserRole.inspectionEngineer,
        createdAt: DateTime.now().subtract(const Duration(days: 1)),
      ),
      UserModel(
        id: '2',
        name: 'Jane Smith',
        email: 'jane@example.com',
        phone: '0987654321',
        role: UserRole.admin,
        createdAt: DateTime.now().subtract(const Duration(days: 5)),
      ),
    ];
  }

  @override
  Future<UserModel> addUser({
    required String name,
    required String email,
    required String phone,
    required UserRole role,
  }) async {
    // Simulate API call
    await Future.delayed(const Duration(seconds: 1));
    return UserModel(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      name: name,
      email: email,
      phone: phone,
      role: role,
      createdAt: DateTime.now(),
    );
  }
}
