import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:portfolio/constants/projects_data.dart';
import 'package:portfolio/pages/sections/projects_section/cubit/project_index_cubit.dart';
import 'package:portfolio/pages/sections/projects_section/section_widgets/project_item.dart';
import '../../../constants/colors.dart';

class Projects extends StatefulWidget {
  const Projects({super.key});

  @override
  State<Projects> createState() => _ProjectsState();
}

class _ProjectsState extends State<Projects> {
  bool showGuide = true;
  List<BlocProvider> _createProjectsList(){
    List<BlocProvider> result=[];

    for (int i = 0; i < ProjectsData.projects.length; i++) {

      result.add(BlocProvider<ProjectIndexCubit>(
        create: (context) => ProjectIndexCubit(i),
        child: const ProjectsCarouselItem(),
      ));

    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    bool isMobile=
        MediaQuery.of(context).size.width < 600; // Check if the screen is mobile
    return GestureDetector(
      onHorizontalDragDown: (details) {
        setState(() {
          showGuide = false;
        });
      },
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            color: CustomColor.scaffoldBg,

            child: Column(
              children: [
                SizedBox(
                  height: 16,
                ),

                Text(
                  "Projects",
                  style: TextStyle(
                    fontSize: isMobile?32:50,
                    fontFamily: "NextArt",
                    fontWeight: FontWeight.bold,
                    color: CustomColor.blue,
                  ),
                ),

                //make a coruaousel slider for the projects
                CarouselSlider(
                  items: _createProjectsList(),

                  options: CarouselOptions(

                    autoPlayInterval: const Duration(seconds: 8),
                  autoPlay: true,
                  height: MediaQuery.sizeOf(context).height-160,
                  initialPage: 0,
                  enlargeCenterPage: true,
                  pauseAutoPlayOnManualNavigate: true,
                  pauseAutoPlayOnTouch: true,
                  clipBehavior: Clip.none,
                  pauseAutoPlayInFiniteScroll: true,
                  enableInfiniteScroll: false,
                ),

                ),

                SizedBox(
                  height: 16,
                )
              ],
            ),
          ),
          //user lottie for hand swipe
          if(showGuide)Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 0,
            child: IgnorePointer(
              child: Center(
                child: LottieBuilder.asset("assets/lottie/hand_swipe.json",fit: BoxFit.contain,)
              ),
            ),
          )
        ],
      ),
    );
  }
}
