import 'package:flutter/material.dart';

class HoverCard extends StatefulWidget {
  final Widget child;

  const HoverCard({
    super.key,
    required this.child,
  });

  @override
  State<HoverCard> createState() =>
      _HoverCardState();
}

class _HoverCardState
    extends State<HoverCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,

      onEnter: (_) {
        setState(() {
          isHovered = true;
        });
      },

      onExit: (_) {
        setState(() {
          isHovered = false;
        });
      },

      child: AnimatedContainer(
        duration: const Duration(
          milliseconds: 250,
        ),

        transform: Matrix4.identity()
          ..translate(
            0.0,
            isHovered ? -10.0 : 0.0,
          )
          ..scale(
            isHovered ? 1.02 : 1.0,
          ),

        child: widget.child,
      ),
    );
  }
}