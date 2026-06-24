import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';

class MouseGlow extends StatefulWidget {
  final Widget child;

  const MouseGlow({
    super.key,
    required this.child,
  });

  @override
  State<MouseGlow> createState() =>
      _MouseGlowState();
}

class _MouseGlowState
    extends State<MouseGlow> {
  Offset mousePosition = Offset.zero;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onHover: (event) {
        setState(() {
          mousePosition =
              event.localPosition;
        });
      },
      child: Stack(
        children: [
          widget.child,

          Positioned(
            left:
                mousePosition.dx - 150,
            top:
                mousePosition.dy - 150,
            child: IgnorePointer(
              child: AnimatedContainer(
                duration:
                    const Duration(
                  milliseconds: 100,
                ),
                width: 300,
                height: 300,
                decoration:
                    BoxDecoration(
                  shape:
                      BoxShape.circle,
                  gradient:
                      RadialGradient(
                    colors: [
                      AppColors.primary
                          .withOpacity(
                        0.15,
                      ),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}