import 'package:animated_text_kit/animated_text_kit.dart';
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
        child: Column(
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
        ),
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Wrap(
          alignment: WrapAlignment.spaceAround,
          textDirection: TextDirection.rtl,
          direction: Axis.horizontal,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(150),
              ),
              child: Image.asset(
                "assets/images/protfolioImage.png",
                fit: BoxFit.scaleDown,
                scale: MediaQuery.of(context).size.width > 600 ? 1.5 : 2,
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
                    Text("Flutter Developer",
                    style: TextStyle(
                      fontSize: 10.sp,
                    ),),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          //use twitter icon from font awesome
                          onPressed: () {},
                          icon: FaIcon(FontAwesomeIcons.whatsapp,
                              size: 14, color: Colors.green),
                        ),
                        IconButton(
                          //use twitter icon from font awesome
                          onPressed: () {},
                          icon: FaIcon(
                            FontAwesomeIcons.linkedinIn,
                            size: 14,
                            color: Colors.blue,
                          ),
                        ),
                        IconButton(
                          //use twitter icon from font awesome
                          onPressed: () {},
                          icon: FaIcon(
                            FontAwesomeIcons.github,
                            size: 14,
                          ),
                        ),
                        IconButton(
                          //use twitter icon from font awesome
                          onPressed: () {},
                          icon: FaIcon(
                            FontAwesomeIcons.envelope,
                            size: 14,
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
        Align(
          alignment: Alignment.topCenter,
          child: DefaultTextStyle(
            maxLines: 1,
            style:  TextStyle(
              fontFamily: "Horizon",
              fontSize: 12.sp,
              color: CustomColor.yellowSecondary,
            ),
            child: SizedBox(
              height: 30.sp,
              width: 300,
              child: AnimatedTextKit(
                pause: const Duration(milliseconds: 0),
                repeatForever: true,
                isRepeatingAnimation: true,
                animatedTexts: [
                  RotateAnimatedText('Android'),
                  RotateAnimatedText('IOS'),
                  RotateAnimatedText('Web'),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}

class Skills extends StatelessWidget {
  const Skills({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      width: double.infinity,
      color: Colors.blueGrey,
    );
  }
}

class Projects extends StatelessWidget {
  const Projects({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      width: double.infinity,
      color: CustomColor.scaffoldBg,
    );
  }
}
