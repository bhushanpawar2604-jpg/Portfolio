import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/config/portfolio_config.dart';
import '../../../core/theme/app_colors.dart';

class ContactForm extends StatefulWidget {
  const ContactForm({super.key});

  @override
  State<ContactForm> createState() =>
      _ContactFormState();
}

class _ContactFormState
    extends State<ContactForm> {
  final _formKey =
      GlobalKey<FormState>();

  final _nameController =
      TextEditingController();

  final _emailController =
      TextEditingController();

  final _messageController =
      TextEditingController();

  Future<void> _sendEmail() async {
    if (!_formKey.currentState!
        .validate()) {
      return;
    }

    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: PortfolioConfig.email,
      query:
          'subject=Portfolio Contact'
          '&body=Name: ${_nameController.text}'
          '\nEmail: ${_emailController.text}'
          '\n\n${_messageController.text}',
    );

    await launchUrl(emailUri);
  }

  InputDecoration fieldStyle(
    String hint,
  ) {
    return InputDecoration(
      hintText: hint,

      hintStyle: const TextStyle(
        color: AppColors.grey,
      ),

      filled: true,

      fillColor:
          Colors.white.withOpacity(
        0.04,
      ),

      border: OutlineInputBorder(
        borderRadius:
            BorderRadius.circular(18),
        borderSide: BorderSide.none,
      ),

      enabledBorder:
          OutlineInputBorder(
        borderRadius:
            BorderRadius.circular(18),
        borderSide: BorderSide(
          color: AppColors.border,
        ),
      ),

      focusedBorder:
          OutlineInputBorder(
        borderRadius:
            BorderRadius.circular(18),
        borderSide: const BorderSide(
          color: AppColors.primary,
          width: 1.5,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          const EdgeInsets.all(24),
      decoration: BoxDecoration(
        borderRadius:
            BorderRadius.circular(28),
        gradient: LinearGradient(
          colors: [
            Colors.white.withOpacity(
              0.05,
            ),
            Colors.white.withOpacity(
              0.02,
            ),
          ],
        ),
        border: Border.all(
          color: AppColors.border,
        ),
      ),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller:
                  _nameController,
              decoration:
                  fieldStyle(
                "Your Name",
              ),
              validator: (v) =>
                  v!.isEmpty
                      ? "Enter Name"
                      : null,
            ),

            const SizedBox(height: 18),

            TextFormField(
              controller:
                  _emailController,
              decoration:
                  fieldStyle(
                "Your Email",
              ),
              validator: (v) =>
                  v!.isEmpty
                      ? "Enter Email"
                      : null,
            ),

            const SizedBox(height: 18),

            TextFormField(
              controller:
                  _messageController,
              maxLines: 6,
              decoration:
                  fieldStyle(
                "Message",
              ),
              validator: (v) =>
                  v!.isEmpty
                      ? "Enter Message"
                      : null,
            ),

            const SizedBox(height: 24),

            SizedBox(
              width: double.infinity,
              height: 58,
              child: ElevatedButton.icon(
                onPressed: _sendEmail,
                icon: const Icon(
                  Icons.send,
                ),
                label: const Text(
                  "Send Message",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}