import 'package:flutter/material.dart';

class ScrollHelper {
static void scrollToSection(GlobalKey key) {
final context = key.currentContext;


if (context != null) {
  Scrollable.ensureVisible(
    context,
    duration: const Duration(milliseconds: 700),
    curve: Curves.easeInOut,
  );
}


}
}
