import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';

class AnimatedGradientBorder
    extends StatefulWidget {
  final Widget child;

  const AnimatedGradientBorder({
    super.key,
    required this.child,
  });

  @override
  State<AnimatedGradientBorder>
      createState() =>
          _AnimatedGradientBorderState();
}

class _AnimatedGradientBorderState
    extends State<
        AnimatedGradientBorder>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(
      vsync: this,
      duration:
          const Duration(seconds: 4),
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return Container(
          padding:
              const EdgeInsets.all(1.5),
          decoration: BoxDecoration(
            borderRadius:
                BorderRadius.circular(
              30,
            ),
            gradient:
                LinearGradient(
              begin: Alignment.topLeft,
              end:
                  Alignment.bottomRight,
              colors: const [
                AppColors.primary,
                AppColors.secondary,
                AppColors.accentPink,
              ],
              stops: [
                controller.value,
                0.5,
                1,
              ],
            ),
          ),
          child: widget.child,
        );
      },
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}