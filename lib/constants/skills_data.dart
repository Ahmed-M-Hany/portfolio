

abstract class SkillsData{
  static List<Skill> skills=[
      Skill(
        description: "can use flutter to make highly scalable apps",
        name: "Flutter",
        iconPath: "assets/images/flutter.png",
      ),
      Skill(
        description: "working with many programming languages with ease including dart",
        name: "Dart",
        iconPath: "assets/images/dart.png",
      ),
      Skill(
        description: "can use firebase to create highly scalable backends",
        name: "Firebase",
        iconPath: "assets/images/firebase.png",
      ),
      Skill(
        description: "ability to work with teams using git version control",
        name: "Git/Github",
        iconPath: "assets/images/git.png",
      ),
      Skill(
        description: "collaborate with UI/UX designers through figma",
        name: "Figma",
        iconPath: "assets/images/figma.png",
      ),
      Skill(
        description: "utilizing bloc as my primary state management in flutter",
        iconPath: "assets/images/logo.webp",
        name: "bloc",
      ),
      Skill(
        description: "mobile design or web design? I can do both",
        iconPath: "assets/images/responsive.png",
        name: "Responsive Design",
      ),
      Skill(
        description: "MVVM stands for model view view model",
        iconPath: "assets/images/architecture.png",
        name: "MVVM",
      ),
      Skill(
        description: "connecting with backend through APIs",
        iconPath: "assets/images/api.png",
        name: "Rest APIs",
      ),
  ];
}

class Skill {
  Skill({required this.iconPath, required this.description, required this.name});
  final String iconPath;
  final String description;
  final String name;
}