import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';

class BackgroundGlow extends StatelessWidget {
  const BackgroundGlow({super.key});

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Stack(
        children: [
          Positioned(
            top: -120,
            left: -120,
            child: Container(
              width: 350,
              height: 350,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.primary
                    .withOpacity(0.12),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primary
                        .withOpacity(0.25),
                    blurRadius: 180,
                    spreadRadius: 80,
                  ),
                ],
              ),
            ),
          ),

          Positioned(
            bottom: -120,
            right: -120,
            child: Container(
              width: 350,
              height: 350,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.secondary
                    .withOpacity(0.12),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.secondary
                        .withOpacity(0.25),
                    blurRadius: 180,
                    spreadRadius: 80,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}