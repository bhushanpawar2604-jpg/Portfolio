import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';
import '../widgets/animations/hover_card.dart';

class AchievementsSection
    extends StatelessWidget {
  const AchievementsSection({
    super.key,
  });

  final List<String> achievements =
      const [
    "Completed Flutter Internship",
    "Built Multiple Flutter Projects",
    "Created Responsive Flutter Web Apps",
    "Worked with Firebase & REST APIs",
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding:
          const EdgeInsets.symmetric(
        horizontal: 30,
        vertical: 80,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment:
            CrossAxisAlignment.start,
        children: [
          const Text(
            "Achievements",
            style: TextStyle(
              fontSize: 18,
              fontWeight:
                  FontWeight.bold,
              color: AppColors.primary,
            ),
          ),

          const SizedBox(height: 30),

          Wrap(
  spacing: 18,
  runSpacing: 18,
  children: achievements.map((e) {
    return SizedBox(
      width: 320,
      child: AchievementCard(text: e),
    );
  }).toList(),
),
        ],
      ),
    );
  }
}

class AchievementCard extends StatelessWidget {
  final String text;

  const AchievementCard({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return HoverCard(
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        decoration: BoxDecoration(
          color: AppColors.cardColor,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: AppColors.border,
          ),
        ),
        child: Row(
          children: [
            const Icon(
              Icons.workspace_premium,
              color: AppColors.primary,
              size: 22,
            ),

            const SizedBox(width: 12),

            Expanded(
              child: Text(
                text,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}