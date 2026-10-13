import 'package:dio/dio.dart';
import 'package:astha_engineering/features/admin/customer_management/data/models/customer_model.dart';

abstract class CustomerRemoteDataSource {
  Future<List<CustomerModel>> getCustomers();
}

class CustomerRemoteDataSourceImpl implements CustomerRemoteDataSource {
  final Dio dio;

  CustomerRemoteDataSourceImpl(this.dio);

  @override
  Future<List<CustomerModel>> getCustomers() async {
    await Future.delayed(const Duration(milliseconds: 800));
    return [
      CustomerModel(
        id: '1',
        companyName: 'A R Engineering',
        contactPerson: 'Mr. Sharma',
        email: 'info@arengineering.com',
        phone: '9876543210',
        address: 'Turbhe MIDC, Navi Mumbai',
        country: 'India',
        state: 'Maharashtra',
        city: 'Navi Mumbai',
        status: 'Active',
        createdAt: DateTime.now(),
      ),
      CustomerModel(
        id: '2',
        companyName: 'Tech Innovations Pvt. Ltd',
        contactPerson: 'Mr. Verma',
        email: 'info@techinnovations.com',
        phone: '9876541234',
        address: 'Pune, Maharashtra',
        country: 'India',
        state: 'Maharashtra',
        city: 'Pune',
        status: 'Active',
        createdAt: DateTime.now(),
      ),
    ];
  }
}
