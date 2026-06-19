import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';

class EducationSection extends StatelessWidget {
const EducationSection({super.key});

final List<Map<String, String>> educationList = const [
{
"year": "2022 - Present",
"degree": "Bachelor's Degree",
"institute": "Your College Name",
"description":
"Currently pursuing graduation while focusing on Flutter development, software engineering and mobile application development."
},
{
"year": "2020 - 2022",
"degree": "Higher Secondary Education",
"institute": "Your School / College",
"description":
"Completed higher secondary education with focus on academics and technology."
}
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
"Education",
style: TextStyle(
fontSize: 38,
fontWeight: FontWeight.bold,
color: AppColors.primary,
),
),


      const SizedBox(height: 40),

      ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: educationList.length,
        itemBuilder: (context, index) {
          return EducationCard(
            year: educationList[index]["year"]!,
            degree: educationList[index]["degree"]!,
            institute:
                educationList[index]["institute"]!,
            description:
                educationList[index]["description"]!,
          );
        },
      ),
    ],
  ),
);


}
}

class EducationCard extends StatelessWidget {
final String year;
final String degree;
final String institute;
final String description;

const EducationCard({
super.key,
required this.year,
required this.degree,
required this.institute,
required this.description,
});

@override
Widget build(BuildContext context) {
return Container(
margin: const EdgeInsets.only(bottom: 25),
padding: const EdgeInsets.all(25),
decoration: BoxDecoration(
color: AppColors.cardColor,
borderRadius: BorderRadius.circular(20),
border: Border.all(
color: AppColors.border,
),
),
child: Row(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
SizedBox(
width: 120,
child: Text(
year,
style: const TextStyle(
color: AppColors.primary,
fontSize: 20,
fontWeight: FontWeight.bold,
),
),
),


      const SizedBox(width: 20),

      Expanded(
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [
            Text(
              degree,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: AppColors.white,
              ),
            ),

            const SizedBox(height: 8),

            Text(
              institute,
              style: const TextStyle(
                color: AppColors.primary,
                fontSize: 16,
              ),
            ),

            const SizedBox(height: 12),

            Text(
              description,
              style: const TextStyle(
                color: AppColors.grey,
                height: 1.6,
              ),
            ),
          ],
        ),
      ),
    ],
  ),
);


}
}
