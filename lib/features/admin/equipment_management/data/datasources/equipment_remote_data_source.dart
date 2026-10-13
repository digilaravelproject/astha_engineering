import 'package:dio/dio.dart';
import 'package:astha_engineering/features/admin/equipment_management/data/models/equipment_model.dart';

abstract class EquipmentRemoteDataSource {
  Future<List<EquipmentModel>> getEquipments();
}

class EquipmentRemoteDataSourceImpl implements EquipmentRemoteDataSource {
  final Dio dio;

  EquipmentRemoteDataSourceImpl(this.dio);

  @override
  Future<List<EquipmentModel>> getEquipments() async {
    await Future.delayed(const Duration(milliseconds: 800));
    return [
      EquipmentModel(
        id: '1',
        siteId: '1',
        equipmentName: 'Chain Pulley Block',
        equipmentShortName: 'CPB',
        formType: 'Standard',
        manufacturerMake: 'Demag',
        model: 'F11',
        serialNumber: 'SN-001',
        equipmentNumber: 'EQ-001',
        ratedCapacity: 5.0,
        swlCapacity: 5.0,
        status: 'Active',
        createdAt: DateTime.now(),
      ),
      EquipmentModel(
        id: '2',
        siteId: '1',
        equipmentName: 'EOT Crane',
        equipmentShortName: 'EOT',
        formType: 'Standard',
        manufacturerMake: 'Konecranes',
        model: 'CXT',
        serialNumber: 'SN-002',
        equipmentNumber: 'EQ-002',
        ratedCapacity: 10.0,
        swlCapacity: 10.0,
        status: 'Active',
        createdAt: DateTime.now(),
      ),
    ];
  }
}
