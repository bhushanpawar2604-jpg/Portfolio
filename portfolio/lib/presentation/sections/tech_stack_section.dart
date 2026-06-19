import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';

class TechStackSection extends StatelessWidget {
const TechStackSection({super.key});

final List<String> technologies = const [
"Flutter",
"Dart",
"Firebase",
"Provider",
"REST API",
"Git",
"GitHub",
"VS Code",
"Android Studio",
"Figma",
];

@override
Widget build(BuildContext context) {
return Container(
width: double.infinity,
padding: const EdgeInsets.symmetric(
horizontal: 30,
vertical: 80,
),
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
const Text(
"Tech Stack",
style: TextStyle(
fontSize: 38,
fontWeight: FontWeight.bold,
color: AppColors.primary,
),
),
const SizedBox(height: 30),
Wrap(
spacing: 15,
runSpacing: 15,
children: technologies.map(
(tech) {
return Container(
padding: const EdgeInsets.symmetric(
horizontal: 20,
vertical: 12,
),
decoration: BoxDecoration(
color: AppColors.cardColor,
borderRadius: BorderRadius.circular(30),
border: Border.all(
color: AppColors.border,
),
),
child: Text(
tech,
style: const TextStyle(
fontWeight: FontWeight.w500,
),
),
);
},
).toList(),
),
],
),
);
}
}
