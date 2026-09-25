import 'package:safecheck_techno/core/constants/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:safecheck_techno/core/theme/app_colors.dart';
import 'package:safecheck_techno/routes/app_routes.dart';
import 'package:safecheck_techno/core/widgets/skeleton_loading_list.dart';
import 'package:safecheck_techno/features/admin/equipment_management/presentation/bloc/equipment_list_bloc.dart';
import 'package:safecheck_techno/features/admin/equipment_management/presentation/bloc/equipment_list_state.dart';
import 'package:safecheck_techno/features/admin/equipment_management/presentation/bloc/equipment_list_event.dart';

class EquipmentListScreen extends StatelessWidget {
  const EquipmentListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(AppStrings.manageEquipment,
          style: TextStyle(
            color: AppColors.textPrimaryLight,
            fontWeight: FontWeight.w700,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black87),
          onPressed: () => context.pop(),
        ),
      ),
      body: BlocBuilder<EquipmentListBloc, EquipmentListState>(
        builder: (context, state) {
          if (state is EquipmentListLoading) {
            return const SkeletonLoadingList(itemCount: 4);
          } else if (state is EquipmentListError) {
            return Center(child: Text(state.message, style: const TextStyle(color: Colors.red)));
          }

          return Column(
            children: [
              // Search & Filter Bar
              Container(
                color: Colors.white,
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: AppStrings.searchEquipment,
                          prefixIcon: const Icon(Icons.search, color: Colors.grey),
                          contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                          filled: true,
                          fillColor: Colors.grey.shade100,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.primary.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.filter_list, color: AppColors.primary),
                        onPressed: () {
                          // Show filters
                        },
                      ),
                    ),
                  ],
                ),
              ),

              // List of Equipment
              Expanded(
                child: RefreshIndicator(
                  onRefresh: () async {
                    context.read<EquipmentListBloc>().add(LoadEquipmentList());
                  },
                  child: ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: 5,
                  itemBuilder: (context, index) {
                    return Card(
                      margin: const EdgeInsets.only(bottom: 12),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: BorderSide(color: Colors.grey.shade200),
                      ),
                      child: InkWell(
                        onTap: () {
                          context.push(Routes.equipmentDetails);
                        },
                        borderRadius: BorderRadius.circular(12),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            children: [
                              Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  color: Colors.orange.withValues(alpha: 0.1),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: const Icon(Icons.precision_manufacturing, color: Colors.orange),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'EOT Crane 5 Ton (${index + 1})',
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.textPrimaryLight,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    const Row(
                                      children: [
                                        Icon(Icons.location_on, size: 14, color: Colors.grey),
                                        SizedBox(width: 4),
                                        Text('MIDC Plant Area 1', style: TextStyle(color: Colors.grey, fontSize: 13)),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              const Icon(Icons.chevron_right, color: Colors.grey),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          context.push(Routes.addEquipment);
        },
        backgroundColor: AppColors.primary,
        icon: const Icon(Icons.add, color: Colors.white),
        label: Text(AppStrings.addEquipment, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );
  }
}
