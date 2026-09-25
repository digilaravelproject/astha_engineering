import 'package:flutter/material.dart';
import 'package:safecheck_techno/core/theme/app_colors.dart';

class CustomerCertificatesScreen extends StatelessWidget {
  const CustomerCertificatesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'My Certificates',
          style: TextStyle(
            color: AppColors.primary,
            fontWeight: FontWeight.w800,
            fontSize: 20,
          ),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: 3, // Dummy count
        itemBuilder: (context, index) {
          final certs = [
            {'id': 'CERT-2023-001', 'eq': 'CPB-001', 'site': 'Turbhe MIDC', 'date': '12 Oct 2023', 'status': 'Valid'},
            {'id': 'CERT-2023-002', 'eq': 'EOT-102', 'site': 'Turbhe MIDC', 'date': '05 Nov 2023', 'status': 'Valid'},
            {'id': 'CERT-2022-099', 'eq': 'LFT-045', 'site': 'Chakan Warehouse', 'date': '10 Jan 2022', 'status': 'Expired'},
          ];

          final cert = certs[index];
          final isExpired = cert['status'] == 'Expired';

          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: BorderSide(color: Colors.grey.shade200),
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.all(16),
              leading: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: isExpired ? Colors.red.withValues(alpha: 0.1) : Colors.green.withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.verified,
                  color: isExpired ? Colors.red : Colors.green,
                ),
              ),
              title: Text(
                cert['id']!,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 6),
                  Text('Equipment: ${cert['eq']}'),
                  Text('Site: ${cert['site']}'),
                  const SizedBox(height: 4),
                  Text(
                    'Issued: ${cert['date']}',
                    style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
                  ),
                ],
              ),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    cert['status']!,
                    style: TextStyle(
                      color: isExpired ? Colors.red : Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Icon(Icons.picture_as_pdf, color: Colors.redAccent),
                ],
              ),
              onTap: () {
                // Open PDF Viewer
              },
            ),
          );
        },
      ),
    );
  }
}
