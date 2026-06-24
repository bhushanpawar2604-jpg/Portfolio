import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';

class ContactInfoCard extends StatefulWidget {
  final IconData icon;
  final String title;
  final String value;
  final VoidCallback onTap;

  const ContactInfoCard({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
    required this.onTap,
  });

  @override
  State<ContactInfoCard> createState() =>
      _ContactInfoCardState();
}

class _ContactInfoCardState
    extends State<ContactInfoCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) =>
          setState(() => isHovered = true),
      onExit: (_) =>
          setState(() => isHovered = false),
      child: InkWell(
        borderRadius:
            BorderRadius.circular(24),
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration:
              const Duration(milliseconds: 250),
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            borderRadius:
                BorderRadius.circular(24),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.white.withOpacity(
                  0.06,
                ),
                Colors.white.withOpacity(
                  0.02,
                ),
              ],
            ),
            border: Border.all(
              color: isHovered
                  ? AppColors.primary
                  : AppColors.border,
            ),
            boxShadow: isHovered
                ? [
                    BoxShadow(
                      color: AppColors.primary
                          .withOpacity(0.18),
                      blurRadius: 25,
                    ),
                  ]
                : [],
          ),
          child: Row(
            children: [
              Container(
                width: 58,
                height: 58,
                decoration: BoxDecoration(
                  color: AppColors.primary
                      .withOpacity(0.12),
                  borderRadius:
                      BorderRadius.circular(
                    16,
                  ),
                ),
                child: Icon(
                  widget.icon,
                  color: AppColors.primary,
                ),
              ),

              const SizedBox(width: 18),

              Expanded(
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.title,
                      style:
                          const TextStyle(
                        color:
                            Colors.white,
                        fontWeight:
                            FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),

                    const SizedBox(height: 6),

                    Text(
                      widget.value,
                      style:
                          const TextStyle(
                        color:
                            AppColors.grey,
                      ),
                    ),
                  ],
                ),
              ),

              AnimatedRotation(
                turns:
                    isHovered ? 0.125 : 0,
                duration:
                    const Duration(
                  milliseconds: 250,
                ),
                child: const Icon(
                  Icons.arrow_forward,
                  color: AppColors.primary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}