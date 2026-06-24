import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

import '../../core/config/portfolio_config.dart';
import '../../core/constants/section_ids.dart';
import '../../core/services/resume_service.dart';
import '../../core/services/scroll_service.dart';
import '../../core/theme/app_colors.dart';
import '../../core/utils/responsive_helper.dart';

import '../widgets/animations/fade_slide_animation.dart';
import '../widgets/animations/floating_animation.dart';
import '../widgets/buttons/custom_button.dart';
import '../widgets/common/stats_section.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile =
        ResponsiveHelper.isMobile(context);

    return Container(
      key: SectionIds.hero,
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 60,
        vertical: isMobile ? 60 : 100,
      ),
      child: isMobile
          ? const Column(
              children: [
                FloatingAnimation(
                  offset: 12,
                  child: _ProfileImage(),
                ),
                SizedBox(height: 40),
                _HeroContent(),
              ],
            )
          : const Row(
              crossAxisAlignment:
                  CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 6,
                  child: _HeroContent(),
                ),
                SizedBox(width: 40),
                Expanded(
                  flex: 4,
                  child: Center(
                    child: FloatingAnimation(
                      offset: 12,
                      child: _ProfileImage(),
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
class _HeroContent extends StatelessWidget {
  const _HeroContent();

  Future<void> _openResume() async {
    await ResumeService.openResume();
  }

  @override
  Widget build(BuildContext context) {
    final isMobile =
        ResponsiveHelper.isMobile(context);

    return FadeSlideAnimation(
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,
        children: [
          Container(
            padding:
                const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
            decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.circular(50),
              color: AppColors.primary
                  .withOpacity(0.12),
              border: Border.all(
                color: AppColors.primary
                    .withOpacity(0.25),
              ),
            ),
            child: const Text(
              "🚀 Available For Work",
              style: TextStyle(
                color: AppColors.primary,
                fontWeight:
                    FontWeight.w600,
              ),
            ),
          ),

          const SizedBox(height: 25),

          const Text(
            "HELLO I'M",
            style: TextStyle(
              color: AppColors.grey,
              letterSpacing: 3,
              fontWeight: FontWeight.w600,
            ),
          ),

          const SizedBox(height: 15),

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
              PortfolioConfig.name,
              style: TextStyle(
                fontSize:
                    isMobile ? 42 : 72,
                fontWeight:
                    FontWeight.bold,
                color: Colors.white,
                height: 1.1,
              ),
            ),
          ),

          const SizedBox(height: 20),

          SizedBox(
            height: 50,
            child: AnimatedTextKit(
              repeatForever: true,
              animatedTexts: [
                ...PortfolioConfig.roles.map(
                  (role) =>
                      TypewriterAnimatedText(
                    role,
                    speed:
                        const Duration(
                      milliseconds: 80,
                    ),
                    textStyle:
                        TextStyle(
                      fontSize:
                          isMobile
                              ? 22
                              : 28,
                      fontWeight:
                          FontWeight.bold,
                      color:
                          AppColors.primary,
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 25),

          ConstrainedBox(
            constraints:
                const BoxConstraints(
              maxWidth: 650,
            ),
            child: Text(
              PortfolioConfig.shortBio,
              style: TextStyle(
                fontSize:
                    isMobile ? 16 : 18,
                height: 1.8,
                color: AppColors.grey,
              ),
            ),
          ),

          const SizedBox(height: 35),

          Wrap(
            spacing: 15,
            runSpacing: 15,
            children: [
              CustomButton(
                text: "Explore My Work",
                icon:
                    Icons.work_outline,
                onPressed: () {
                  ScrollService.scrollTo(
                    SectionIds.projects,
                  );
                },
              ),
              CustomButton(
                text:
                    "Download Resume",
                icon: Icons.download,
                onPressed:
                    _openResume,
              ),
            ],
          ),

          const SizedBox(height: 50),

          const StatsSection(),
        ],
      ),
    );
  }
}

class _ProfileImage extends StatelessWidget {
  const _ProfileImage();

  @override
  Widget build(BuildContext context) {
    return FloatingAnimation(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 340,
            height: 340,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
  BoxShadow(
    color: AppColors.cyanGlow
        .withOpacity(0.40),
    blurRadius: 80,
    spreadRadius: 20,
  ),
  BoxShadow(
    color: AppColors.purpleGlow
        .withOpacity(0.25),
    blurRadius: 100,
    spreadRadius: 15,
  ),
],
            ),
          ),

          Container(
            width: 320,
            height: 320,
            padding:
                const EdgeInsets.all(5),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient:
                  const LinearGradient(
                colors: [
                  AppColors.primary,
                  AppColors.secondary,
                ],
              ),
            ),
            child: Container(
              decoration:
                  const BoxDecoration(
                shape: BoxShape.circle,
                color:
                    AppColors.background,
              ),
              child: ClipOval(
                child: Image.asset(
                  "assets/images/profile.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}