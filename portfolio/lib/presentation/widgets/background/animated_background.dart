import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';

class AnimatedBackground extends StatefulWidget {
  const AnimatedBackground({
    super.key,
  });

  @override
  State<AnimatedBackground> createState() =>
      _AnimatedBackgroundState();
}

class _AnimatedBackgroundState
    extends State<AnimatedBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 12,
      ),
    )..repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return Stack(
          children: [
            Positioned(
              left:
                  100 +
                  (controller.value * 80),
              top:
                  120 +
                  (controller.value * 50),
              child: _circle(
                AppColors.primary,
              ),
            ),

            Positioned(
              right:
                  100 +
                  (controller.value * 60),
              bottom:
                  120 +
                  (controller.value * 40),
              child: _circle(
                AppColors.secondary,
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _circle(Color color) {
    return Container(
      width: 250,
      height: 250,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.15),
            blurRadius: 140,
            spreadRadius: 60,
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}