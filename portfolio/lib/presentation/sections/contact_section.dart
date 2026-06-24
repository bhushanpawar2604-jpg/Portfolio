import 'package:flutter/material.dart';

import '../../core/config/portfolio_config.dart';
import '../../core/constants/section_ids.dart';
import '../../core/services/url_launcher_service.dart';
import '../../core/utils/responsive_helper.dart';
import '../../core/theme/app_colors.dart';

import '../widgets/common/section_subtitle.dart';
import '../widgets/common/section_title.dart';
import '../widgets/contact/contact_form.dart';
import '../widgets/contact/contact_info_card.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  Future<void> _launchUrl(String url) async {
    await UrlLauncherService.launchUrlLink(
      url,
    );
  }

  Future<void> _launchEmail() async {
    await UrlLauncherService.launchEmail(
      PortfolioConfig.email,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      key: SectionIds.contact,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 30,
        vertical: 80,
      ),
      child: Column(
        children: [
        const Text(
  "GET IN TOUCH",
  style: TextStyle(
    color:AppColors.primary,
    letterSpacing: 3,
    fontWeight: FontWeight.w600,
  ),
),
const SizedBox(height: 12),

const Text(
  "Let's Work Together",
  style: TextStyle(
    fontSize: 42,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  ),
),

          const SizedBox(height: 15),

          const SectionSubtitle(
            text:
                "Feel free to reach out for collaboration, internship opportunities, or Flutter projects.",
          ),

          const SizedBox(height: 40),

          ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 900,
            ),
            child: ResponsiveHelper.isMobile(
              context,
            )
                ? Column(
                    children: [
                      ContactInfoCard(
                        icon: Icons.email_outlined,
                        title: "Email",
                        value: PortfolioConfig.email,
                        onTap: _launchEmail,
                      ),

                      const SizedBox(height: 15),

                      ContactInfoCard(
                        icon: Icons.code,
                        title: "GitHub",
                        value: PortfolioConfig.github,
                        onTap: () => _launchUrl(
                          PortfolioConfig.github,
                        ),
                      ),

                      const SizedBox(height: 15),

                      ContactInfoCard(
                        icon: Icons.work,
                        title: "LinkedIn",
                        value: PortfolioConfig.linkedin,
                        onTap: () => _launchUrl(
                          PortfolioConfig.linkedin,
                        ),
                      ),

                      const SizedBox(height: 30),

                      const ContactForm(),
                    ],
                  )
                : Row(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            ContactInfoCard(
                              icon: Icons.email_outlined,
                              title: "Email",
                              value: PortfolioConfig.email,
                              onTap: _launchEmail,
                            ),

                            const SizedBox(height: 15),

                            ContactInfoCard(
                              icon: Icons.code,
                              title: "GitHub",
                              value: PortfolioConfig.github,
                              onTap: () => _launchUrl(
                                PortfolioConfig.github,
                              ),
                            ),

                            const SizedBox(height: 15),

                            ContactInfoCard(
                              icon: Icons.work,
                              title: "LinkedIn",
                              value: PortfolioConfig.linkedin,
                              onTap: () => _launchUrl(
                                PortfolioConfig.linkedin,
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(width: 30),

                      const Expanded(
                        child: ContactForm(),
                      ),
                    ],
                  ),
          ),
        ],
      ),
    );
  }
}