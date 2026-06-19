import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';

class StatsSection extends StatelessWidget {
  const StatsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 30,
      runSpacing: 20,
      children: const [
        _StatCard(
          value: "10+",
          title: "Projects",
        ),
        _StatCard(
          value: "1",
          title: "Internship",
        ),
        _StatCard(
          value: "5+",
          title: "Certificates",
        ),
      ],
    );
  }
}

class _StatCard extends StatelessWidget {
  final String value;
  final String title;

  const _StatCard({
    required this.value,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.cardColor,
        borderRadius:
            BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Text(
            value,
            style: const TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            title,
            style: const TextStyle(
              color: AppColors.grey,
            ),
          ),
        ],
      ),
    );
  }
}