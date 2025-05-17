import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/constants/projects_data.dart';
import 'package:portfolio/pages/sections/projects_section/cubit/project_index_cubit.dart';
import '../../../../constants/colors.dart';
import '../../../transparent_page_route.dart';
import '../../../video_page.dart';

class ProjectsCarouselItem extends StatelessWidget {
  const ProjectsCarouselItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(4),
      padding: EdgeInsets.all(16),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: CustomColor.bgLight1,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: CustomColor.blue.withOpacity(0.3),
            blurRadius: 2,
            spreadRadius: 2,
          ),
        ],
      ),

      child: const ProjectItemContent()
    );
  }
}

class ProjectItemContent extends StatelessWidget {
  const ProjectItemContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    //flex can be a column or row depending on the {direction}
    return Flex(
      direction: MediaQuery.of(context).size.width>600?Axis.horizontal:Axis.vertical,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [

        ProjectPreview(),

        ProjectDetails(),

      ],
    );
  }
}

class ProjectDetails extends StatelessWidget {
  const ProjectDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    bool isMobile=
        MediaQuery.of(context).size.width < 600; // Check if the screen is mobile
    return Expanded(
      flex: isMobile?0:1,
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 8,
          children: [
      
            ProjectTitle(),
      
            ProjectDescription(),
      
          ],
        ),
      ),
    );
  }
}

class ProjectPreview extends StatelessWidget {
  const ProjectPreview({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<ProjectIndexCubit>(context);
    var currentProject=ProjectsData.projects[cubit.index];
    return Expanded(
      flex: MediaQuery.of(context).size.width>600?1:2,
      child: Center(
        child: InkWell(
          enableFeedback: true,
          onTap: (){
            if(currentProject.hasVideo) {
              Navigator.of(context).push(MaterialTransparentRoute(
                builder: (context)=>BlocProvider.value(value:cubit ,child: const VideoScreen()))
            );
            }
          },

          child: Stack(
            alignment: Alignment.center,
            children: [
              ClipRRect(
                borderRadius:  BorderRadius.circular(20),
                child: Image.asset(
                  currentProject.image,

                ),
              ),

              BlackLayer(currentProject: currentProject),

              currentProject.hasVideo?const BlueYoutubeButton():Container(),

            ],
          ),
        ),
      ),
    );
  }
}

class BlueYoutubeButton extends StatelessWidget {
  const BlueYoutubeButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      bottom: 0,
      left: 0,
      right: 0,
      child: Icon(
        FontAwesomeIcons.youtube,
        size: 70,
        color: CustomColor.blue.withOpacity(0.8),
      ),
    );
  }
}

class BlackLayer extends StatelessWidget {
  const BlackLayer({
    super.key,
    required this.currentProject,
  });

  final Project currentProject;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.asset(
        currentProject.image,
        color: CustomColor.bgLight2.withOpacity(0.3),
      ),
    );
  }
}

class ProjectDescription extends StatelessWidget {
  const ProjectDescription({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    bool isMobile=
        MediaQuery.of(context).size.width < 600; // Check if the screen is mobile
    var cubit = BlocProvider.of<ProjectIndexCubit>(context);
    return Text(
      textAlign: TextAlign.start,
      style: TextStyle(
        fontSize: 16,
      ),
      maxLines: 10,
      ProjectsData.projects[cubit.index].description,
      overflow: TextOverflow.ellipsis,
    );
  }
}

class ProjectTitle extends StatelessWidget {
  const ProjectTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    bool isMobile=
        MediaQuery.of(context).size.width < 600; // Check if the screen is mobile
    var cubit =BlocProvider.of<ProjectIndexCubit>(context);
    return Text(
      ProjectsData.projects[cubit.index].name,
      style: TextStyle(
        fontSize: isMobile?24:36,
        fontWeight: FontWeight.bold,
        color: CustomColor.blue,
      ),
    );
  }
}
