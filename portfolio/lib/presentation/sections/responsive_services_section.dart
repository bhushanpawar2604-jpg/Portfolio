import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';
import '../../core/utils/responsive_helper.dart';

class ResponsiveServicesSection
    extends StatelessWidget {
  const ResponsiveServicesSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile =
        ResponsiveHelper.isMobile(
      context,
    );

    return Container(
      width: double.infinity,
      padding:
          const EdgeInsets.symmetric(
        horizontal: 30,
        vertical: 80,
      ),
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,
        children: [
          const Text(
            "Services",
            style: TextStyle(
              fontSize: 38,
              fontWeight:
                  FontWeight.bold,
              color:
                  AppColors.primary,
            ),
          ),

          const SizedBox(height: 30),

          GridView.count(
            shrinkWrap: true,
            physics:
                const NeverScrollableScrollPhysics(),
            crossAxisCount:
                isMobile ? 1 : 3,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            childAspectRatio: 1.2,
            children: const [
              _ServiceCard(
                icon:
                    Icons.phone_android,
                title:
                    "Flutter Apps",
              ),
              _ServiceCard(
                icon:
                    Icons.design_services,
                title:
                    "UI Design",
              ),
              _ServiceCard(
                icon: Icons.api,
                title:
                    "API Integration",
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ServiceCard
    extends StatelessWidget {
  final IconData icon;
  final String title;

  const _ServiceCard({
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color:
            AppColors.cardColor,
        borderRadius:
            BorderRadius.circular(
          20,
        ),
      ),
      child: Column(
        mainAxisAlignment:
            MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 50,
            color:
                AppColors.primary,
          ),

          const SizedBox(
            height: 20,
          ),

          Text(
            title,
            style:
                const TextStyle(
              fontSize: 20,
              fontWeight:
                  FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}