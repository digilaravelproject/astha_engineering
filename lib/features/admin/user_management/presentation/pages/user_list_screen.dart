import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safecheck_techno/core/theme/app_colors.dart';
import 'package:safecheck_techno/core/enums/user_role.dart';
import 'package:safecheck_techno/routes/app_routes.dart';
import 'package:safecheck_techno/core/widgets/skeleton_loading_list.dart';
import 'package:safecheck_techno/features/admin/user_management/presentation/bloc/user_list_bloc.dart';
import 'package:safecheck_techno/features/admin/user_management/presentation/bloc/user_list_state.dart';
import 'package:safecheck_techno/features/admin/user_management/presentation/bloc/user_list_event.dart';

class UserListScreen extends StatefulWidget {
  const UserListScreen({super.key});

  @override
  State<UserListScreen> createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  String _selectedFilter = 'All';
  final List<String> _filters = [
    'All',
    UserRole.admin.displayName,
    UserRole.inspectionEngineer.shortName,
    'Active',
    'Inactive'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Manage Users',
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
      body: BlocBuilder<UserListBloc, UserListState>(
        builder: (context, state) {
          if (state is UserListLoading) {
            return const SkeletonLoadingList(itemCount: 5);
          } else if (state is UserListError) {
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
                hintText: 'Search name, email, mobile, ID...',
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
          
          // Filter Chips
          Container(
            color: Colors.white,
            width: double.infinity,
            padding: const EdgeInsets.only(bottom: 12.0, left: 16.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: _filters.map((filter) {
                  final isSelected = _selectedFilter == filter;
                  return Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: ChoiceChip(
                      label: Text(filter),
                      selected: isSelected,
                      onSelected: (selected) {
                        setState(() {
                          _selectedFilter = filter;
                        });
                      },
                      selectedColor: AppColors.primary.withValues(alpha: 0.15),
                      labelStyle: TextStyle(
                        color: isSelected ? AppColors.primary : AppColors.textSecondaryLight,
                        fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                      ),
                      backgroundColor: AppColors.backgroundLight,
                      side: BorderSide(
                        color: isSelected ? AppColors.primary : Colors.transparent,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
          
          // User List
          Expanded(
            child: RefreshIndicator(
              onRefresh: () async {
                context.read<UserListBloc>().add(LoadUserList());
              },
              child: ListView.builder(
                padding: const EdgeInsets.all(16.0),
                itemCount: 5, // Replace with state.users.length later
                itemBuilder: (context, index) {
                  final role = index % 2 == 0 ? UserRole.admin : UserRole.inspectionEngineer;
                  return _buildUserListItem(
                    name: 'User Name ${index + 1}',
                    role: role,
                    email: 'user${index + 1}@example.com',
                    phone: '+91 9876543210',
                    isActive: index != 4, // Make one inactive for demo
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
          context.push(Routes.addUser);
        },
        backgroundColor: AppColors.primary,
        icon: const Icon(Icons.add, color: Colors.white),
        label: const Text(
          'Add User',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _buildUserListItem({
    required String name,
    required UserRole role,
    required String email,
    required String phone,
    required bool isActive,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12.0),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.grey.shade200),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: AppColors.primary.withValues(alpha: 0.1),
                  child: Text(
                    name[0],
                    style: const TextStyle(
                      color: AppColors.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              name,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: AppColors.textPrimaryLight,
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: role == UserRole.admin 
                                  ? Colors.purple.withValues(alpha: 0.1) 
                                  : Colors.orange.withValues(alpha: 0.1),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Text(
                              role.displayName,
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: role == UserRole.admin ? Colors.purple : Colors.orange.shade800,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        email,
                        style: const TextStyle(
                          fontSize: 13,
                          color: AppColors.textSecondaryLight,
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.more_vert, color: Colors.grey),
                  onPressed: () {},
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: Divider(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(Icons.phone, size: 14, color: Colors.grey),
                    const SizedBox(width: 4),
                    Text(
                      phone,
                      style: const TextStyle(
                        fontSize: 13,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: isActive ? Colors.green.withValues(alpha: 0.1) : Colors.red.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        isActive ? Icons.check_circle : Icons.cancel,
                        size: 14,
                        color: isActive ? Colors.green : Colors.red,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        isActive ? 'Active' : 'Inactive',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: isActive ? Colors.green : Colors.red,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
