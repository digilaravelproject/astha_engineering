import 'package:flutter/material.dart';

class SkeletonLoadingList extends StatelessWidget {
  final int itemCount;

  const SkeletonLoadingList({super.key, this.itemCount = 5});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: itemCount,
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
                _buildSkeletonBox(width: 50, height: 50, borderRadius: 8),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildSkeletonBox(width: double.infinity, height: 16, borderRadius: 4),
                      const SizedBox(height: 8),
                      _buildSkeletonBox(width: 150, height: 12, borderRadius: 4),
                      const SizedBox(height: 8),
                      _buildSkeletonBox(width: 100, height: 12, borderRadius: 4),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildSkeletonBox({required double width, required double height, required double borderRadius}) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
    );
  }
}
