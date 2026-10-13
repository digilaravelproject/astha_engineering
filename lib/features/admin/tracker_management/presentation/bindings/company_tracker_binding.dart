import 'package:get/get.dart';
import '../controllers/company_tracker_controller.dart';

class CompanyTrackerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CompanyTrackerController>(() => CompanyTrackerController());
  }
}
