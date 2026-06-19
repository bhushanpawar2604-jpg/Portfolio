import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';

class CustomButton extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;
  final IconData? icon;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.icon,
  });

  @override
  State<CustomButton> createState() =>
      _CustomButtonState();
}

class _CustomButtonState
    extends State<CustomButton> {
  bool isHovered = false;

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

      child: AnimatedContainer(
        duration: const Duration(
          milliseconds: 200,
        ),

        transform: Matrix4.identity()
          ..scale(
            isHovered ? 1.05 : 1.0,
          ),

        decoration: BoxDecoration(
          borderRadius:
              BorderRadius.circular(14),

          boxShadow: isHovered
              ? [
                  BoxShadow(
                    color: AppColors.primary
                        .withOpacity(0.35),
                    blurRadius: 25,
                    spreadRadius: 2,
                  ),
                ]
              : [],
        ),

        child: ElevatedButton(
          onPressed: widget.onPressed,

          style: ElevatedButton.styleFrom(
            elevation: 0,

            backgroundColor:
                AppColors.primary,

            foregroundColor:
                Colors.black,

            padding:
                const EdgeInsets.symmetric(
              horizontal: 28,
              vertical: 18,
            ),

            shape:
                RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(14),
            ),
          ),

          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (widget.icon != null)
                Padding(
                  padding:
                      const EdgeInsets.only(
                    right: 8,
                  ),
                  child: Icon(
                    widget.icon,
                    size: 20,
                  ),
                ),

              Text(
                widget.text,
                style: const TextStyle(
                  fontWeight:
                      FontWeight.w600,
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}