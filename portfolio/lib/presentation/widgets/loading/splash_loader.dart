import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';

class SplashLoader extends StatefulWidget {
  const SplashLoader({super.key});

  @override
  State<SplashLoader> createState() =>
      _SplashLoaderState();
}

class _SplashLoaderState
    extends State<SplashLoader>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 2,
      ),
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          AppColors.background,
      body: Center(
        child: RotationTransition(
          turns: controller,
          child: Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.circular(
                20,
              ),
              gradient:
                  const LinearGradient(
                colors: [
                  AppColors.primary,
                  AppColors.secondary,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}