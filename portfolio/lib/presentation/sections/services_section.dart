import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';

class ServicesSection extends StatelessWidget {
const ServicesSection({super.key});

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
"Services",
style: TextStyle(
fontSize: 38,
fontWeight: FontWeight.bold,
color: AppColors.primary,
),
),

      const SizedBox(height: 20),

      Row(
        children: const [
          Expanded(
            child: ServiceCard(
              icon: Icons.phone_android,
              title: "App Development",
              description:
                  "Cross-platform Flutter applications.",
            ),
          ),

          SizedBox(width: 20),

          Expanded(
            child: ServiceCard(
              icon: Icons.design_services,
              title: "UI Design",
              description:
                  "Modern and responsive user interfaces.",
            ),
          ),

          SizedBox(width: 20),

          Expanded(
            child: ServiceCard(
              icon: Icons.api,
              title: "API Integration",
              description:
                  "REST API and Firebase integration.",
            ),
          ),
        ],
      ),
    ],
  ),
);


}
}

class ServiceCard extends StatelessWidget {
final IconData icon;
final String title;
final String description;

const ServiceCard({
super.key,
required this.icon,
required this.title,
required this.description,
});

@override
Widget build(BuildContext context) {
return Container(
padding: const EdgeInsets.symmetric(
  horizontal: 18,
  vertical: 16,
),
decoration: BoxDecoration(
color: AppColors.cardColor,
borderRadius: BorderRadius.circular(18),
border: Border.all(
color: AppColors.border,
),
),
child: Column(
  mainAxisSize: MainAxisSize.min,
  children: [
Icon(
icon,
size: 28,
color: AppColors.primary,
),


      const SizedBox(height: 10),

      Text(
        title,
        style: const TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.bold,
        ),
      ),

      const SizedBox(height: 8),

      Text(
        description,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: AppColors.grey,
        ),
      ),
    ],
  ),
);


}
}
