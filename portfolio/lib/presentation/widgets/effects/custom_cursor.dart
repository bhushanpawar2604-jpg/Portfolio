import 'package:flutter/material.dart';

class CustomCursor extends StatefulWidget {
  final Widget child;

  const CustomCursor({
    super.key,
    required this.child,
  });

  @override
  State<CustomCursor> createState() =>
      _CustomCursorState();
}

class _CustomCursorState
    extends State<CustomCursor> {
  Offset position = Offset.zero;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.none,

      onHover: (event) {
        setState(() {
          position = event.position;
        });
      },

      child: Stack(
        children: [
          widget.child,

          Positioned(
            left: position.dx - 10,
            top: position.dy - 10,
            child: IgnorePointer(
              child: Container(
                width: 20,
                height: 20,
                decoration:
                    BoxDecoration(
                  shape:
                      BoxShape.circle,
                  color: Colors.cyan
                      .withOpacity(
                    0.9,
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