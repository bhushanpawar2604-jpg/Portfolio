import 'package:flutter/material.dart';

import '../../core/constants/section_ids.dart';
import '../../core/theme/app_colors.dart';
import '../../core/utils/responsive_helper.dart';

import '../widgets/animations/hover_card.dart';
import '../../core/services/url_launcher_service.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

static const List<Map<String, dynamic>> projects = [
 {
  "title": "E-Commerce Application",
  "description":
      "Complete Flutter e-commerce application with authentication, cart, wishlist and Firebase backend.",
  "image":
      "assets/images/project1.png",
  "tech": [
    "Flutter",
    "Firebase",
    "Provider"
  ],

  "githubLink":
      "https://github.com/bhushanpawar2604-jpg",

  "liveLink":
      "https://github.com/bhushanpawar2604-jpg",
},

  {
    "title": "Moodify Music Application",
    "description":
        "Music recommendation app based on mood detection.",
    "image": "assets/images/project2.png",
    "githubLink":
        "https://github.com/yourusername/moodify",
    "liveLink":
        "https://your-demo-link.com",
    "tech": [
      "Flutter",
      "REST API",
      "Firebase"
    ],
    "github": "https://github.com/yourrepo",
    "live": "",
  },

  {
    "title": "Portfolio Website",
    "description":
        "Responsive Flutter Web portfolio.",
    "image": "assets/images/project3.png",
    "githubLink":
        "https://github.com/yourusername/portfolio",
    "liveLink":
        "https://your-demo-link.com",
    "tech": [
      "Flutter Web",
      "Dart",
      "Responsive UI"
    ],
     
  },
];

  @override
  Widget build(BuildContext context) {
    final isMobile =
        ResponsiveHelper.isMobile(context);

    return Container(
      key: SectionIds.projects,
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 40,
        vertical: 90,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment:
            CrossAxisAlignment.start,
        children: [
          const Text(
            "MY PROJECTS",
            style: TextStyle(
              color: AppColors.primary,
              letterSpacing: 3,
              fontWeight: FontWeight.w600,
            ),
          ),

          const SizedBox(height: 12),

          const Text(
            "Featured Work",
            style: TextStyle(
              fontSize: 42,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),

          const SizedBox(height: 20),

          const Text(
            "Projects that showcase my Flutter development skills and problem solving approach.",
            style: TextStyle(
              color: AppColors.grey,
              height: 1.7,
            ),
          ),

          const SizedBox(height: 50),

          GridView.builder(
            shrinkWrap: true,
            physics:
                const NeverScrollableScrollPhysics(),
            itemCount: projects.length,
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount:
                  isMobile ? 1 : 2,
              crossAxisSpacing: 25,
              mainAxisSpacing: 25,
              childAspectRatio:
                  isMobile ? 0.65 : 0.92,
            ),
           itemBuilder: (context, index) {
  return ProjectCard(
    title: projects[index]["title"],
    description: projects[index]["description"],
    image: projects[index]["image"],
    tech: List<String>.from(
      projects[index]["tech"],
    ),
    githubLink:
        projects[index]["githubLink"],
    liveLink:
        projects[index]["liveLink"],
  );
},
          ),
        ],
      ),
    );
  }
}

class ProjectCard extends StatefulWidget {
  final String title;
  final String description;
  final String image;
  final List<String> tech;

  final String githubLink;
  final String liveLink;

  const ProjectCard({
    super.key,
    required this.title,
    required this.description,
    required this.image,
    required this.tech,
    required this.githubLink,
    required this.liveLink,
  });

  @override
  State<ProjectCard> createState() =>
      _ProjectCardState();
}


class _ProjectCardState
    extends State<ProjectCard> {
  bool hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          hovered = true;
        });
      },
      onExit: (_) {
        setState(() {
          hovered = false;
        });
      },
      child: HoverCard(
        child: AnimatedContainer(
          duration:
              const Duration(milliseconds: 250),

          decoration: BoxDecoration(
            borderRadius:
                BorderRadius.circular(28),

            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.white.withOpacity(
                  0.06,
                ),
                Colors.white.withOpacity(
                  0.03,
                ),
              ],
            ),

            border: Border.all(
              color: hovered
                  ? AppColors.primary
                      .withOpacity(0.45)
                  : AppColors.border,
            ),

            boxShadow: hovered
                ? [
                    BoxShadow(
                      color: AppColors.primary
                          .withOpacity(0.18),
                      blurRadius: 40,
                      spreadRadius: 3,
                    ),
                  ]
                : [],
          ),

          child: Column(
            children: [
              ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(
                  top: Radius.circular(28),
                ),
                child: AnimatedScale(
                  duration:
                      const Duration(
                    milliseconds: 300,
                  ),
                  scale:
                      hovered ? 1.06 : 1,
                  child: Image.asset(
                    widget.image,
                    height: 180,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.all(
                    18,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment:
                        CrossAxisAlignment
                            .start,
                    children: [
                      Text(
                        widget.title,
                        style:
                            const TextStyle(
                          fontSize: 24,
                          fontWeight:
                              FontWeight
                                  .bold,
                          color:
                              Colors.white,
                        ),
                      ),

                      const SizedBox(
                          height: 12),

                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: widget.tech
                            .map<Widget>(
                              (tech) =>
                                  _TechChip(
                                text: tech,
                              ),
                            )
                            .toList(),
                      ),

                      const SizedBox(
                          height: 15),

                      Text(
                        widget
                            .description,
                        style:
                            const TextStyle(
                          color:
                              AppColors.grey,
                          height: 1.7,
                        ),
                      ),

                      const Spacer(),

                      Row(
                        children: [
                          Expanded(
  child: ElevatedButton(
    onPressed: () {
      UrlLauncherService.launchUrlLink(
        widget.githubLink,
      );
    },
    child: const Text(
      "GitHub",
    ),
  ),
),

const SizedBox(width: 12),

Expanded(
  child: OutlinedButton(
    onPressed: () {
      UrlLauncherService.launchUrlLink(
        widget.liveLink,
      );
    },
    child: const Text(
      "Live Demo",
    ),
  ),
),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _TechChip extends StatelessWidget {
  final String text;

  const _TechChip({
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 7,
      ),
      decoration: BoxDecoration(
        color:
            AppColors.primary.withOpacity(
          0.12,
        ),
        borderRadius:
            BorderRadius.circular(50),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: AppColors.primary,
          fontWeight: FontWeight.w600,
          fontSize: 12,
        ),
      ),
    );
  }
}