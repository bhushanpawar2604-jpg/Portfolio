import '../constants/section_ids.dart';

class PortfolioConfig {
  static const String name = "Bhushan Pawar";

  static const String role = "Flutter Developer";

    static const String shortBio =
"I am a Flutter Developer passionate about building high-performance mobile and web applications using Flutter. I enjoy creating responsive user interfaces, integrating APIs, working with Firebase and continuously learning modern technologies.";

  static const String email =
      "bhushanpawar2604@gmail.com";

  static const String github =
      "https://github.com/bhushanpawar2604-jpg";

  static const String linkedin =
      "https://linkedin.com/in/bhushanpawar2604";

  static const String resumeLink =
      "https://your-resume-link.com";

  static const List<String> roles = [
    "Flutter Developer",
    "Mobile App Developer",
    "UI Developer",
    "Flutter Web Developer",
    "Cross Platform Developer",
    "Open Source Contributor",
    "Problem Solver"
  ];

  static final navItems = [
    {
      "title": "Home",
      "key": SectionIds.hero,
    },
    {
      "title": "About",
      "key": SectionIds.about,
    },
    {
      "title": "Skills",
      "key": SectionIds.skills,
    },
    {
      "title": "Projects",
      "key": SectionIds.projects,
    },
    {
      "title": "Contact",
      "key": SectionIds.contact,
    },
  ];
}