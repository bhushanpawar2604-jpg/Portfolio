import 'dart:async';

import 'package:flutter/material.dart';

import '../screens/home_screen.dart';
import '../../core/theme/app_colors.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({
    super.key,
  });

  @override
  State<SplashPage> createState() =>
      _SplashPageState();
}

class _SplashPageState
    extends State<SplashPage> {

  @override
  void initState() {
    super.initState();

    Timer(
      const Duration(
        seconds: 3,
      ),
      () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) =>
                const HomeScreen(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          AppColors.background,

      body: Center(
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center,
          children: [
            Container(
              width: 120,
              height: 120,
              decoration:
                  BoxDecoration(
                shape:
                    BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: AppColors
                        .primary
                        .withOpacity(
                      0.5,
                    ),
                    blurRadius: 50,
                  ),
                ],
              ),

              child: const Icon(
                Icons.flutter_dash,
                size: 70,
                color:
                    AppColors.primary,
              ),
            ),

            const SizedBox(
              height: 30,
            ),

            const Text(
              "Bhushan Pawar",
              style: TextStyle(
                fontSize: 32,
                fontWeight:
                    FontWeight.bold,
              ),
            ),

            const SizedBox(
              height: 15,
            ),

            const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}