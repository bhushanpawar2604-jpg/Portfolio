import 'package:flutter/material.dart';

import '../../core/constants/section_ids.dart';
import '../../core/theme/app_colors.dart';
import '../../core/utils/responsive_helper.dart';

import '../widgets/common/glass_container.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile =
        ResponsiveHelper.isMobile(context);

    return Container(
      key: SectionIds.about,
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
            "ABOUT ME",
            style: TextStyle(
              color: AppColors.primary,
              letterSpacing: 3,
              fontWeight: FontWeight.w600,
            ),
          ),

          const SizedBox(height: 12),

          const Text(
            "Who I Am",
            style: TextStyle(
              fontSize: 42,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),

          const SizedBox(height: 25),

          GlassContainer(
            child: Padding(
              padding:
                  const EdgeInsets.all(8),
              child: Text(
                "I'm a Flutter Developer passionate about building modern mobile and web applications. I enjoy creating responsive user interfaces, integrating APIs, working with Firebase, and writing scalable code. My focus is on performance, clean architecture, and delivering smooth user experiences.",
                style: TextStyle(
                  color: AppColors.grey,
                  fontSize:
                      isMobile ? 15 : 17,
                  height: 1.9,
                ),
              ),
            ),
          ),

          const SizedBox(height: 40),

          GridView.count(
            shrinkWrap: true,
            physics:
                const NeverScrollableScrollPhysics(),
            crossAxisCount:
                isMobile ? 1 : 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            childAspectRatio:
                isMobile ? 2.0 : 2.2,
            children: const [
              AboutCard(
                icon: Icons.phone_android,
                title: "Flutter",
                value:
                    "Cross Platform Development",
              ),
              AboutCard(
                icon: Icons.design_services,
                title: "UI/UX",
                value:
                    "Modern Responsive Interfaces",
              ),
              AboutCard(
                icon: Icons.architecture,
                title: "Architecture",
                value:
                    "Clean & Scalable Code",
              ),
              AboutCard(
                icon: Icons.cloud,
                title: "Backend",
                value:
                    "Firebase & REST APIs",
              ),
            ],
          ),

          const SizedBox(height: 50),
ResponsiveHelper.isMobile(context)
    ? Column(
        children: const [
          HighlightCard(
            value: "15+",
            label: "Projects Built",
          ),
          SizedBox(height: 15),
          HighlightCard(
            value: "1+",
            label: "Years Learning",
          ),
          SizedBox(height: 15),
          HighlightCard(
            value: "100%",
            label: "Dedication",
          ),
        ],
      )
    : Row(
        children: const [
          Expanded(
            child: HighlightCard(
              value: "15+",
              label: "Projects Built",
            ),
          ),
          SizedBox(width: 15),
          Expanded(
            child: HighlightCard(
              value: "1+",
              label: "Years Learning",
            ),
          ),
          SizedBox(width: 15),
          Expanded(
            child: HighlightCard(
              value: "100%",
              label: "Dedication",
            ),
          ),
        ],
      ),
        ],
      ),
    );
  }
}

class AboutCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;

  const AboutCard({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return GlassContainer(
      child: Row(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: AppColors.primary
                  .withOpacity(0.12),
              borderRadius:
                  BorderRadius.circular(16),
            ),
            child: Icon(
              icon,
              color: AppColors.primary,
              size: 28,
            ),
          ),

          const SizedBox(width: 18),

          Expanded(
            child: Column(
              mainAxisAlignment:
                  MainAxisAlignment.center,
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style:
                      const TextStyle(
                    color:
                        Colors.white,
                    fontSize: 20,
                    fontWeight:
                        FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 6),

                Text(
                  value,
                  style:
                      const TextStyle(
                    color:
                        AppColors.grey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class HighlightCard extends StatelessWidget {
  final String value;
  final String label;

  const HighlightCard({
    super.key,
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return GlassContainer(
      child: Column(
        children: [
          ShaderMask(
            shaderCallback: (bounds) {
              return const LinearGradient(
                colors: [
                  AppColors.primary,
                  AppColors.secondary,
                ],
              ).createShader(bounds);
            },
            child: Text(
              value,
              style: const TextStyle(
                fontSize: 34,
                fontWeight:
                    FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),

          const SizedBox(height: 10),

          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: AppColors.grey,
            ),
          ),
        ],
      ),
    );
  }
}