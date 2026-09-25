import 'package:equatable/equatable.dart';

class CustomerEntity extends Equatable {
  final String id;
  final String companyName;
  final String contactPerson;
  final String email;
  final String phone;
  final String? gstNumber;
  final String address;
  final String country;
  final String state;
  final String city;
  final String? pincode;
  final String status;
  final DateTime createdAt;

  const CustomerEntity({
    required this.id,
    required this.companyName,
    required this.contactPerson,
    required this.email,
    required this.phone,
    this.gstNumber,
    required this.address,
    required this.country,
    required this.state,
    required this.city,
    this.pincode,
    required this.status,
    required this.createdAt,
  });

  CustomerEntity copyWith({
    String? id,
    String? companyName,
    String? contactPerson,
    String? email,
    String? phone,
    String? gstNumber,
    String? address,
    String? country,
    String? state,
    String? city,
    String? pincode,
    String? status,
    DateTime? createdAt,
  }) {
    return CustomerEntity(
      id: id ?? this.id,
      companyName: companyName ?? this.companyName,
      contactPerson: contactPerson ?? this.contactPerson,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      gstNumber: gstNumber ?? this.gstNumber,
      address: address ?? this.address,
      country: country ?? this.country,
      state: state ?? this.state,
      city: city ?? this.city,
      pincode: pincode ?? this.pincode,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  List<Object?> get props => [
        id,
        companyName,
        contactPerson,
        email,
        phone,
        gstNumber,
        address,
        country,
        state,
        city,
        pincode,
        status,
        createdAt,
      ];
}
