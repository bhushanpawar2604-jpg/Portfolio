import 'package:flutter/material.dart';

import '../../core/config/portfolio_config.dart';
import '../../core/theme/app_colors.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 30,
        vertical: 40,
      ),
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            color: AppColors.border,
          ),
        ),
      ),
      child: Column(
        children: [
          Text(
            PortfolioConfig.name,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
            ),
          ),

          const SizedBox(height: 10),

          const Text(
            "Flutter Developer • Mobile Apps • Flutter Web",
            style: TextStyle(
              color: AppColors.grey,
            ),
          ),

          const SizedBox(height: 20),

          Text(
            "© 2026 ${PortfolioConfig.name}. All Rights Reserved.",
            style: const TextStyle(
              color: AppColors.grey,
            ),
          ),
        ],
      ),
    );
  }
}