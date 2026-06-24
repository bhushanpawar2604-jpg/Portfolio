import 'dart:ui';

import 'package:flutter/material.dart';

class GlassContainer extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;

  const GlassContainer({
    super.key,
    required this.child,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius:
          BorderRadius.circular(24),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 15,
          sigmaY: 15,
        ),
        child: Container(
          padding:
              padding ??
              const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(
              0.05,
            ),
            borderRadius:
                BorderRadius.circular(
              24,
            ),
            border: Border.all(
              color: Colors.white
                  .withOpacity(0.08),
            ),
          ),
          child: child,
        ),
      ),
    );
  }
}