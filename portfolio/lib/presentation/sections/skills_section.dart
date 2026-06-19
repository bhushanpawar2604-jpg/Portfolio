import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/utils/responsive_helper.dart';

class SkillsSection extends StatelessWidget {
const SkillsSection({super.key});

final List<Map<String, String>> skills = const [
{
"name": "Flutter",
"level": "95%",
},
{
"name": "Dart",
"level": "90%",
},
{
"name": "Firebase",
"level": "85%",
},
{
"name": "REST API",
"level": "85%",
},
{
"name": "Provider",
"level": "90%",
},
{
"name": "Git & GitHub",
"level": "88%",
},
];

@override
Widget build(BuildContext context) {
final isMobile = ResponsiveHelper.isMobile(context);


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
        "Skills",
        style: TextStyle(
          fontSize: 38,
          fontWeight: FontWeight.bold,
          color: AppColors.primary,
        ),
      ),

      const SizedBox(height: 30),

      GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: skills.length,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: isMobile ? 1 : 3,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          childAspectRatio: 2.2,
        ),
        itemBuilder: (context, index) {
          return SkillCard(
            title: skills[index]["name"]!,
            level: skills[index]["level"]!,
          );
        },
      ),
    ],
  ),
);


}
}

class SkillCard extends StatelessWidget {
final String title;
final String level;

const SkillCard({
super.key,
required this.title,
required this.level,
});

@override
Widget build(BuildContext context) {
return Container(
padding: const EdgeInsets.all(20),
decoration: BoxDecoration(
color: AppColors.cardColor,
borderRadius: BorderRadius.circular(20),
border: Border.all(
color: AppColors.border,
),
),
child: Column(
mainAxisAlignment:
MainAxisAlignment.center,
children: [
Text(
title,
style: const TextStyle(
fontSize: 22,
fontWeight: FontWeight.bold,
color: AppColors.white,
),
),


      const SizedBox(height: 10),

      Text(
        level,
        style: const TextStyle(
          color: AppColors.primary,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    ],
  ),
);


}
}
