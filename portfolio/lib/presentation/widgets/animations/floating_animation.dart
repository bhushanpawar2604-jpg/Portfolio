import 'package:flutter/material.dart';

class FloatingAnimation extends StatefulWidget {
  final Widget child;
  final double offset;

  const FloatingAnimation({
    super.key,
    required this.child,
    this.offset = 12,
  });

  @override
  State<FloatingAnimation> createState() =>
      _FloatingAnimationState();
}

class _FloatingAnimationState
    extends State<FloatingAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 3,
      ),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      child: widget.child,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(
            0,
            widget.offset *
                (controller.value - 0.5),
          ),
          child: child,
        );
      },
    );
  }
}