import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../core/config/portfolio_config.dart';
import '../../../core/services/scroll_service.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/utils/responsive_helper.dart';

import 'nav_item.dart';
import 'social_icon_button.dart';

class TopNavbar extends StatefulWidget {
  const TopNavbar({super.key});

  @override
  State<TopNavbar> createState() => _TopNavbarState();
}

class _TopNavbarState extends State<TopNavbar> {
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    if (ResponsiveHelper.isMobile(context)) {
      return const _MobileNavbar();
    }

    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 30,
        vertical: 20,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 25,
            sigmaY: 25,
          ),
          child: Container(
            height: 85,
            padding: const EdgeInsets.symmetric(
              horizontal: 35,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Colors.white.withOpacity(0.06),
              border: Border.all(
                color: Colors.white.withOpacity(0.08),
              ),
              boxShadow: [
                BoxShadow(
                  color: AppColors.primary.withOpacity(0.12),
                  blurRadius: 35,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.primary.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Text(
                    PortfolioConfig.name,
                    style: const TextStyle(
                      color: AppColors.primary,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                const Spacer(),

                ...List.generate(
                  PortfolioConfig.navItems.length,
                  (index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 6,
                      ),
                      child: NavItem(
                        title: PortfolioConfig
                            .navItems[index]["title"]
                            .toString(),
                        isActive: activeIndex == index,
                        onTap: () {
                          setState(() {
                            activeIndex = index;
                          });

                          final key =
                              PortfolioConfig.navItems[index]["key"]
                                  as GlobalKey;

                          WidgetsBinding.instance
                              .addPostFrameCallback((_) {
                            ScrollService.scrollTo(key);
                          });
                        },
                      ),
                    );
                  },
                ),

                const SizedBox(width: 20),

                Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.04),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Row(
                    children: [
                      SocialIconButton(
                        icon: Icons.code,
                        url: PortfolioConfig.github,
                      ),
                      SocialIconButton(
                        icon: Icons.business_center,
                        url: PortfolioConfig.linkedin,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _MobileNavbar extends StatelessWidget {
  const _MobileNavbar();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
      ),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.white.withOpacity(0.08),
        ),
      ),
      child: Row(
        children: [
          Builder(
            builder: (context) {
              return IconButton(
                icon: const Icon(
                  Icons.menu,
                  color: Colors.white,
                ),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              );
            },
          ),

          const SizedBox(width: 10),

          Expanded(
            child: Text(
              PortfolioConfig.name,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: AppColors.primary,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}