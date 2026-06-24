import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';

class CustomButton extends StatefulWidget {
  final String text;
  final IconData icon;
  final VoidCallback onPressed;

  const CustomButton({
    super.key,
    required this.text,
    required this.icon,
    required this.onPressed,
  });

  @override
  State<CustomButton> createState() =>
      _CustomButtonState();
}

class _CustomButtonState
    extends State<CustomButton> {
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
      child: AnimatedContainer(
        duration: const Duration(
          milliseconds: 250,
        ),
        transform: Matrix4.identity()
          ..scale(
            hovered ? 1.04 : 1,
          ),
        child: ElevatedButton.icon(
          onPressed: widget.onPressed,
          icon: Icon(widget.icon),
          label: Text(widget.text),
          style: ElevatedButton.styleFrom(
            backgroundColor:
                AppColors.primary,
            foregroundColor:
                Colors.black,
            padding:
                const EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 18,
            ),
            shape:
                RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(
                16,
              ),
            ),
          ),
        ),
      ),
    );
  }
}