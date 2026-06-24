import '../config/portfolio_config.dart';
import 'url_launcher_service.dart';

class ResumeService {
  static Future<void> openResume() async {
    await UrlLauncherService.launchUrlLink(
      PortfolioConfig.resumeLink,
    );
  }
}