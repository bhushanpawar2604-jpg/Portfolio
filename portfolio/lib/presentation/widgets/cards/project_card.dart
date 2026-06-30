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
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: HoverCard(
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
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
                    ? AppColors.primary.withOpacity(0.18)
                    : Colors.black.withOpacity(0.12),
                blurRadius: 25,
                spreadRadius: 2,
              ),
            ],
          ),
          child: Column(
            children: [
              SizedBox(
                height: 180,
                width: double.infinity,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    AnimatedScale(
                      duration:
                          const Duration(milliseconds: 300),
                      scale: isHovered ? 1.05 : 1,
                      child: ClipRRect(
                        borderRadius:
                            const BorderRadius.vertical(
                          top: Radius.circular(20),
                        ),
                        child: Image.asset(
                          widget.image,
                          fit: BoxFit.contain,
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
                  padding: const EdgeInsets.symmetric(
                    horizontal: 18,
                    vertical: 16,
                  ),
                  child: Column(
                    children: [
                      Text(
                        widget.title,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),

                      const SizedBox(height: 12),

                      Wrap(
                        alignment: WrapAlignment.center,
                        spacing: 8,
                        runSpacing: 8,
                        children: widget.tech
                            .map(
                              (tech) => _TechChip(
                                text: tech,
                              ),
                            )
                            .toList(),
                      ),

                      const SizedBox(height: 14),

                      Expanded(
                        child: Text(
                          widget.description,
                          textAlign: TextAlign.center,
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: AppColors.grey,
                            height: 1.6,
                          ),
                        ),
                      ),

                      const SizedBox(height: 18),

                      ProjectButtons(
                        onGithub: () {
                          UrlLauncherService.launchUrlLink(
                            widget.githubLink,
                          );
                        },
                        onDemo: () {
                          UrlLauncherService.launchUrlLink(
                            widget.liveLink,
                          );
                        },
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