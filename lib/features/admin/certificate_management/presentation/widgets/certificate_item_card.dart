import 'package:flutter/material.dart';
import 'package:astha_engineering/core/theme/app_colors.dart';

class CertificateItemCard extends StatelessWidget {
  final String certificateNumber;
  final String equipmentName;
  final String issueDate;

  const CertificateItemCard({
    super.key,
    required this.certificateNumber,
    required this.equipmentName,
    required this.issueDate,
  });

  @override
  Widget build(BuildContext context) {
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
                    certificateNumber,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimaryLight,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text('Equipment: $equipmentName', style: const TextStyle(color: Colors.black87, fontSize: 13)),
                  const SizedBox(height: 2),
                  Text('Issued: $issueDate', style: const TextStyle(color: Colors.grey, fontSize: 12)),
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
  }
}
