class ProjectCard extends StatefulWidget {
  final String title;
  final String description;
  final String image;

  const ProjectCard({
    super.key,
    required this.title,
    required this.description,
    required this.image,
  });

  @override
  State<ProjectCard> createState() =>
      _ProjectCardState();
}

class _ProjectCardState
    extends State<ProjectCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          isHovered = true;
        });
      },
      onExit: (_) {
        setState(() {
          isHovered = false;
        });
      },
      child: HoverCard(
        child: AnimatedContainer(
          duration: const Duration(
            milliseconds: 250,
          ),
          decoration: BoxDecoration(
            color: AppColors.cardColor,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: isHovered
                  ? AppColors.primary
                  : AppColors.border,
            ),
            boxShadow: [
              BoxShadow(
                color: isHovered
                    ? AppColors.primary
                        .withValues(alpha: 0.20)
                    : Colors.black
                        .withValues(alpha: 0.15),
                blurRadius: 25,
                spreadRadius: 2,
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 180,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    AnimatedScale(
                      duration:
                          const Duration(
                        milliseconds: 300,
                      ),
                      scale:
                          isHovered ? 1.08 : 1,
                      child: ClipRRect(
                        borderRadius:
                            const BorderRadius
                                .vertical(
                          top: Radius.circular(
                            20,
                          ),
                        ),
                        child: Image.asset(
                          widget.image,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    ProjectOverlay(
                      isHovered: isHovered,
                    ),
                  ],
                ),
              ),

              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.all(
                    20,
                  ),
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment
                            .start,
                    children: [
                      Text(
                        widget.title,
                        style:
                            const TextStyle(
                          fontSize: 22,
                          fontWeight:
                              FontWeight
                                  .bold,
                        ),
                      ),

                      const SizedBox(
                        height: 10,
                      ),

                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: const [
                          _TechChip(
                            text:
                                "Flutter",
                          ),
                          _TechChip(
                            text: "Dart",
                          ),
                          _TechChip(
                            text:
                                "Firebase",
                          ),
                        ],
                      ),

                      const SizedBox(
                        height: 12,
                      ),

                      Text(
                        widget.description,
                        style:
                            const TextStyle(
                          color:
                              AppColors.grey,
                          height: 1.5,
                        ),
                      ),

                      const Spacer(),

                      ProjectButtons(
                        onGithub: () {},
                        onDemo: () {},
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}