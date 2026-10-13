import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:astha_engineering/routes/app_routes.dart';
import 'package:astha_engineering/routes/route_helper.dart';
class CompanyTrackerController extends GetxController {
  final companyName = 'A R ENGINEERING'.obs;
  final siteName = 'Lubrizol India Private Limited'.obs;
  final address = '03, Turbhe MIDC'.obs;
  final email = 'alex@arengg.in'.obs;
  final phone = '8129251737'.obs;

  void onSearchSite() {
    Get.snackbar('Search', 'Search Site tapped');
  }

  void onActionSelected(String action) {
    if (action == 'Prepare CheckList' || action == 'Manage CheckList') {
      // Use GoRouter to navigate because the app uses GoRouter for main routing
      RouteHelper.router.push(Routes.manageChecklist);
    } else {
      Get.snackbar('Action', '$action tapped');
    }
  }
}

