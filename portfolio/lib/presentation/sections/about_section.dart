import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/utils/responsive_helper.dart';

class AboutSection extends StatelessWidget {
const AboutSection({super.key});

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
        "About Me",
        style: TextStyle(
          fontSize: 38,
          fontWeight: FontWeight.bold,
          color: AppColors.primary,
        ),
      ),

      const SizedBox(height: 20),

      const Text(
        "I am a Flutter Developer who enjoys building clean, responsive and scalable applications. I focus on writing maintainable code, creating smooth user experiences and continuously learning new technologies.",
        style: TextStyle(
          fontSize: 18,
          height: 1.8,
          color: AppColors.grey,
        ),
      ),

      const SizedBox(height: 40),

      isMobile
          ? const Column(
              children: [
                AboutCard(
                  title: "Flutter",
                  value: "Cross Platform Apps",
                ),
                SizedBox(height: 15),
                AboutCard(
                  title: "UI Design",
                  value: "Responsive Layouts",
                ),
                SizedBox(height: 15),
                AboutCard(
                  title: "Architecture",
                  value: "Clean Code",
                ),
              ],
            )
          : const Row(
              children: [
                Expanded(
                  child: AboutCard(
                    title: "Flutter",
                    value: "Cross Platform Apps",
                  ),
                ),

                SizedBox(width: 20),

                Expanded(
                  child: AboutCard(
                    title: "UI Design",
                    value: "Responsive Layouts",
                  ),
                ),

                SizedBox(width: 20),

                Expanded(
                  child: AboutCard(
                    title: "Architecture",
                    value: "Clean Code",
                  ),
                ),
              ],
            ),
    ],
  ),
);


}
}

class AboutCard extends StatelessWidget {
final String title;
final String value;

const AboutCard({
super.key,
required this.title,
required this.value,
});

@override
Widget build(BuildContext context) {
return Container(
padding: const EdgeInsets.all(24),


  decoration: BoxDecoration(
    color: AppColors.cardColor,
    borderRadius: BorderRadius.circular(20),
    border: Border.all(
      color: AppColors.border,
    ),
  ),

  child: Column(
    children: [
      Text(
        title,
        style: const TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: AppColors.primary,
        ),
      ),

      const SizedBox(height: 10),

      Text(
        value,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: AppColors.grey,
          fontSize: 16,
        ),
      ),
    ],
  ),
);


}
}
