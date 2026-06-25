import 'package:flutter/material.dart';

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
  Offset position = Offset.zero;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onHover: (event) {
        setState(() {
          position =
              event.localPosition;
        });
      },
      child: Stack(
        children: [
          Positioned(
            left: position.dx - 180,
            top: position.dy - 180,
            child: IgnorePointer(
              child: Container(
                width: 360,
                height: 360,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient:
                      RadialGradient(
                    colors: [
                      Colors.cyan
                          .withOpacity(
                        0.12,
                      ),
                      Colors
                          .transparent,
                    ],
                  ),
                ),
              ),
            ),
          ),

          widget.child,
        ],
      ),
    );
  }
}