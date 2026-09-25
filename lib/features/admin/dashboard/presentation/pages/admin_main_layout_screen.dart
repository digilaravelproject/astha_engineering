import 'package:safecheck_techno/core/constants/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:safecheck_techno/core/theme/app_colors.dart';

class AdminMainLayoutScreen extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const AdminMainLayoutScreen({
    super.key,
    required this.navigationShell,
  });

  void _goBranch(int index) {
    navigationShell.goBranch(
      index,
      // A common pattern when using bottom navigation bars is to support
      // navigating to the initial location when tapping the item that is
      // already active.
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
          BottomNavigationBarItem(icon: Icon(Icons.people), label: AppStrings.users),
          BottomNavigationBarItem(icon: Icon(Icons.business), label: AppStrings.customers),
          BottomNavigationBarItem(icon: Icon(Icons.location_on), label: AppStrings.sites),
          BottomNavigationBarItem(icon: Icon(Icons.more_horiz), label: AppStrings.more),
        ],
      ),
    );
  }
}
