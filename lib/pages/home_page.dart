import 'package:carousel_slider/carousel_slider.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio/constants/colors.dart';
import 'package:portfolio/pages/sections/main_section/main_section.dart';
import 'package:portfolio/pages/sections/projects_section/project_section.dart';
import 'package:portfolio/pages/sections/skills_section/skills_section.dart';
import 'package:portfolio/pages/widgets/CustomDrawer.dart';
import 'package:portfolio/pages/widgets/Header.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Header(),
            PageBody(scrollController: scrollController, navItems: navItems),
          ],
        ),
      ),
    );
  }
}

class PageBody extends StatelessWidget {
  const PageBody({
    super.key,
    required this.scrollController,
    required this.navItems,
  });

  final ItemScrollController scrollController;
  final List<Widget> navItems;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ScrollablePositionedList.builder(
        itemScrollController: scrollController,
        scrollDirection: Axis.vertical,
        itemCount: navItems.length,
        itemBuilder: (context, index) => navItems[index],
      ),
    );
  }
}
