import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';

class NavItem extends StatefulWidget {
  final String title;
  final VoidCallback onTap;
  final bool isActive;

  const NavItem({
    super.key,
    required this.title,
    required this.onTap,
    this.isActive = false,
  });

  @override
  State<NavItem> createState() =>
      _NavItemState();
}

class _NavItemState extends State<NavItem> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    final active =
        widget.isActive || isHovered;

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
      child: TextButton(
        onPressed: widget.onTap,
        child: Text(
          widget.title,
          style: TextStyle(
            color: active
                ? AppColors.primary
                : AppColors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}