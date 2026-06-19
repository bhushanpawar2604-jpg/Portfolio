import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../core/config/portfolio_config.dart';
import '../../core/constants/section_ids.dart';
import '../../core/theme/app_colors.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    );
  }

  Future<void> _launchEmail() async {
    final uri = Uri(
      scheme: 'mailto',
      path: PortfolioConfig.email,
    );

    await launchUrl(uri);
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
            "Let's Work Together",
            style: TextStyle(
              fontSize: 38,
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
            ),
          ),

          const SizedBox(height: 15),

          const Text(
            "Feel free to reach out for collaboration, internship opportunities, or Flutter projects.",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.grey,
              height: 1.6,
            ),
          ),

          const SizedBox(height: 40),

          ContactCard(
            icon: Icons.email_outlined,
            title: "Email",
            value: PortfolioConfig.email,
            onTap: _launchEmail,
          ),

          const SizedBox(height: 20),

          ContactCard(
            icon: Icons.code,
            title: "GitHub",
            value: PortfolioConfig.github,
            onTap: () => _launchUrl(
              PortfolioConfig.github,
            ),
          ),

          const SizedBox(height: 20),

          ContactCard(
            icon: Icons.work_outline,
            title: "LinkedIn",
            value: PortfolioConfig.linkedin,
            onTap: () => _launchUrl(
              PortfolioConfig.linkedin,
            ),
          ),
        ],
      ),
    );
  }
}

class ContactCard extends StatefulWidget {
  final IconData icon;
  final String title;
  final String value;
  final VoidCallback onTap;

  const ContactCard({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
    required this.onTap,
  });

  @override
  State<ContactCard> createState() =>
      _ContactCardState();
}

class _ContactCardState
    extends State<ContactCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          isHovered = true;
        });
      },
      onExit: (_) {
        setState(() {
          isHovered = false;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(
          milliseconds: 200,
        ),
        width: 700,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: AppColors.cardColor,
          borderRadius:
              BorderRadius.circular(20),
          border: Border.all(
            color: isHovered
                ? AppColors.primary
                : AppColors.border,
          ),
          boxShadow: isHovered
              ? [
                  BoxShadow(
                    color: AppColors.primary
                        .withOpacity(0.20),
                    blurRadius: 20,
                  ),
                ]
              : [],
        ),
        child: InkWell(
          onTap: widget.onTap,
          child: Row(
            children: [
              Icon(
                widget.icon,
                color: AppColors.primary,
              ),

              const SizedBox(width: 20),

              Expanded(
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment
                          .start,
                  children: [
                    Text(
                      widget.title,
                      style:
                          const TextStyle(
                        fontWeight:
                            FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 4),

                    Text(
                      widget.value,
                      style:
                          const TextStyle(
                        color:
                            AppColors.grey,
                      ),
                    ),
                  ],
                ),
              ),

              const Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: AppColors.primary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}