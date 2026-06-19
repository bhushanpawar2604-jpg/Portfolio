import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/theme/app_colors.dart';

class SocialIconButton extends StatefulWidget {
  final IconData icon;
  final String url;

  const SocialIconButton({
    super.key,
    required this.icon,
    required this.url,
  });

  @override
  State<SocialIconButton> createState() =>
      _SocialIconButtonState();
}

class _SocialIconButtonState
    extends State<SocialIconButton> {
  bool isHovered = false;

  Future<void> _launchUrl() async {
    final uri = Uri.parse(widget.url);

    if (await canLaunchUrl(uri)) {
      await launchUrl(
        uri,
        mode: LaunchMode.externalApplication,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,

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

      child: GestureDetector(
        onTap: _launchUrl,

        child: AnimatedContainer(
          duration: const Duration(
            milliseconds: 200,
          ),

          margin: const EdgeInsets.symmetric(
            horizontal: 4,
          ),

          padding: const EdgeInsets.all(12),

          transform: Matrix4.identity()
            ..scale(
              isHovered ? 1.12 : 1.0,
            ),

          decoration: BoxDecoration(
            color: isHovered
                ? AppColors.primary.withOpacity(0.15)
                : Colors.white.withOpacity(0.05),

            borderRadius:
                BorderRadius.circular(14),

            border: Border.all(
              color: isHovered
                  ? AppColors.primary
                  : Colors.white10,
            ),

            boxShadow: isHovered
                ? [
                    BoxShadow(
                      color: AppColors.primary
                          .withOpacity(0.35),
                      blurRadius: 18,
                      spreadRadius: 2,
                    ),
                  ]
                : [],
          ),

          child: Icon(
            widget.icon,
            color: isHovered
                ? AppColors.primary
                : Colors.white,
            size: 22,
          ),
        ),
      ),
    );
  }
}