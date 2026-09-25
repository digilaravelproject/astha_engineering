import 'package:safecheck_techno/features/admin/site_management/domain/entities/site_entity.dart';

class SiteModel extends SiteEntity {
  const SiteModel({
    required super.id,
    required super.customerId,
    required super.siteName,
    super.flatBlockNo,
    super.buildingPremises,
    super.streetLane,
    super.areaLocality,
    required super.country,
    required super.state,
    required super.cityDistrict,
    super.pincode,
    super.email,
    super.phoneNumber,
    super.mobileNumber,
    super.additionalContactDetails,
    required super.status,
    required super.createdAt,
  });

  factory SiteModel.fromJson(Map<String, dynamic> json) {
    return SiteModel(
      id: json['id'] as String,
      customerId: json['customerId'] as String,
      siteName: json['siteName'] as String,
      flatBlockNo: json['flatBlockNo'] as String?,
      buildingPremises: json['buildingPremises'] as String?,
      streetLane: json['streetLane'] as String?,
      areaLocality: json['areaLocality'] as String?,
      country: json['country'] as String? ?? '',
      state: json['state'] as String? ?? '',
      cityDistrict: json['cityDistrict'] as String? ?? '',
      pincode: json['pincode'] as String?,
      email: json['email'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      mobileNumber: json['mobileNumber'] as String?,
      additionalContactDetails: json['additionalContactDetails'] as String?,
      status: json['status'] as String? ?? 'Active',
      createdAt: DateTime.parse(json['createdAt'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'customerId': customerId,
      'siteName': siteName,
      'flatBlockNo': flatBlockNo,
      'buildingPremises': buildingPremises,
      'streetLane': streetLane,
      'areaLocality': areaLocality,
      'country': country,
      'state': state,
      'cityDistrict': cityDistrict,
      'pincode': pincode,
      'email': email,
      'phoneNumber': phoneNumber,
      'mobileNumber': mobileNumber,
      'additionalContactDetails': additionalContactDetails,
      'status': status,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  factory SiteModel.fromEntity(SiteEntity entity) {
    return SiteModel(
      id: entity.id,
      customerId: entity.customerId,
      siteName: entity.siteName,
      flatBlockNo: entity.flatBlockNo,
      buildingPremises: entity.buildingPremises,
      streetLane: entity.streetLane,
      areaLocality: entity.areaLocality,
      country: entity.country,
      state: entity.state,
      cityDistrict: entity.cityDistrict,
      pincode: entity.pincode,
      email: entity.email,
      phoneNumber: entity.phoneNumber,
      mobileNumber: entity.mobileNumber,
      additionalContactDetails: entity.additionalContactDetails,
      status: entity.status,
      createdAt: entity.createdAt,
    );
  }
}
