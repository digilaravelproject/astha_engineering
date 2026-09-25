import 'package:dio/dio.dart';
import 'package:safecheck_techno/features/admin/checkpoints_master/data/models/checkpoint_model.dart';

abstract class CheckpointRemoteDataSource {
  Future<List<CheckpointModel>> getCheckpoints();
}

class CheckpointRemoteDataSourceImpl implements CheckpointRemoteDataSource {
  final Dio dio;
  CheckpointRemoteDataSourceImpl(this.dio);

  @override
  Future<List<CheckpointModel>> getCheckpoints() async {
    await Future.delayed(const Duration(milliseconds: 800));
    return [
      const CheckpointModel(
        id: '1', name: 'Visual Inspection', equipmentType: 'EOT Crane',
        fieldType: 'Dropdown', dropdownOptions: ['OK', 'Not OK', 'NA'],
        isRequired: true, isActive: true, sortOrder: 1,
      ),
      const CheckpointModel(
        id: '2', name: 'Load Test Weight (Tons)', equipmentType: 'EOT Crane',
        fieldType: 'Number', unit: 'Ton',
        isRequired: true, isActive: true, sortOrder: 2,
      ),
    ];
  }
}
