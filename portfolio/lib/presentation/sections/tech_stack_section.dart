import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';
import '../../core/utils/responsive_helper.dart';
import '../widgets/animations/hover_card.dart';

class TechStackSection extends StatelessWidget {
  const TechStackSection({super.key});

  final List<Map<String, dynamic>> technologies = const [
    {
      "name": "Flutter",
      "icon": Icons.flutter_dash,
    },
    {
      "name": "Dart",
      "icon": Icons.code,
    },
    {
      "name": "Firebase",
      "icon": Icons.local_fire_department,
    },
    {
      "name": "REST API",
      "icon": Icons.api,
    },
    {
      "name": "Git",
      "icon": Icons.source,
    },
    {
      "name": "GitHub",
      "icon": Icons.code_off,
    },
    {
      "name": "VS Code",
      "icon": Icons.computer,
    },
    {
      "name": "Android Studio",
      "icon": Icons.android,
    },
    {
      "name": "Figma",
      "icon": Icons.design_services,
    },
    {
      "name": "Provider",
      "icon": Icons.account_tree,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final isMobile =
        ResponsiveHelper.isMobile(context);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 30,
        vertical: 80,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment:
            CrossAxisAlignment.start,
        children: [
          const Text(
            "TECH STACK",
            style: TextStyle(
              color: AppColors.primary,
              letterSpacing: 3,
              fontWeight: FontWeight.w600,
            ),
          ),

          const SizedBox(height: 12),

          const Text(
            "Technologies I Use",
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),

          const SizedBox(height: 35),

          GridView.builder(
            shrinkWrap: true,
            physics:
                const NeverScrollableScrollPhysics(),
            itemCount: technologies.length,
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount:
                  isMobile ? 2 : 4,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              childAspectRatio: 1.35,
            ),
            itemBuilder: (context, index) {
              final tech =
                  technologies[index];

              return HoverCard(
                child: Container(
                  decoration: BoxDecoration(
                    gradient:
                        LinearGradient(
                      begin:
                          Alignment.topLeft,
                      end: Alignment
                          .bottomRight,
                      colors: [
                        Colors.white
                            .withOpacity(
                          0.05,
                        ),
                        Colors.white
                            .withOpacity(
                          0.02,
                        ),
                      ],
                    ),
                    borderRadius:
                        BorderRadius
                            .circular(
                      24,
                    ),
                    border: Border.all(
                      color:
                          AppColors.border,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors
                            .primary
                            .withOpacity(
                          0.08,
                        ),
                        blurRadius: 20,
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 52,
                        height: 52,
                        decoration:
                            BoxDecoration(
                          color: AppColors
                              .primary
                              .withOpacity(
                            0.12,
                          ),
                          borderRadius:
                              BorderRadius
                                  .circular(
                            18,
                          ),
                        ),
                        child: Icon(
                          tech["icon"],
                          size: 26,
                          color: AppColors
                              .primary,
                        ),
                      ),

                      const SizedBox(
                        height: 18,
                      ),

                      Text(
                        tech["name"],
                        textAlign:
                            TextAlign.center,
                        style:
                            const TextStyle(
                          color:
                              Colors.white,
                          fontWeight:
                              FontWeight
                                  .w600,
                          fontSize: 13,
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