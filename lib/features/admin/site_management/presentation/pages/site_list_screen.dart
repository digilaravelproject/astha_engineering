import 'package:astha_engineering/core/constants/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:astha_engineering/core/theme/app_colors.dart';
import 'package:astha_engineering/routes/app_routes.dart';
import 'package:astha_engineering/core/widgets/skeleton_loading_list.dart';
import 'package:astha_engineering/features/admin/site_management/presentation/bloc/site_list_bloc.dart';
import 'package:astha_engineering/features/admin/site_management/presentation/bloc/site_list_state.dart';
import 'package:astha_engineering/features/admin/site_management/presentation/bloc/site_list_event.dart';

class SiteListScreen extends StatelessWidget {
  const SiteListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(AppStrings.manageSites,
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
      body: BlocBuilder<SiteListBloc, SiteListState>(
        builder: (context, state) {
          if (state is SiteListLoading) {
            return const SkeletonLoadingList(itemCount: 4);
          } else if (state is SiteListError) {
            return Center(child: Text(state.message, style: const TextStyle(color: Colors.red)));
          }

          return Column(
            children: [
          // Search Bar
          Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: AppStrings.searchSiteNameLocation,
                prefixIcon: const Icon(Icons.search, color: Colors.grey),
                filled: true,
                fillColor: AppColors.backgroundLight,
                contentPadding: const EdgeInsets.symmetric(vertical: 0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          
          // Site List
          Expanded(
            child: RefreshIndicator(
              onRefresh: () async {
                context.read<SiteListBloc>().add(LoadSiteList());
              },
              child: ListView.builder(
                padding: const EdgeInsets.all(16.0),
                itemCount: 5,
                itemBuilder: (context, index) {
                  return _buildSiteListItem(
                    context: context,
                    siteName: 'Plant Area 0${index + 1}',
                    customerName: 'Customer ${index + 1} Corp',
                    location: 'Industrial Estate Block ${index + 1}',
                    equipmentCount: (index + 2) * 5,
                  );
                },
              ),
            ),
          ),
        ],
      );
    }),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          context.push(Routes.addSite);
        },
        backgroundColor: AppColors.primary,
        icon: const Icon(Icons.add, color: Colors.white),
        label: Text(AppStrings.addSite,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _buildSiteListItem({
    required BuildContext context,
    required String siteName,
    required String customerName,
    required String location,
    required int equipmentCount,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12.0),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.grey.shade200),
      ),
      child: InkWell(
        onTap: () {
          context.push(Routes.siteDetails);
        },
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      siteName,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textPrimaryLight,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.orange.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      '$equipmentCount Equipment',
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.orange,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Icon(Icons.business, size: 14, color: Colors.grey),
                  const SizedBox(width: 6),
                  Text(
                    customerName,
                    style: const TextStyle(fontSize: 13, color: Colors.black87),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  const Icon(Icons.location_on, size: 14, color: Colors.grey),
                  const SizedBox(width: 6),
                  Text(
                    location,
                    style: const TextStyle(fontSize: 13, color: Colors.grey),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
