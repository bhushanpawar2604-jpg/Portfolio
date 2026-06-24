import 'dart:math';

import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';

class FloatingParticles
    extends StatefulWidget {
  const FloatingParticles({
    super.key,
  });

  @override
  State<FloatingParticles>
      createState() =>
          _FloatingParticlesState();
}

class _FloatingParticlesState
    extends State<FloatingParticles>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  final Random random = Random();

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(
      vsync: this,
      duration:
          const Duration(seconds: 20),
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return IgnorePointer(
          child: Stack(
            children: List.generate(
              30,
              (index) {
                final x =
                    (index * 80) %
                        MediaQuery.of(
                          context,
                        ).size.width;

                final y =
                    ((index * 120) +
                            controller
                                    .value *
                                400)
                        .toDouble();

                return Positioned(
                  left: x,
                  top: y %
                      MediaQuery.of(
                        context,
                      ).size.height,
                  child: Container(
                    width: 4,
                    height: 4,
                    decoration:
                        const BoxDecoration(
                      color:
                          AppColors.primary,
                      shape:
                          BoxShape.circle,
                    ),
                  ),
                );
              },
            ),
          ),
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