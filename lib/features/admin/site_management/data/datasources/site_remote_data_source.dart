import 'package:dio/dio.dart';
import 'package:astha_engineering/features/admin/site_management/data/models/site_model.dart';

abstract class SiteRemoteDataSource {
  Future<List<SiteModel>> getSites();
}

class SiteRemoteDataSourceImpl implements SiteRemoteDataSource {
  final Dio dio;

  SiteRemoteDataSourceImpl(this.dio);

  @override
  Future<List<SiteModel>> getSites() async {
    await Future.delayed(const Duration(milliseconds: 800));
    return [
      SiteModel(
        id: '1',
        customerId: '1',
        siteName: 'Turbhe MIDC Plant',
        flatBlockNo: '03',
        buildingPremises: 'Industrial Area',
        streetLane: 'Turbhe MIDC',
        areaLocality: 'Turbhe',
        country: 'India',
        state: 'Maharashtra',
        cityDistrict: 'Navi Mumbai',
        pincode: '400705',
        mobileNumber: '9876512345',
        status: 'Active',
        createdAt: DateTime.now(),
      ),
      SiteModel(
        id: '2',
        customerId: '1',
        siteName: 'Puno Plant',
        country: 'India',
        state: 'Maharashtra',
        cityDistrict: 'Pune',
        status: 'Active',
        createdAt: DateTime.now(),
      ),
    ];
  }
}
