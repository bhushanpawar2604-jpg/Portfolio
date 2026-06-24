import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';

class ProjectOverlay extends StatelessWidget {
  final bool isHovered;

  const ProjectOverlay({
    super.key,
    required this.isHovered,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 250),
      opacity: isHovered ? 1 : 0,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              Colors.black.withValues(alpha: 0.85),
              Colors.transparent,
            ],
          ),
        ),
        child: const Center(
          child: Icon(
            Icons.visibility_outlined,
            color: AppColors.white,
            size: 40,
          ),
        ),
      ),
    );
  }
}