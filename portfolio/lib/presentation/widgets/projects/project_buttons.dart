import 'package:flutter/material.dart';

class ProjectButtons extends StatelessWidget {
  final VoidCallback onGithub;
  final VoidCallback onDemo;

  const ProjectButtons({
    super.key,
    required this.onGithub,
    required this.onDemo,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: OutlinedButton.icon(
            onPressed: onGithub,
            icon: const Icon(Icons.code),
            label: const Text("GitHub"),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: ElevatedButton.icon(
            onPressed: onDemo,
            icon: const Icon(Icons.launch),
            label: const Text("Demo"),
          ),
        ),
      ],
    );
  }
}