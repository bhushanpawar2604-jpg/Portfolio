import 'package:flutter/material.dart';

import '../../../core/config/portfolio_config.dart';
import '../../../core/constants/section_ids.dart';
import '../../../core/services/scroll_service.dart';
import '../../../core/theme/app_colors.dart';
import 'package:url_launcher/url_launcher.dart';

class MobileDrawer extends StatelessWidget {
  const MobileDrawer({super.key});
Future<void> _launchUrl(
  String url,
) async {
  await launchUrl(
    Uri.parse(url),
    mode: LaunchMode.externalApplication,
  );
}
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.background,
      child: ListView(
        children: [
          DrawerHeader(
            child: Text(
              PortfolioConfig.name,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
              ),
            ),
          ),

          _item(
            context,
            "Home",
            Icons.home_outlined,
            () {
              Navigator.pop(context);
              ScrollService.scrollTo(
                SectionIds.hero,
              );
            },
          ),

          _item(
            context,
            "About",
            Icons.person_outline,
            () {
              Navigator.pop(context);
              ScrollService.scrollTo(
                SectionIds.about,
              );
            },
          ),

          _item(
            context,
            "Skills",
            Icons.code,
            () {
              Navigator.pop(context);
              ScrollService.scrollTo(
                SectionIds.skills,
              );
            },
          ),

          _item(
            context,
            "Projects",
            Icons.work_outline,
            () {
              Navigator.pop(context);
              ScrollService.scrollTo(
                SectionIds.projects,
              );
            },
          ),

          _item(
            context,
            "Contact",
            Icons.mail_outline,
            () {
              Navigator.pop(context);
              ScrollService.scrollTo(
                SectionIds.contact,
              );
            },
          ),

          const Divider(),

          _item(
  context,
  "GitHub",
  Icons.code,
  () {
    _launchUrl(
      PortfolioConfig.github,
    );
  },
),

          _item(
  context,
  "LinkedIn",
  Icons.business_center,
  () {
    _launchUrl(
      PortfolioConfig.linkedin,
    );
  },
),
        ],
      ),
    );
  }

  Widget _item(
    BuildContext context,
    String title,
    IconData icon,
    VoidCallback onTap,
  ) {
    return ListTile(
      leading: Icon(
        icon,
        color: AppColors.primary,
      ),
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
      onTap: onTap,
    );
  }
}