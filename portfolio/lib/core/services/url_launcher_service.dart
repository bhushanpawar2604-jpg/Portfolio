import 'package:url_launcher/url_launcher.dart';

class UrlLauncherService {
  static Future<void> launchUrlLink(
    String url,
  ) async {
    final uri = Uri.parse(url);

    await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    );
  }

  static Future<void> launchEmail(
    String email,
  ) async {
    final uri = Uri(
      scheme: 'mailto',
      path: email,
    );

    await launchUrl(uri);
  }

  static Future<void> launchPhone(
    String phone,
  ) async {
    final uri = Uri(
      scheme: 'tel',
      path: phone,
    );

    await launchUrl(uri);
  }
}