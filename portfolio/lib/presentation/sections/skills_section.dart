import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../core/constants/section_ids.dart';
import '../../core/theme/app_colors.dart';
import '../../core/utils/responsive_helper.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  static const List<Map<String, dynamic>> skills = [
    {
      "name": "Flutter",
      "level": 95,
      "icon": FontAwesomeIcons.flutter,
      "color": AppColors.primary,
    },
    {
      "name": "Dart",
      "level": 90,
      "icon": FontAwesomeIcons.code,
      "color": AppColors.accentPink,
    },
    {
      "name": "Firebase",
      "level": 88,
      "icon": FontAwesomeIcons.fire,
      "color": AppColors.accentOrange,
    },
    {
      "name": "REST API",
      "level": 92,
      "icon": FontAwesomeIcons.cloud,
      "color": AppColors.secondary,
    },
    {
      "name": "Git",
      "level": 90,
      "icon": FontAwesomeIcons.gitAlt,
      "color": AppColors.accentOrange,
    },
    {
      "name": "GitHub",
      "level": 92,
      "icon": FontAwesomeIcons.github,
      "color": Colors.white,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveHelper.isMobile(context);

    return Container(
      key: SectionIds.skills,
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 40,
        vertical: 90,
      ),
     child: Column(
  mainAxisAlignment: MainAxisAlignment.center,
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
          const Text(
            "MY SKILLS",
            style: TextStyle(
              color: AppColors.primary,
              letterSpacing: 3,
              fontWeight: FontWeight.w600,
            ),
          ),

          const SizedBox(height: 10),

          const Text(
            "Technologies I Work With",
            style: TextStyle(
              fontSize: 42,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),

          const SizedBox(height: 20),

          const Text(
            "Tools and technologies I use to create scalable and responsive Flutter applications.",
            style: TextStyle(
              color: AppColors.grey,
              height: 1.7,
            ),
          ),

          const SizedBox(height: 50),

        Wrap(
  spacing: 18,
  runSpacing: 18,
  children: skills.map((skill) {
    return SizedBox(
     width: isMobile
    ? double.infinity
    : 260,
      child: SkillCard(
        title: skill["name"],
        level: skill["level"],
        icon: skill["icon"],
        color: skill["color"],
      ),
    );
  }).toList(),
),
        ],
      ),
    );
  }
}

class SkillCard extends StatefulWidget {
  final String title;
  final int level;
  final dynamic icon;
  final Color color;

  const SkillCard({
    super.key,
    required this.title,
    required this.level,
    required this.icon,
    required this.color,
  });

  @override
  State<SkillCard> createState() => _SkillCardState();
}

class _SkillCardState extends State<SkillCard> {
  bool hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() => hovered = true);
      },
      onExit: (_) {
        setState(() => hovered = false);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        transform: Matrix4.identity()
          ..translate(
            0.0,
            hovered ? -5.0 : 0.0,
          ),
        padding: const EdgeInsets.symmetric(
  horizontal: 16,
  vertical: 14,
),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.white.withOpacity(0.05),
              Colors.white.withOpacity(0.02),
            ],
          ),
          border: Border.all(
            color: hovered
                ? widget.color.withOpacity(0.6)
                : AppColors.border,
          ),
          boxShadow: hovered
              ? [
                  BoxShadow(
                    color: widget.color.withOpacity(0.25),
                    blurRadius: 35,
                    spreadRadius: 3,
                  ),
                ]
              : [],
        ),
        child: IntrinsicHeight(
  child: IntrinsicHeight(
  child: Column(
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
            CircleAvatar(
  radius: 18,
  backgroundColor: widget.color.withOpacity(0.15),
  child: widget.icon is IconData
      ? Icon(
          widget.icon as IconData,
          color: widget.color,
          size: 18,
        )
      : FaIcon(
          widget.icon,
          color: widget.color,
          size: 18,
        ),
),

            const SizedBox(height: 12),

            Text(
              widget.title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),

            const SizedBox(height: 10),

            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: LinearProgressIndicator(
                minHeight: 8,
                value: widget.level / 100,
                backgroundColor: Colors.white10,
                valueColor: AlwaysStoppedAnimation(
                  widget.color,
                ),
              ),
            ),

            const SizedBox(height: 12),

            Text(
              "${widget.level}%",
              style: TextStyle(
                color: widget.color,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ],
        ),
  ),
        ),
      ),
    );
  }
}