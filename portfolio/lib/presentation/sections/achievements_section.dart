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
        crossAxisAlignment:
            CrossAxisAlignment.start,
        children: [
          const Text(
            "Achievements",
            style: TextStyle(
              fontSize: 38,
              fontWeight:
                  FontWeight.bold,
              color: AppColors.primary,
            ),
          ),

          const SizedBox(height: 30),

          GridView.builder(
            shrinkWrap: true,
            physics:
                const NeverScrollableScrollPhysics(),
            itemCount:
                achievements.length,
           gridDelegate:
    const SliverGridDelegateWithFixedCrossAxisCount(
  crossAxisCount: 2,
  crossAxisSpacing: 20,
  mainAxisSpacing: 20,
  childAspectRatio: 2.8,
),
            itemBuilder:
                (context, index) {
              return HoverCard(
                child: Container(
                  padding:
                      const EdgeInsets.all(
                    20,
                  ),
                  decoration: BoxDecoration(
  color: AppColors.cardColor,
  borderRadius:
      BorderRadius.circular(24),
  border: Border.all(
    color: AppColors.border,
  ),
  boxShadow: [
    BoxShadow(
      color: Colors.black.withOpacity(
        0.15,
      ),
      blurRadius: 20,
    ),
  ],
),
                  child: Row(
                    children: [
                     const Icon(
  Icons.workspace_premium,
  color: AppColors.primary,
  size: 28,
),

                      const SizedBox(
                          width: 15),

                      Expanded(
                        child: Text(
                          achievements[
                              index],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}