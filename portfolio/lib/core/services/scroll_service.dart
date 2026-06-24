import 'package:flutter/material.dart';

class ScrollService {
  static final ScrollController controller =
      ScrollController();

  static void scrollTo(GlobalKey key) {
    final context = key.currentContext;

    if (context == null) return;

    Scrollable.ensureVisible(
      context,
      duration: const Duration(
        milliseconds: 800,
      ),
      curve: Curves.easeInOut,
      alignment: 0.05,
    );
  }

  static void scrollToTop() {
    controller.animateTo(
      0,
      duration: const Duration(
        milliseconds: 800,
      ),
      curve: Curves.easeInOut,
    );
  }
}