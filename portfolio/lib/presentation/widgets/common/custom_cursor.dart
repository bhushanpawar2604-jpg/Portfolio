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
      onHover: (event) {
        setState(() {
          position = event.position;
        });
      },
      child: Stack(
        children: [
          widget.child,

          Positioned(
            left: position.dx - 8,
            top: position.dy - 8,
            child: IgnorePointer(
              child: Container(
                width: 16,
                height: 16,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    width: 2,
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