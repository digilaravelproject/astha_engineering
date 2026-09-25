import 'package:safecheck_techno/core/constants/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:safecheck_techno/core/theme/app_colors.dart';
import 'package:safecheck_techno/core/widgets/skeleton_loading_list.dart';
import 'package:safecheck_techno/features/admin/certificate_management/presentation/bloc/certificate_list_bloc.dart';
import 'package:safecheck_techno/features/admin/certificate_management/presentation/bloc/certificate_list_state.dart';
import 'package:safecheck_techno/features/admin/certificate_management/presentation/bloc/certificate_list_event.dart';

class CertificateListScreen extends StatelessWidget {
  const CertificateListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(AppStrings.manageCertificates,
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
      body: BlocBuilder<CertificateListBloc, CertificateListState>(
        builder: (context, state) {
          if (state is CertificateListLoading) {
            return const SkeletonLoadingList(itemCount: 4);
          } else if (state is CertificateListError) {
            return Center(child: Text(state.message, style: const TextStyle(color: Colors.red)));
          }

          return Column(
            children: [
              // Search & Filter
              Container(
                color: Colors.white,
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: AppStrings.searchByEquipmentOrId,
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
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ),

              // Certificate List
              Expanded(
                child: RefreshIndicator(
                  onRefresh: () async {
                    context.read<CertificateListBloc>().add(LoadCertificateList());
                  },
                  child: ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: 4,
                  itemBuilder: (context, index) {
                    return Card(
                      margin: const EdgeInsets.only(bottom: 12),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: BorderSide(color: Colors.grey.shade200),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          children: [
                            Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                color: Colors.red.withValues(alpha: 0.1),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: const Icon(Icons.picture_as_pdf, color: Colors.red),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'CERT-2026-${index + 1000}',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.textPrimaryLight,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  const Text('Equipment: EOT Crane 5 Ton', style: TextStyle(color: Colors.black87, fontSize: 13)),
                                  const SizedBox(height: 2),
                                  const Text('Issued: 12 Oct 2026', style: TextStyle(color: Colors.grey, fontSize: 12)),
                                ],
                              ),
                            ),
                            IconButton(
                              icon: const Icon(Icons.download, color: AppColors.primary),
                              onPressed: () {
                                // Download or view PDF
                              },
                            ),
                          ],
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
    );
  }
}
