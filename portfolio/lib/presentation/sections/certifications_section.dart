import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';

class CertificationsSection extends StatelessWidget {
const CertificationsSection({super.key});

final List<String> certifications = const [
"Flutter Development Certification",
"Dart Programming Certification",
"Firebase Integration Certificate",
"Git & GitHub Certificate",
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
"Certifications",
style: TextStyle(
fontSize: 38,
fontWeight: FontWeight.bold,
color: AppColors.primary,
),
),


      const SizedBox(height: 30),

      ...certifications.map(
        (certificate) => Container(
          margin: const EdgeInsets.only(
            bottom: 15,
          ),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: AppColors.cardColor,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              color: AppColors.border,
            ),
          ),
          child: Row(
            children: [
              const Icon(
                Icons.workspace_premium,
                color: AppColors.primary,
              ),

              const SizedBox(width: 15),

              Expanded(
                child: Text(
                  certificate,
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ],
  ),
);


}
}
