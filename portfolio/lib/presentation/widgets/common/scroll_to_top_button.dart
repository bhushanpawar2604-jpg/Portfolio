import 'package:flutter/material.dart';

import '../../../core/services/scroll_service.dart';
import '../../../core/theme/app_colors.dart';

class ScrollToTopButton extends StatefulWidget {
  const ScrollToTopButton({super.key});

  @override
  State<ScrollToTopButton> createState() =>
      _ScrollToTopButtonState();
}

class _ScrollToTopButtonState
    extends State<ScrollToTopButton> {
  bool visible = false;

  @override
  void initState() {
    super.initState();

    ScrollService.controller.addListener(() {
      final shouldShow =
          ScrollService.controller.offset > 500;

      if (shouldShow != visible) {
        setState(() {
          visible = shouldShow;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 250),
      opacity: visible ? 1 : 0,
      child: FloatingActionButton(
        backgroundColor: AppColors.primary,
        onPressed: () {
          ScrollService.controller.animateTo(
            0,
            duration: const Duration(
              milliseconds: 700,
            ),
            curve: Curves.easeInOut,
          );
        },
        child: const Icon(Icons.keyboard_arrow_up),
      ),
    );
  }
}