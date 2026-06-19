import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../core/config/portfolio_config.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/utils/responsive_helper.dart';
import '../../../core/services/scroll_service.dart';
import 'nav_item.dart';
import 'social_icon_button.dart';

class TopNavbar extends StatefulWidget {
  const TopNavbar({super.key});

  @override
  State<TopNavbar> createState() =>
      _TopNavbarState();
}

class _TopNavbarState
    extends State<TopNavbar> {
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    if (ResponsiveHelper.isMobile(
      context,
    )) {
      return const _MobileNavbar();
    }

    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 16,
      ),
      child: ClipRRect(
        borderRadius:
            BorderRadius.circular(20),
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 15,
            sigmaY: 15,
          ),
          child: Container(
            height: 80,
            padding:
                const EdgeInsets.symmetric(
              horizontal: 40,
            ),
            decoration: BoxDecoration(
              color:
                  Colors.white.withOpacity(
                0.05,
              ),
              borderRadius:
                  BorderRadius.circular(
                20,
              ),
              border: Border.all(
                color: Colors.white
                    .withOpacity(0.1),
              ),
            ),
            child: Row(
              children: [
                Text(
                  PortfolioConfig.name,
                  style:
                      const TextStyle(
                    color:
                        AppColors.primary,
                    fontSize: 28,
                    fontWeight:
                        FontWeight.bold,
                  ),
                ),

                const Spacer(),

                ...List.generate(
                  PortfolioConfig
                      .navItems.length,
                  (index) {
                    return NavItem(
                      title:PortfolioConfig.navItems[index]["title"].toString(),
                      isActive:
                          activeIndex ==
                              index,
                      onTap: () {
  setState(() {
    activeIndex = index;
  });

  ScrollService.scrollTo(
    PortfolioConfig.navItems[index]["key"]
        as GlobalKey,
  );
},
                    );
                  },
                ),

                const SizedBox(
                  width: 20,
                ),

                SocialIconButton(
                  icon: Icons.code,
                  url: PortfolioConfig
                      .github,
                ),

                const SizedBox(
                  width: 10,
                ),

                SocialIconButton(
                  icon: Icons.business,
                  url: PortfolioConfig
                      .linkedin,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _MobileNavbar
    extends StatelessWidget {
  const _MobileNavbar();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      padding:
          const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Row(
        children: [
          Builder(
            builder: (context) {
              return IconButton(
                icon:
                    const Icon(Icons.menu),
                onPressed: () {
                  Scaffold.of(context)
                      .openDrawer();
                },
              );
            },
          ),
          const SizedBox(width: 10),
          Text(
            PortfolioConfig.name,
            style: const TextStyle(
              color: AppColors.primary,
              fontSize: 24,
              fontWeight:
                  FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}