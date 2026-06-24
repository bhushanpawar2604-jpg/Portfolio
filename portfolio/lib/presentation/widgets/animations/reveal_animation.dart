import 'package:flutter/material.dart';

class RevealAnimation extends StatefulWidget {
  final Widget child;

  const RevealAnimation({
    super.key,
    required this.child,
  });

  @override
  State<RevealAnimation> createState() =>
      _RevealAnimationState();
}

class _RevealAnimationState
    extends State<RevealAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  bool _played = false;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );
  }

  void _play() {
    if (_played) return;

    _played = true;
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _play();
    });

    return FadeTransition(
      opacity: CurvedAnimation(
        parent: controller,
        curve: Curves.easeOut,
      ),
      child: SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0, .15),
          end: Offset.zero,
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: Curves.easeOut,
          ),
        ),
        child: widget.child,
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}