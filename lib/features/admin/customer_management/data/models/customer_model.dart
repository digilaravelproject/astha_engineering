import 'package:astha_engineering/features/admin/customer_management/domain/entities/customer_entity.dart';

class CustomerModel extends CustomerEntity {
  const CustomerModel({
    required super.id,
    required super.companyName,
    required super.contactPerson,
    required super.email,
    required super.phone,
    super.gstNumber,
    required super.address,
    required super.country,
    required super.state,
    required super.city,
    super.pincode,
    required super.status,
    required super.createdAt,
  });

  factory CustomerModel.fromJson(Map<String, dynamic> json) {
    return CustomerModel(
      id: json['id'] as String,
      companyName: json['companyName'] as String,
      contactPerson: json['contactPerson'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      gstNumber: json['gstNumber'] as String?,
      address: json['address'] as String,
      country: json['country'] as String? ?? '',
      state: json['state'] as String? ?? '',
      city: json['city'] as String? ?? '',
      pincode: json['pincode'] as String?,
      status: json['status'] as String? ?? 'Active',
      createdAt: DateTime.parse(json['createdAt'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'companyName': companyName,
      'contactPerson': contactPerson,
      'email': email,
      'phone': phone,
      'gstNumber': gstNumber,
      'address': address,
      'country': country,
      'state': state,
      'city': city,
      'pincode': pincode,
      'status': status,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  factory CustomerModel.fromEntity(CustomerEntity entity) {
    return CustomerModel(
      id: entity.id,
      companyName: entity.companyName,
      contactPerson: entity.contactPerson,
      email: entity.email,
      phone: entity.phone,
      gstNumber: entity.gstNumber,
      address: entity.address,
      country: entity.country,
      state: entity.state,
      city: entity.city,
      pincode: entity.pincode,
      status: entity.status,
      createdAt: entity.createdAt,
    );
  }
}
