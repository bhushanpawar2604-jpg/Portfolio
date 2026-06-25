import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
    final isMobile =
        ResponsiveHelper.isMobile(context);

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
      child: AnimatedContainer(
        duration: const Duration(
          milliseconds: 250,
        ),

        transform: Matrix4.identity()
          ..translate(
            0.0,
            hovered ? -8.0 : 0.0,
          ),

        padding: const EdgeInsets.all(22),

        decoration: BoxDecoration(
          borderRadius:
              BorderRadius.circular(24),

          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.white.withOpacity(0.06),
              Colors.white.withOpacity(0.03),
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
                    color: widget.color
                        .withOpacity(0.20),
                    blurRadius: 30,
                    spreadRadius: 2,
                  ),
                ]
              : [],
        ),

        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [
            Container(
              width: 58,
              height: 58,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: widget.color
                    .withOpacity(0.15),
              ),
              child: Center(
                child: FaIcon(
                  widget.icon,
                  color: widget.color,
                  size: 24,
                ),
              ),
            ),

            const Spacer(),

            Text(
              widget.title,
              style: TextStyle(
                fontSize:
                    isMobile ? 20 : 22,
                fontWeight:
                    FontWeight.bold,
                color: Colors.white,
              ),
            ),

            const SizedBox(
              height: 14,
            ),

            ClipRRect(
              borderRadius:
                  BorderRadius.circular(20),
              child: LinearProgressIndicator(
                minHeight: 8,
                value: widget.level / 100,
                backgroundColor:
                    Colors.white10,
                valueColor:
                    AlwaysStoppedAnimation(
                  widget.color,
                ),
              ),
            ),

            const SizedBox(
              height: 10,
            ),

            Text(
              "${widget.level}%",
              style: TextStyle(
                color: widget.color,
                fontWeight:
                    FontWeight.bold,
                fontSize: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }
}