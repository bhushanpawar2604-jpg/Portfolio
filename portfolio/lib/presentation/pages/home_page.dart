import 'package:flutter/material.dart';

import '../../core/services/scroll_service.dart';

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

import '../widgets/background/animated_background.dart';
import '../widgets/background/background_glow.dart';

import '../widgets/navigation/mobile_drawer.dart';
import '../widgets/navigation/top_navbar.dart';
import '../widgets/navigation/scroll_to_top_button.dart';
import '../widgets/effects/mouse_glow.dart';
import '../widgets/effects/floating_particles.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MobileDrawer(),

      body: MouseGlow(
        child: Stack(
        children: [
          const Positioned.fill(
            child: AnimatedBackground(),
          ),
          const Positioned.fill(
             child: FloatingParticles(),
          ),

          const Positioned.fill(
            child: BackgroundGlow(),
          ),

          SingleChildScrollView(
            controller:
                ScrollService.controller,
            child: const Column(
              children: [
                TopNavbar(),

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
        ],
      ),
      ),  

      floatingActionButton:
          const ScrollToTopButton(),
    );
  }
}