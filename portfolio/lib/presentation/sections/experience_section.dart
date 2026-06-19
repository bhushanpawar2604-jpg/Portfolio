import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';
import '../widgets/animations/hover_card.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  final List<Map<String, String>> experiences = const [
    {
      "year": "2025",
      "role": "Flutter Developer Intern",
      "company": "Your Company",
      "description":
          "Worked on Flutter applications, API integration, state management and responsive UI development."
    },
    {
      "year": "2024",
      "role": "Personal Flutter Projects",
      "company": "Self Learning",
      "description":
          "Built portfolio projects including E-Commerce App, Music App and Productivity Apps."
    },
    {
      "year": "2023",
      "role": "Started Flutter Journey",
      "company": "Learning Phase",
      "description":
          "Learned Dart, Flutter fundamentals, widgets, state management and app architecture."
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 30,
        vertical: 80,
      ),
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,
        children: [
          const Text(
            "Experience Timeline",
            style: TextStyle(
              fontSize: 38,
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
            ),
          ),

          const SizedBox(height: 40),

          ...experiences.map(
            (experience) => HoverCard(
              child: Container(
                margin:
                    const EdgeInsets.only(
                  bottom: 25,
                ),
                padding:
                    const EdgeInsets.all(25),
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
      blurRadius: 25,
      spreadRadius: 2,
    ),
  ],
),
                child: Row(
                  crossAxisAlignment:
                      CrossAxisAlignment
                          .start,
                  children: [
                    Container(
                      width: 90,
                      alignment:
                          Alignment.center,
                      child: Text(
  experience["year"]!,
  style: const TextStyle(
    color: AppColors.primary,
    fontSize: 24,
    fontWeight: FontWeight.bold,
  ),
),
                    ),

                    const SizedBox(
                        width: 20),

                    Expanded(
                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment
                                .start,
                        children: [
                          Text(
                            experience[
                                "role"]!,
                            style:
                                const TextStyle(
                              fontSize:
                                  22,
                              fontWeight:
                                  FontWeight
                                      .bold,
                            ),
                          ),

                          const SizedBox(
                              height: 8),

                          Text(
                            experience[
                                "company"]!,
                            style:
                                const TextStyle(
                              color:
                                  AppColors
                                      .primary,
                            ),
                          ),

                          const SizedBox(
                              height: 12),

                          Text(
                            experience[
                                "description"]!,
                            style:
                                const TextStyle(
                              color:
                                  AppColors
                                      .grey,
                              height:
                                  1.6,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}