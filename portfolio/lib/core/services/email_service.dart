import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class EmailService {
  static const String _url =
      'https://api.emailjs.com/api/v1.0/email/send';

  static Future<void> sendEmail({
    required String name,
    required String email,
    required String message,
  }) async {
    final response = await http.post(
      Uri.parse(_url),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'service_id': dotenv.env['EMAILJS_SERVICE_ID'],
        'template_id': dotenv.env['EMAILJS_TEMPLATE_ID'],
        'user_id': dotenv.env['EMAILJS_PUBLIC_KEY'],
        'template_params': {
          'name': name,
          'email': email,
          'message': message,
        },
      }),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to send email: ${response.body}');
    }
  }
}
