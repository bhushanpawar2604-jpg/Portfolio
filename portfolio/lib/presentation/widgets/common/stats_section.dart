import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';

class StatsSection extends StatelessWidget {
  const StatsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 35,
      runSpacing: 25,
      children: const [
        _StatCard(
          value: "5+",
          title: "Projects",
        ),
        _StatCard(
          value: "2+",
          title: "Years Learning",
        ),
        _StatCard(
          value: "24/7",
          title: "Learning",
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
    return Column(
      crossAxisAlignment:
          CrossAxisAlignment.start,
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: AppColors.primary,
          ),
        ),
        Text(
          title,
          style: const TextStyle(
            color: AppColors.grey,
          ),
        ),
      ],
    );
  }
}