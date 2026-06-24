import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';

class GlowingBadge
    extends StatelessWidget {
  final String text;

  const GlowingBadge({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
        boxShadow: [
          BoxShadow(
            color: AppColors.primary
                .withOpacity(0.25),
            blurRadius: 20,
          ),
        ],
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: AppColors.primary,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}