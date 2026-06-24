import 'package:flutter/material.dart';

class FadeRoute<T>
    extends PageRouteBuilder<T> {
  final Widget page;

  FadeRoute({
    required this.page,
  }) : super(
          transitionDuration:
              const Duration(
            milliseconds: 500,
          ),
          pageBuilder:
              (
                context,
                animation,
                secondaryAnimation,
              ) {
            return page;
          },
          transitionsBuilder:
              (
                context,
                animation,
                secondaryAnimation,
                child,
              ) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        );
}