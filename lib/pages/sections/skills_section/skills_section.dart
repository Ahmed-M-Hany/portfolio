

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio/pages/sections/skills_section/section_widgets/skill_item.dart';

import '../../../constants/colors.dart';

class Skills extends StatelessWidget {
  const Skills({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16.sp),
      color: CustomColor.bgLight1,
      child: Column(
        children: [
          SizedBox(
            height: 16.sp,
          ),
          Text(
            "Skills",
            style: TextStyle(
              fontSize: 16.sp,
              color: CustomColor.blue,
            ),
          ),
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 4.sp,
            children:  [
              SkillItem(
                color: CustomColor.blue,
                skillName: "Flutter",
                imagePath: "assets/images/flutter.png",
              ),
              SkillItem(
                color: CustomColor.blue,
                skillName: "Dart",
                imagePath: "assets/images/dart.png",
              ),
              SkillItem(
                color: CustomColor.blue,
                skillName: "Firebase",
                imagePath: "assets/images/firebase.png",
              ),
              SkillItem(
                color: CustomColor.blue,
                skillName: "Git/Github",
                imagePath: "assets/images/git.png",
              ),
              SkillItem(
                color: CustomColor.blue,
                skillName: "Figma",
                imagePath: "assets/images/figma.png",
              ),
              SkillItem(
                color: CustomColor.blue,
                imagePath: "assets/images/logo.webp",
                skillName: "bloc",
              ),
              SkillItem(
                color: CustomColor.blue,
                imagePath: "assets/images/responsive.png",
                skillName: "Responsive Design",
              ),
              SkillItem(
                color: CustomColor.blue,
                imagePath: "assets/images/architecture.png",
                skillName: "MVVM",
              ),
              SkillItem(
                color: CustomColor.blue,
                imagePath: "assets/images/api.png",
                skillName: "Rest APIs",
              ),
            ],
          ),
          SizedBox(
            height: 16.sp,
          ),
        ],
      ),
    );
  }
}
