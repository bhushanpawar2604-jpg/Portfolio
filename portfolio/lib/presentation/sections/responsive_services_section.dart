import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';
import '../../core/utils/responsive_helper.dart';
import '../widgets/animations/hover_card.dart';

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
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment:
            CrossAxisAlignment.start,
        children: [
          const Text(
            "SERVICES",
            style: TextStyle(
              color: AppColors.primary,
              letterSpacing: 3,
            ),
          ),

          const SizedBox(height: 12),

          const Text(
            "What I Can Build",
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 35),

          GridView.count(
            shrinkWrap: true,
            physics:
                const NeverScrollableScrollPhysics(),
            crossAxisCount:
                isMobile ? 1 : 3,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            childAspectRatio: 1.3,
            children: const [
              _ServiceCard(
                icon:
                    Icons.phone_android,
                title:
                    "Flutter Apps",
                desc:
                    "Cross-platform mobile applications",
              ),
              _ServiceCard(
                icon:
                    Icons.design_services,
                title:
                    "Responsive UI",
                desc:
                    "Modern and adaptive interfaces",
              ),
              _ServiceCard(
                icon: Icons.api,
                title:
                    "API Integration",
                desc:
                    "REST API and Firebase integration",
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
  final String desc;

  const _ServiceCard({
    required this.icon,
    required this.title,
    required this.desc,
  });

  @override
  Widget build(BuildContext context) {
    return HoverCard(
      child: Container(
        padding:
            const EdgeInsets.all(18),
        decoration: BoxDecoration(
          borderRadius:
              BorderRadius.circular(
            24,
          ),
          gradient:
              LinearGradient(
            colors: [
              Colors.white
                  .withOpacity(
                0.05,
              ),
              Colors.white
                  .withOpacity(
                0.02,
              ),
            ],
          ),
          border: Border.all(
            color:
                AppColors.border,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 58,
              height: 58,
              decoration:
                  BoxDecoration(
                color:
                    AppColors.primary
                        .withOpacity(
                  0.12,
                ),
                borderRadius:
                    BorderRadius
                        .circular(
                  20,
                ),
              ),
              child: Icon(
                icon,
                size: 28,
                color: AppColors.primary,
              ),
            ),

            const SizedBox(
              height: 20,
            ),

            Text(
              title,
              style:
                  const TextStyle(
                fontSize: 18,
                fontWeight:
                    FontWeight.bold,
              ),
            ),

            const SizedBox(
              height: 10,
            ),

            Text(
              desc,
              textAlign:
                  TextAlign.center,
              style:
                  const TextStyle(
                color:
                    AppColors.grey,
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}