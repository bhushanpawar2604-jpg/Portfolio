import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../core/config/portfolio_config.dart';
import '../../core/constants/section_ids.dart';
import '../../core/theme/app_colors.dart';
import '../../core/utils/responsive_helper.dart';
import '../widgets/buttons/custom_button.dart';
import '../../core/services/scroll_service.dart';



class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveHelper.isMobile(context);

    return Container(
      key: SectionIds.hero,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 30,
        vertical: 80,
      ),
      child: isMobile
          ? const Column(
              children: [
                _ProfileImage(),
                SizedBox(height: 40),
                _HeroContent(),
              ],
            )
          : const Row(
              children: [
                Expanded(
                  flex: 2,
                  child: _HeroContent(),
                ),
                Expanded(
                  child: Center(
                    child: _ProfileImage(),
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
    final uri = Uri.parse(
      PortfolioConfig.resumeLink,
    );

    await launchUrl(uri);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Hello, I'm",
          style: TextStyle(
            fontSize: 22,
            color: AppColors.grey,
          ),
        ),

        const SizedBox(height: 10),

        Text(
          PortfolioConfig.name,
          style: const TextStyle(
            fontSize: 52,
            fontWeight: FontWeight.bold,
            color: AppColors.white,
          ),
        ),

        const SizedBox(height: 15),

        SizedBox(
          height: 40,
          child: AnimatedTextKit(
            repeatForever: true,
            animatedTexts: [
              TypewriterAnimatedText(
                "Flutter Developer",
                speed: const Duration(
                  milliseconds: 80,
                ),
                textStyle: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primary,
                ),
              ),
              TypewriterAnimatedText(
                "Mobile App Developer",
                speed: const Duration(
                  milliseconds: 80,
                ),
                textStyle: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primary,
                ),
              ),
              TypewriterAnimatedText(
                "Flutter Web Developer",
                speed: const Duration(
                  milliseconds: 80,
                ),
                textStyle: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primary,
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 25),

        Text(
          PortfolioConfig.shortBio,
          style: const TextStyle(
            fontSize: 18,
            color: AppColors.grey,
            height: 1.6,
          ),
        ),

        const SizedBox(height: 35),

        Wrap(
          spacing: 15,
          runSpacing: 15,
          children: [
            CustomButton(
  text: "View Projects",
  icon: Icons.work_outline,
  onPressed: () {
    ScrollService.scrollTo(
      SectionIds.projects,
    );
  },
),

            CustomButton(
              text: "Download Resume",
              icon: Icons.download,
              onPressed: _openResume,
            ),
          ],
        ),
      ],
    );
  }
}

class _ProfileImage extends StatelessWidget {
  const _ProfileImage();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320,
      height: 320,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: AppColors.primary,
          width: 2,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withOpacity(
              0.30,
            ),
            blurRadius: 30,
            spreadRadius: 5,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(22),
        child: Image.asset(
          'assets/images/profile.png',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}