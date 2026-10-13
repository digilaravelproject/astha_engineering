import 'package:get/get.dart';

class EquipmentParameter {
  final String name;
  final RxString value;
  EquipmentParameter(this.name, String initialValue) : value = initialValue.obs;
}

class InspectionCheckpoint {
  final String parameter;
  final RxString observation; // 'OK' or 'NOT OK'
  final RxString rectification;
  InspectionCheckpoint(this.parameter)
      : observation = 'OK'.obs,
        rectification = ''.obs;
}

class PrepareChecklistController extends GetxController {
  final currentStep = 0.obs;

  void nextStep() {
    if (currentStep.value < 3) {
      currentStep.value++;
    }
  }

  void previousStep() {
    if (currentStep.value > 0) {
      currentStep.value--;
    }
  }

  // Basic Details
  final barcodeType = 'Manual'.obs;
  final equipmentName = ''.obs;
  final barcode = ''.obs;
  final inspectionDate = ''.obs;

  // Equipment Details
  final RxList<EquipmentParameter> equipmentParameters = <EquipmentParameter>[].obs;

  // Checkpoints
  final RxList<InspectionCheckpoint> checkpoints = <InspectionCheckpoint>[].obs;

  // Test Results & Validity
  final typeOfTest = 'Visual'.obs;
  final testResult = 'Fit For Use'.obs;
  final loadTestWeight = 'NA'.obs;
  final validityInMonths = '0'.obs;
  final validityType = 'Month/s'.obs;

  // Representative & Engineer
  final representativeName = ''.obs;
  final inspectionEngineer = ''.obs;
  final representativeEmail = ''.obs;
  final additionalInformation = ''.obs;

  final List<String> equipmentList = [
    'A Frame',
    'Air Compressor (diesel)',
    'Air Compressor (electrical)',
    'Air Receiver Tank',
    'Anchor Round Close Hook',
    'Anchoring Hook',
    'Angle Grinder Machine',
    'Articulated Boom Lift'
  ];

  final List<String> engineersList = [
    'Tushar Awate',
    'John Doe',
    'Jane Smith'
  ];

  @override
  void onInit() {
    super.onInit();
    // Default data loading
    _loadDefaultParameters();
    _loadDefaultCheckpoints();
  }

  void onEquipmentChanged(String? val) {
    if (val != null) {
      equipmentName.value = val;
      // In a real app, loading parameters from API based on selected equipment
    }
  }

  void _loadDefaultParameters() {
    equipmentParameters.addAll([
      EquipmentParameter('Make', ''),
      EquipmentParameter('Sr no.', ''),
      EquipmentParameter('Model no.', ''),
      EquipmentParameter('Max wr pr', ''),
      EquipmentParameter('Engine / Motor make', ''),
      EquipmentParameter('Engine / Motor model', ''),
      EquipmentParameter('Engine / Motor cap.', ''),
      EquipmentParameter('Engine / Motor Sr', ''),
      EquipmentParameter('Fab no.', ''),
      EquipmentParameter('Capacity', ''),
      EquipmentParameter('Name and address of Maker', ''),
      EquipmentParameter('Nature of process in which it is used', ''),
      EquipmentParameter('Date of construction', ''),
      EquipmentParameter('Thickness of walls', ''),
      EquipmentParameter('Date of which it was first taken into use', ''),
      EquipmentParameter('Safe working pressure recommended by maker', ''),
      EquipmentParameter('Crown', ''),
      EquipmentParameter('Side sheeting including grips and cups', ''),
      EquipmentParameter('Guiding mechanism (roller carriages, roller, pins, guide, ropes, etc.)', ''),
      EquipmentParameter('Tank', ''),
      EquipmentParameter('Other structure, if any, columns (framing and bracking)', ''),
      EquipmentParameter('Last external examination', ''),
    ]);
  }

  void removeEquipmentParameter(int index) {
    equipmentParameters.removeAt(index);
  }

  void _loadDefaultCheckpoints() {
    checkpoints.addAll([
      InspectionCheckpoint('Overall condition'),
      InspectionCheckpoint('Bucket Condition'),
      InspectionCheckpoint('Switches'),
      InspectionCheckpoint('Mirrors'),
      InspectionCheckpoint('Overall Cab Interior'),
      InspectionCheckpoint('Horn'),
      InspectionCheckpoint('Indicators'),
      InspectionCheckpoint('Battery Condition'),
      InspectionCheckpoint('Hydraulic Hose Condition'),
    ]);
  }

  void submitForm() {
    Get.snackbar('Success', 'CheckList prepared successfully!');
  }
}
