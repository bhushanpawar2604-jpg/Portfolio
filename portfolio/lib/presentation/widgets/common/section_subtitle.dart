import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';

class SectionSubtitle extends StatelessWidget {
  final String text;

  const SectionSubtitle({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 18,
        height: 1.8,
        color: AppColors.grey,
      ),
    );
  }
}