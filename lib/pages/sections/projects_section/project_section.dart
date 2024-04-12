import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio/constants/projects_data.dart';
import 'package:portfolio/pages/sections/projects_section/cubit/project_index_cubit.dart';
import 'package:portfolio/pages/sections/projects_section/section_widgets/project_item.dart';
import '../../../constants/colors.dart';

class Projects extends StatelessWidget {
  const Projects({super.key});

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
    return Container(
      width: double.infinity,
      color: CustomColor.scaffoldBg,

      child: Column(
        children: [
          SizedBox(
            height: 16.sp,
          ),

          Text(
            "Projects",
            style: TextStyle(
              fontSize: 16.sp,
              color: CustomColor.blue,
            ),
          ),

          //make a coruaousel slider for the projects
          CarouselSlider(
            items: _createProjectsList(),
            options: CarouselOptions(
            height: MediaQuery
                .of(context)
                .size
                .height * 0.9,
            aspectRatio: 1 / 1,
            autoPlay: true,
            initialPage: 0,
            enlargeCenterPage: true,
            pauseAutoPlayOnManualNavigate: true,
            pauseAutoPlayOnTouch: true,
            clipBehavior: Clip.hardEdge,
            enableInfiniteScroll: false,
          ),

          ),

          SizedBox(
            height: 16.sp,
          )
        ],
      ),
    );
  }
}
