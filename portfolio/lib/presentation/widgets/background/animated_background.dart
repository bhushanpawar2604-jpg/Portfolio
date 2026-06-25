import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedBackground
    extends StatefulWidget {
  const AnimatedBackground({
    super.key,
  });

  @override
  State<AnimatedBackground>
      createState() =>
          _AnimatedBackgroundState();
}

class _AnimatedBackgroundState
    extends State<
            AnimatedBackground>
    with
        SingleTickerProviderStateMixin {
  late AnimationController
      controller;

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(
      vsync: this,
      duration:
          const Duration(
        seconds: 20,
      ),
    )..repeat();
  }

  @override
  Widget build(
      BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder:
          (context, child) {
        return CustomPaint(
          painter:
              ParticlePainter(
            controller.value,
          ),
          size: Size.infinite,
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

class ParticlePainter
    extends CustomPainter {
  final double progress;

  ParticlePainter(
    this.progress,
  );

  @override
  void paint(
    Canvas canvas,
    Size size,
  ) {
    final paint = Paint()
      ..color =
          Colors.white12;

    for (
      int i = 0;
      i < 50;
      i++
    ) {
      final dx =
          (i * 37.0) %
              size.width;

      final dy =
          ((i * 91.0) +
                  progress *
                      500)
              %
              size.height;

      canvas.drawCircle(
        Offset(dx, dy),
        Random(i)
                .nextDouble() *
            3,
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(
    covariant CustomPainter
        oldDelegate,
  ) {
    return true;
  }
}