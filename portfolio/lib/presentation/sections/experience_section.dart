import 'package:flutter/material.dart';

import '../../core/constants/section_ids.dart';
import '../../core/theme/app_colors.dart';
import '../../core/utils/responsive_helper.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  static const List<Map<String, String>> experiences = [
   {
  "year": "2023",
  "role": "Diploma Student",
  "company": "Academic Learning",
  "description":
      "Focused on core computer science subjects, problem solving and software fundamentals while building interest in application development."
},
{
  "year": "2024",
  "role": "Flutter Development Learning",
  "company": "Self Learning",
  "description":
      "Started learning Dart and Flutter, explored widgets, responsive UI design, Firebase and application architecture."
},
{
  "year": "2025",
  "role": "Flutter Developer Intern",
  "company": "ASKTechSolutions",
  "description":
      "Worked on real world Flutter applications, API integrations, state management and responsive user interfaces."
},
  ];

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveHelper.isMobile(context);

    return Container(
      key: SectionIds.experience,
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 40,
        vertical: 90,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "EXPERIENCE",
            style: TextStyle(
              color: AppColors.primary,
              letterSpacing: 3,
              fontWeight: FontWeight.w600,
            ),
          ),

          const SizedBox(height: 10),

          const Text(
            "Journey Timeline",
            style: TextStyle(
              fontSize: 42,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),

          const SizedBox(height: 50),

          ...List.generate(
            experiences.length,
            (index) => TimelineCard(
              year: experiences[index]["year"]!,
              role: experiences[index]["role"]!,
              company: experiences[index]["company"]!,
              description:
                  experiences[index]["description"]!,
              isLast:
                  index == experiences.length - 1,
            ),
          ),
        ],
      ),
    );
  }
}

class TimelineCard extends StatefulWidget {
  final String year;
  final String role;
  final String company;
  final String description;
  final bool isLast;

  const TimelineCard({
    super.key,
    required this.year,
    required this.role,
    required this.company,
    required this.description,
    required this.isLast,
  });

  @override
  State<TimelineCard> createState() =>
      _TimelineCardState();
}

class _TimelineCardState
    extends State<TimelineCard> {
  bool hovered = false;

  @override
  Widget build(BuildContext context) {
    final isMobile =
        ResponsiveHelper.isMobile(context);

    return MouseRegion(
      onEnter: (_) {
        setState(() => hovered = true);
      },
      onExit: (_) {
        setState(() => hovered = false);
      },
      child: AnimatedContainer(
        duration: const Duration(
          milliseconds: 250,
        ),
        margin: const EdgeInsets.only(
          bottom: 18,
        ),
        child: Row(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Container(
                  width: 46,
                  height: 46,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color:
                        AppColors.primary,
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primary
                            .withOpacity(0.4),
                        blurRadius: 25,
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      widget.year,
                      style:
                          const TextStyle(
                        fontWeight:
                            FontWeight.bold,
                        fontSize: 12,
                        color:
                            Colors.black,
                      ),
                    ),
                  ),
                ),
                if (!widget.isLast)
                  Container(
                    width: 3,
                    height: 90,
                    color:
                        AppColors.primary,
                  ),
              ],
            ),

            const SizedBox(width: 25),

            Expanded(
              child: AnimatedContainer(
                duration:
                    const Duration(
                  milliseconds: 250,
                ),
                padding:
                    const EdgeInsets.all(
                  12,
                ),
                decoration:
                    BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(
                    18,
                  ),
                  gradient:
                      LinearGradient(
                    colors: [
                      Colors.white
                          .withOpacity(
                        0.06,
                      ),
                      Colors.white
                          .withOpacity(
                        0.02,
                      ),
                    ],
                  ),
                  border: Border.all(
                    color: hovered
                        ? AppColors.primary
                            .withOpacity(
                            0.5,
                          )
                        : AppColors
                            .border,
                  ),
                  boxShadow: hovered
                      ? [
                          BoxShadow(
                            color: AppColors
                                .primary
                                .withOpacity(
                              0.18,
                            ),
                            blurRadius:
                                35,
                          ),
                        ]
                      : [],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment:
                      CrossAxisAlignment
                          .start,
                  children: [
                    Text(
                      widget.role,
                      style:
                          const TextStyle(
                        fontSize: 16,
                        fontWeight:
                            FontWeight
                                .bold,
                        color:
                            Colors.white,
                      ),
                    ),

                    const SizedBox(
                        height: 10),

                    Text(
                      widget.company,
                      style:
                          const TextStyle(
                        color:
                            AppColors
                                .primary,
                        fontWeight:
                            FontWeight
                                .w600,
                      ),
                    ),

                    const SizedBox(
                        height: 15),

                    Text(
                      widget.description,
                      style:
                          const TextStyle(
                        color:
                            AppColors
                                .grey,
                        height: 1.8,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}