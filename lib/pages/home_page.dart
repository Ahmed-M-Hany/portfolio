import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio/constants/colors.dart';
import 'package:portfolio/constants/nav_items_strings.dart';
import 'package:portfolio/widgets/Header.dart';
import 'package:portfolio/widgets/header_desktop.dart';
import 'package:portfolio/widgets/header_mobile.dart';
import 'package:portfolio/widgets/logo.dart';
import 'package:provider/provider.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../widgets/CustomDrawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final ItemScrollController scrollController = ItemScrollController();
  List<Widget> navItems = [
    const MainSection(),
    const Skills(),
    const Projects()
  ];
  double iconsSize = 10.sp;
  Future<void> scrollToIndex(int index) async {
    await scrollController.scrollTo(
      index: index,
      duration: const Duration(seconds: 1),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const CustomDrawer(),
      backgroundColor: CustomColor.scaffoldBg,
      body: SafeArea(
        child: LayoutBuilder(builder: (context, constraints) {
          return Column(
            children: [
              const Header(),
              Expanded(
                child: ScrollablePositionedList.builder(
                  itemScrollController: scrollController,
                  scrollDirection: Axis.vertical,
                  itemCount: navItems.length,
                  itemBuilder: (context, index) => navItems[index],
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}

class MainSection extends StatelessWidget {
  const MainSection({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Wrap(
            alignment: WrapAlignment.spaceAround,
            textDirection: TextDirection.rtl,
            direction: Axis.horizontal,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: CustomColor.blue.withOpacity(0.5),
                      blurRadius: 25.sp,
                      spreadRadius: 2.sp,
                    ),
                  ],
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    CircleAvatar(
                      radius: 50.sp,
                      backgroundColor: CustomColor.blue,
                      child: CircleAvatar(
                        radius: 40.sp,
                        backgroundColor: CustomColor.scaffoldBg,
                      ),
                    ),
                    Image.asset(
                      "assets/images/protfolioImage.png",
                      height: 120.sp,
                    ),
                  ],
                ),
              ),
              Wrap(
                alignment: WrapAlignment.center,
                children: [
                  Column(
                    children: [
                      Logo(
                        logoText: "Ahmed Hany",
                      ),
                      Text(
                        "Flutter Developer",
                        style: TextStyle(
                          fontSize: 10.sp,
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            //use twitter icon from font awesome
                            onPressed: () async {
                              //use url launcher to launch the whatsapp link
                              await launchUrl(Uri.parse(
                                  "https://api.whatsapp.com/send/?phone=201154951688&text=Hello"));
                            },
                            icon: FaIcon(FontAwesomeIcons.whatsapp,
                                size: 8.sp, color: Colors.green),
                          ),
                          IconButton(
                            //use twitter icon from font awesome
                            onPressed: () async {
                              //use url launcher to launch the mailto link
                              await launchUrl(Uri.parse(
                                  "https://www.linkedin.com/in/%D8%A7%D8%AD%D9%85%D8%AF-%D9%87%D8%A7%D9%86%D9%8A-3a86351b8/"));
                            },
                            icon: FaIcon(
                              FontAwesomeIcons.linkedinIn,
                              size: 8.sp,
                              color: Colors.blue,
                            ),
                          ),
                          IconButton(
                            onPressed: () async {
                              //use url launcher to launch the mailto link
                              await launchUrl(Uri.parse(
                                  "https://github.com/ahmedhany20200050"));
                            },
                            icon: FaIcon(
                              FontAwesomeIcons.github,
                              size: 8.sp,
                            ),
                          ),
                          IconButton(
                            //use twitter icon from font awesome
                            onPressed: () async {
                              //use url launcher to launch the mailto link
                              await launchUrl(Uri.parse(
                                  "mailto:ahmedhany20200050@gmail.com?subject=Flutter Development&body=Hello"));
                            },
                            icon: FaIcon(
                              FontAwesomeIcons.envelope,
                              size: 8.sp,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          // DefaultTextStyle(
          //   maxLines: 1,
          //   style: TextStyle(
          //     fontFamily: "Horizon",
          //     fontSize: 12.sp,
          //     color: CustomColor.blue,
          //   ),
          //   child: SizedBox(
          //     height: 22.sp,
          //     child: AnimatedTextKit(
          //       pause: const Duration(milliseconds: 0),
          //       repeatForever: true,
          //       isRepeatingAnimation: true,
          //       animatedTexts: [
          //         RotateAnimatedText('Android'),
          //         RotateAnimatedText('IOS'),
          //         RotateAnimatedText('Web'),
          //       ],
          //     ),
          //   ),
          // ),
          // SizedBox(
          //   height: 16.sp,
          // ),
        ],
      );
    });
  }
}

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
          LayoutBuilder(
            builder: (context, constraints) => Text(
              "Skills",
              style: TextStyle(
                fontSize: 16.sp,
                color: CustomColor.blue,
              ),
            ),
          ),
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 4.sp,
            children: const [
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
                skillName: "Responsive\nDesign",
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

class SkillItem extends StatelessWidget {
  const SkillItem(
      {super.key, required this.skillName, this.imagePath, this.color});
  final String skillName;
  final String? imagePath;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return LayoutBuilder(
      builder: (context, constraints) => SizedBox(
        height: 80.sp,
        width: 64.sp,
        child: Card(
          elevation: 10,
          surfaceTintColor: CustomColor.bgLight2,
          color: CustomColor.bgLight2,
          child: Padding(
            padding: EdgeInsets.all(8.sp),
            child: LayoutBuilder(
              builder: (context, constraints) => Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  if (imagePath != null)
                    Stack(
                      children: [
                        Image.asset(
                          imagePath!,
                          height: 30.sp,
                          width: 20.sp,
                          fit: BoxFit.contain,
                          // color: color,
                        ),
                        Image.asset(
                          imagePath!,
                          height: 30.sp,
                          width: 20.sp,
                          fit: BoxFit.contain,
                          color: color?.withOpacity(0.8),
                        ),
                      ],
                    ),
                  Flexible(
                    child: Text(
                      skillName,
                      style: TextStyle(
                        fontSize: 8.sp,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Projects extends StatelessWidget {
  const Projects({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: CustomColor.scaffoldBg,
      child: Column(
        children: [
          SizedBox(
            height: 16.sp,
          ),
          LayoutBuilder(
            builder: (context, constraints) => Text(
              "Projects",
              style: TextStyle(
                fontSize: 16.sp,
                color: CustomColor.blue,
              ),
            ),
          ),
          Wrap(
            alignment: WrapAlignment.center,
            children: [
              ProjectItem(
                projectUrl: "https://github.com/ahmedhany20200050/ketapy",
                projectName: "Book Store App",
                projectDescription:
                    "Used: Http package, Cubit,Shared Preferences, Path Provider and more.",
                projectImage: "assets/images/BookStore.jpg",
              ),
              ProjectItem(
                projectUrl:
                    "https://github.com/ahmedhany20200050/OBA_VCare_App",
                projectName: "VCare App",
                projectDescription:
                    "A Clinic app that is responsible for making appointments with doctors",
                projectImage: "assets/images/VCare.PNG",
              ),
              ProjectItem(
                projectUrl:
                    "https://github.com/ahmedhany20200050/first-chat-app",
                projectName: "Chat App",
                projectDescription:
                    "Chat app with firebase \nauthentication and firestore database",
                projectImage: "assets/images/Chat.jpg",
              ),
              ProjectItem(
                projectUrl: "https://github.com/ahmedhany20200050/Clima",
                projectName: "Weather App",
                projectDescription:
                    "Weather app with open weather\n api and geolocator",
                projectImage: "assets/images/clima.jpeg",
              ),
              ProjectItem(
                projectUrl: "https://github.com/ahmedhany20200050/portfolio",
                projectName: "Portfolio",
                projectDescription: "My portfolio app",
                projectImage: "assets/images/protfolioImage.png",
              ),
              ProjectItem(
                projectUrl: "https://github.com/ahmedhany20200050/deraya",
                projectName: "Deraya Education",
                projectDescription:
                    "Used: Gallery package,Http package,\n Cubit,Youtube package, Shared \n Preferences, Path Provider, and more.",
                projectImage: "assets/images/Deraya.jpg",
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ProjectItem extends StatelessWidget {
  const ProjectItem({
    super.key,
    required this.projectName,
    required this.projectDescription,
    required this.projectImage,
    required this.projectUrl,
  });
  final String projectName;
  final String projectDescription;
  final String projectImage;
  final String projectUrl;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => SizedBox(
        width: MediaQuery.of(context).size.width / 2 - 16.sp,
        child: Card(
          elevation: 10,
          surfaceTintColor: CustomColor.bgLight1,
          color: CustomColor.bgLight1,
          child: Padding(
            padding: EdgeInsets.all(4.sp),
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    launchUrl(Uri.parse(projectUrl));
                  },
                  hoverColor: CustomColor.scaffoldBg,
                  child: Ink(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        projectImage,
                        height: 100.sp,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 8.sp,
                ),
                Text(
                  projectName,
                  style: TextStyle(
                    fontSize: 12.sp,
                  ),
                ),
                ExpandableText(
                  expanded: false,
                  projectDescription,
                  maxLines: 1,
                  style: TextStyle(
                    fontSize: 8.sp,
                  ),
                  expandText: 'Show More',
                  collapseText: 'Show Less',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
