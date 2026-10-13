import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:astha_engineering/routes/app_routes.dart';
import 'package:astha_engineering/routes/route_helper.dart';
class CheckListModel {
  final String checklistNumber;
  final String barcode;
  final String barcodeType;
  final String equipmentName;
  final String inspectionDate;
  final String validTillDate;
  final String inspectionEngineer;

  CheckListModel({
    required this.checklistNumber,
    required this.barcode,
    required this.barcodeType,
    required this.equipmentName,
    required this.inspectionDate,
    required this.validTillDate,
    required this.inspectionEngineer,
  });
}

class ManageChecklistController extends GetxController {
  final siteName = 'Lubrizol India Private Limited'.obs;
  
  // Filters
  final checklistNumberController = ''.obs;
  final barcodeController = ''.obs;
  final equipmentNameController = ''.obs;
  final engineerController = ''.obs;
  final isActive = true.obs;

  // Data
  final RxList<CheckListModel> checklists = <CheckListModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadDummyData();
  }

  void loadDummyData() {
    checklists.value = List.generate(10, (index) => CheckListModel(
      checklistNumber: 'CHK00069${52 - index}',
      barcode: '77093${04 + index * 5}',
      barcodeType: 'Manual',
      equipmentName: index % 2 == 0 ? 'Chain Pulley Block (F11)' : 'D Shackle (F11)',
      inspectionDate: '24/08/2026',
      validTillDate: '23/02/2027',
      inspectionEngineer: 'Tushar Awate',
    ));
  }

  void search() {
    Get.snackbar('Search', 'Search applied');
  }

  void reset() {
    checklistNumberController.value = '';
    barcodeController.value = '';
    equipmentNameController.value = '';
    engineerController.value = '';
    isActive.value = true;
    Get.snackbar('Reset', 'Filters cleared');
  }

  void addChecklist() {
    RouteHelper.router.push(Routes.prepareChecklist);
  }
}
