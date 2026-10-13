import 'package:get/get.dart';
import '../controllers/manage_checklist_controller.dart';

class ManageChecklistBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ManageChecklistController>(() => ManageChecklistController());
  }
}
