import 'package:equatable/equatable.dart';

class SiteEntity extends Equatable {
  final String id;
  final String customerId; // Linked to Customer
  final String siteName;
  final String? flatBlockNo;
  final String? buildingPremises;
  final String? streetLane;
  final String? areaLocality;
  final String country;
  final String state;
  final String cityDistrict;
  final String? pincode;
  final String? email;
  final String? phoneNumber;
  final String? mobileNumber;
  final String? additionalContactDetails;
  final String status;
  final DateTime createdAt;

  const SiteEntity({
    required this.id,
    required this.customerId,
    required this.siteName,
    this.flatBlockNo,
    this.buildingPremises,
    this.streetLane,
    this.areaLocality,
    required this.country,
    required this.state,
    required this.cityDistrict,
    this.pincode,
    this.email,
    this.phoneNumber,
    this.mobileNumber,
    this.additionalContactDetails,
    required this.status,
    required this.createdAt,
  });

  SiteEntity copyWith({
    String? id,
    String? customerId,
    String? siteName,
    String? flatBlockNo,
    String? buildingPremises,
    String? streetLane,
    String? areaLocality,
    String? country,
    String? state,
    String? cityDistrict,
    String? pincode,
    String? email,
    String? phoneNumber,
    String? mobileNumber,
    String? additionalContactDetails,
    String? status,
    DateTime? createdAt,
  }) {
    return SiteEntity(
      id: id ?? this.id,
      customerId: customerId ?? this.customerId,
      siteName: siteName ?? this.siteName,
      flatBlockNo: flatBlockNo ?? this.flatBlockNo,
      buildingPremises: buildingPremises ?? this.buildingPremises,
      streetLane: streetLane ?? this.streetLane,
      areaLocality: areaLocality ?? this.areaLocality,
      country: country ?? this.country,
      state: state ?? this.state,
      cityDistrict: cityDistrict ?? this.cityDistrict,
      pincode: pincode ?? this.pincode,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      mobileNumber: mobileNumber ?? this.mobileNumber,
      additionalContactDetails: additionalContactDetails ?? this.additionalContactDetails,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  List<Object?> get props => [
        id,
        customerId,
        siteName,
        flatBlockNo,
        buildingPremises,
        streetLane,
        areaLocality,
        country,
        state,
        cityDistrict,
        pincode,
        email,
        phoneNumber,
        mobileNumber,
        additionalContactDetails,
        status,
        createdAt,
      ];
}
