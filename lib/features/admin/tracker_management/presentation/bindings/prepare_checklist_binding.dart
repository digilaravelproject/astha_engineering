import 'package:get/get.dart';
import '../controllers/prepare_checklist_controller.dart';

class PrepareChecklistBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PrepareChecklistController>(() => PrepareChecklistController());
  }
}
