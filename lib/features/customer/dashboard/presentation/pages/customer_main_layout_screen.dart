import 'package:safecheck_techno/core/constants/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:safecheck_techno/core/theme/app_colors.dart';

class CustomerMainLayoutScreen extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const CustomerMainLayoutScreen({
    super.key,
    required this.navigationShell,
  });

  void _goBranch(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: Colors.grey,
        currentIndex: navigationShell.currentIndex,
        onTap: _goBranch,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: AppStrings.dashboard),
          BottomNavigationBarItem(icon: Icon(Icons.location_on), label: AppStrings.mySites),
          BottomNavigationBarItem(icon: Icon(Icons.workspace_premium), label: AppStrings.certificates),
          BottomNavigationBarItem(icon: Icon(Icons.more_horiz), label: AppStrings.more),
        ],
      ),
    );
  }
}
