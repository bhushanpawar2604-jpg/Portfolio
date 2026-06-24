import 'package:flutter/material.dart';

import '../../core/constants/section_ids.dart';
import '../../core/theme/app_colors.dart';
import '../../core/utils/responsive_helper.dart';

class EducationSection extends StatelessWidget {
  const EducationSection({super.key});

  static const List<Map<String, String>>
      educationList = [
    {
      "year": "2022 - Present",
      "degree": "Diploma in Computer Engineering",
      "institute":
          "CSMSS Polytechnic, Chhatrapati Sambhajinagar",
      "description":
          "Building a strong foundation in software development, programming concepts and mobile application development."
    },
    {
      "year": "2020 - 2022",
      "degree": "Secondary Education",
      "institute":
          "Saraswati Bhuwan School",
      "description":
          "Completed academic studies while developing interest in technology and software engineering."
    }
  ];

  @override
  Widget build(BuildContext context) {
    final isMobile =
        ResponsiveHelper.isMobile(context);

    return Container(
      key: SectionIds.education,
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 40,
        vertical: 90,
      ),
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,
        children: [
          const Text(
            "EDUCATION",
            style: TextStyle(
              color: AppColors.accentPink,
              letterSpacing: 3,
              fontWeight: FontWeight.w600,
            ),
          ),

          const SizedBox(height: 10),

          const Text(
            "Academic Background",
            style: TextStyle(
              fontSize: 42,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),

          const SizedBox(height: 50),

          ...educationList.map(
            (education) =>
                EducationCard(
              year: education["year"]!,
              degree:
                  education["degree"]!,
              institute:
                  education["institute"]!,
              description:
                  education[
                      "description"]!,
            ),
          ),
        ],
      ),
    );
  }
}

class EducationCard
    extends StatefulWidget {
  final String year;
  final String degree;
  final String institute;
  final String description;

  const EducationCard({
    super.key,
    required this.year,
    required this.degree,
    required this.institute,
    required this.description,
  });

  @override
  State<EducationCard> createState() =>
      _EducationCardState();
}

class _EducationCardState
    extends State<EducationCard> {
  bool hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() => hovered = true);
      },
      onExit: (_) {
        setState(() => hovered = false);
      },
      child: AnimatedContainer(
        duration:
            const Duration(
          milliseconds: 250,
        ),
        margin:
            const EdgeInsets.only(
          bottom: 25,
        ),
        padding:
            const EdgeInsets.all(
          25,
        ),
        decoration: BoxDecoration(
          borderRadius:
              BorderRadius.circular(
            28,
          ),
          gradient: LinearGradient(
            colors: [
              Colors.white
                  .withOpacity(0.06),
              Colors.white
                  .withOpacity(0.02),
            ],
          ),
          border: Border.all(
            color: hovered
                ? AppColors
                    .accentPink
                    .withOpacity(
                    0.5,
                  )
                : AppColors.border,
          ),
          boxShadow: hovered
              ? [
                  BoxShadow(
                    color: AppColors
                        .accentPink
                        .withOpacity(
                      0.20,
                    ),
                    blurRadius: 35,
                  ),
                ]
              : [],
        ),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [
            Container(
              padding:
                  const EdgeInsets.symmetric(
                horizontal: 14,
                vertical: 8,
              ),
              decoration:
                  BoxDecoration(
                color: AppColors
                    .accentPink
                    .withOpacity(
                  0.12,
                ),
                borderRadius:
                    BorderRadius.circular(
                  50,
                ),
              ),
              child: Text(
                widget.year,
                style:
                    const TextStyle(
                  color: AppColors
                      .accentPink,
                  fontWeight:
                      FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 18),

            Text(
              widget.degree,
              style:
                  const TextStyle(
                fontSize: 26,
                fontWeight:
                    FontWeight.bold,
                color:
                    Colors.white,
              ),
            ),

            const SizedBox(height: 10),

            Text(
              widget.institute,
              style:
                  const TextStyle(
                color:
                    AppColors.primary,
                fontWeight:
                    FontWeight.w600,
              ),
            ),

            const SizedBox(height: 15),

            Text(
              widget.description,
              style:
                  const TextStyle(
                color:
                    AppColors.grey,
                height: 1.8,
              ),
            ),
          ],
        ),
      ),
    );
  }
}