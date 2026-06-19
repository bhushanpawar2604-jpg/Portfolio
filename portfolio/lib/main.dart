import 'package:flutter/material.dart';
import 'core/theme/app_theme.dart';
import 'presentation/screens/home_screen.dart';

void main() {
runApp(const MyPortfolioApp());
}

class MyPortfolioApp extends StatelessWidget {
const MyPortfolioApp({super.key});

@override
Widget build(BuildContext context) {
return MaterialApp(
title: 'Portfolio',
debugShowCheckedModeBanner: false,
theme: AppTheme.darkTheme,
home: const HomeScreen(),
);
}
}
