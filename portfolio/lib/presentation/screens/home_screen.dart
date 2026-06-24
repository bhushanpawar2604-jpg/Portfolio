import 'package:flutter/material.dart';

import '../../core/services/scroll_service.dart';
import '../../core/theme/app_colors.dart';

import '../sections/about_section.dart';
import '../sections/achievements_section.dart';
import '../sections/certifications_section.dart';
import '../sections/contact_section.dart';
import '../sections/education_section.dart';
import '../sections/experience_section.dart';
import '../sections/footer_section.dart';
import '../sections/hero_section.dart';
import '../sections/projects_section.dart';
import '../sections/responsive_services_section.dart';
import '../sections/skills_section.dart';
import '../sections/tech_stack_section.dart';

import '../widgets/common/scroll_to_top_button.dart';
import '../widgets/navbar/mobile_drawer.dart';
import '../widgets/navbar/top_navbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MobileDrawer(),

      floatingActionButton:
          const ScrollToTopButton(),

      body: Container(
        decoration: const BoxDecoration(
  gradient: LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      AppColors.gradient1,
      AppColors.gradient3,
      AppColors.gradient2,
    ],
  ),
),
        child: Column(
          children: [
            const TopNavbar(),

            Expanded(
              child: SingleChildScrollView(
                controller:
                    ScrollService.controller,
                child: const Column(
                  children: [
                    HeroSection(),
                    AboutSection(),
                    SkillsSection(),
                    ResponsiveServicesSection(),
                    ProjectsSection(),
                    ExperienceSection(),
                    EducationSection(),
                    CertificationsSection(),
                    AchievementsSection(),
                    TechStackSection(),
                    ContactSection(),
                    FooterSection(),
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