import 'package:safecheck_techno/core/constants/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:safecheck_techno/core/theme/app_colors.dart';
import 'package:safecheck_techno/routes/app_routes.dart';

class EngineerSiteOverviewScreen extends StatelessWidget {
  final String siteName;

  const EngineerSiteOverviewScreen({
    super.key,
    required this.siteName,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        elevation: 0,
        title: Text(
          siteName,
          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 18, color: Colors.white),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Column(
        children: [
          _buildSiteDetailsHeader(),
          Expanded(
            child: _buildEquipmentList(),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          context.pushNamed(Routes.engineerInspectionScanner.substring(1));
        },
        backgroundColor: AppColors.primary,
        icon: const Icon(Icons.qr_code_scanner, color: Colors.white),
        label: Text(AppStrings.scanQrBarcode, style: TextStyle(color: Colors.white)),
      ),
    );
  }

  Widget _buildSiteDetailsHeader() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(24),
          bottomRight: Radius.circular(24),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.location_on, color: Colors.white70, size: 16),
              const SizedBox(width: 8),
              Text(
                'Plot No 14, Navi Mumbai Industrial Area',
                style: TextStyle(color: Colors.white.withValues(alpha: 0.9), fontSize: 14),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              const Icon(Icons.person, color: Colors.white70, size: 16),
              const SizedBox(width: 8),
              Text(
                'Contact: Rahul Sharma (+91 9876543210)',
                style: TextStyle(color: Colors.white.withValues(alpha: 0.9), fontSize: 14),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(AppStrings.totalEquipment, style: TextStyle(color: Colors.white70, fontSize: 12)),
                    SizedBox(height: 4),
                    Text('12', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(AppStrings.pendingInspection, style: TextStyle(color: Colors.white70, fontSize: 12)),
                    SizedBox(height: 4),
                    Text('2', style: TextStyle(color: Colors.orangeAccent, fontSize: 18, fontWeight: FontWeight.bold)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEquipmentList() {
    final equipmentList = [
      {'name': 'Chain Pulley Block - 5 Ton', 'id': 'CPB-001', 'status': 'Pending', 'dueDate': 'Today'},
      {'name': 'EOT Crane - 10 Ton', 'id': 'EOT-102', 'status': 'Pending', 'dueDate': 'Tomorrow'},
      {'name': 'Passenger Lift', 'id': 'LFT-045', 'status': 'Completed', 'dueDate': '-'},
      {'name': 'Hydraulic Press', 'id': 'HYD-009', 'status': 'Completed', 'dueDate': '-'},
    ];

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: equipmentList.length,
      itemBuilder: (context, index) {
        final eq = equipmentList[index];
        final isPending = eq['status'] == 'Pending';

        return Card(
          margin: const EdgeInsets.only(bottom: 12),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(color: Colors.grey.shade200),
          ),
          child: ListTile(
            contentPadding: const EdgeInsets.all(16),
            title: Text(
              eq['name']!,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(Icons.tag, size: 14, color: Colors.grey),
                    const SizedBox(width: 4),
                    Text(eq['id']!, style: TextStyle(color: Colors.grey.shade700)),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                      decoration: BoxDecoration(
                        color: isPending ? Colors.orange.withValues(alpha: 0.1) : Colors.green.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        eq['status']!,
                        style: TextStyle(
                          color: isPending ? Colors.orange.shade800 : Colors.green,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    if (isPending) ...[
                      const SizedBox(width: 12),
                      const Icon(Icons.timer, size: 14, color: Colors.orange),
                      const SizedBox(width: 4),
                      Text(
                        'Due: ${eq['dueDate']}',
                        style: const TextStyle(color: Colors.orange, fontSize: 12, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ],
                ),
              ],
            ),
            trailing: isPending
                ? ElevatedButton(
                    onPressed: () {
                      context.pushNamed(Routes.engineerInspectionScanner.substring(1));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                    ),
                    child: Text(AppStrings.start),
                  )
                : IconButton(
                    icon: const Icon(Icons.remove_red_eye, color: AppColors.primary),
                    onPressed: () {
                      // View past report
                    },
                  ),
          ),
        );
      },
    );
  }
}
