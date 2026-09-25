import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:safecheck_techno/core/theme/app_colors.dart';
import 'package:safecheck_techno/core/widgets/skeleton_loading_list.dart';
import 'package:safecheck_techno/routes/app_routes.dart';

class EngineerSiteListScreen extends StatefulWidget {
  const EngineerSiteListScreen({super.key});

  @override
  State<EngineerSiteListScreen> createState() => _EngineerSiteListScreenState();
}

class _EngineerSiteListScreenState extends State<EngineerSiteListScreen> {
  // Using a local state for dummy loading right now. Will be replaced by BLoC.
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Assigned Sites',
          style: TextStyle(
            color: AppColors.primary,
            fontWeight: FontWeight.w800,
            fontSize: 20,
          ),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search sites by name or location...',
                prefixIcon: const Icon(Icons.search, color: Colors.grey),
                filled: true,
                fillColor: Colors.grey.shade100,
                contentPadding: const EdgeInsets.symmetric(vertical: 0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
        ),
      ),
      body: _isLoading
          ? const Padding(
              padding: EdgeInsets.all(16.0),
              child: SkeletonLoadingList(
                itemCount: 5,
              ),
            )
          : RefreshIndicator(
              onRefresh: () async {
                setState(() => _isLoading = true);
                await Future.delayed(const Duration(seconds: 1));
                setState(() => _isLoading = false);
              },
              child: ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: 4, // Dummy count
                itemBuilder: (context, index) {
                  return _buildSiteCard(index);
                },
              ),
            ),
    );
  }

  Widget _buildSiteCard(int index) {
    final sites = [
      {'name': 'Turbhe MIDC Plant', 'customer': 'Tata Steel', 'location': 'Navi Mumbai', 'tasks': 2},
      {'name': 'Pune Manufacturing Unit', 'customer': 'Mahindra', 'location': 'Chakan, Pune', 'tasks': 5},
      {'name': 'Mumbai HQ', 'customer': 'Reliance', 'location': 'BKC, Mumbai', 'tasks': 0},
      {'name': 'Thane Warehouse', 'customer': 'Amazon', 'location': 'Bhiwandi', 'tasks': 1},
    ];

    final site = sites[index];
    final taskCount = site['tasks'] as int;

    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: Colors.grey.shade200),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () {
          context.pushNamed(
            Routes.engineerSiteOverview.substring(1), 
            extra: site['name'],
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          site['name'] as String,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: AppColors.textPrimaryLight,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            const Icon(Icons.business, size: 14, color: Colors.grey),
                            const SizedBox(width: 4),
                            Text(
                              site['customer'] as String,
                              style: TextStyle(color: Colors.grey.shade600, fontSize: 13),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: taskCount > 0 ? Colors.orange.withValues(alpha: 0.1) : Colors.green.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      taskCount > 0 ? '$taskCount Pending' : 'All Clear',
                      style: TextStyle(
                        color: taskCount > 0 ? Colors.orange.shade800 : Colors.green,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 12),
                child: Divider(height: 1),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.location_on, size: 16, color: AppColors.primary),
                      const SizedBox(width: 4),
                      Text(
                        site['location'] as String,
                        style: TextStyle(color: Colors.grey.shade700, fontSize: 13),
                      ),
                    ],
                  ),
                  const Icon(Icons.arrow_forward_ios, size: 14, color: Colors.grey),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
