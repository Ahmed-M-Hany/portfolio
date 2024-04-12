import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
      height: MediaQuery.of(context).size.height * 0.6,
      margin: EdgeInsets.all(4.sp),
      padding: EdgeInsets.all(4.sp),
      decoration: BoxDecoration(
        color: CustomColor.bgLight1,
        borderRadius: BorderRadius.circular(8.r),
        boxShadow: [
          BoxShadow(
            color: CustomColor.blue.withOpacity(0.3),
            blurRadius: 2.sp,
            spreadRadius: 2.sp,
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
    return const Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          ProjectTitle(),

          ProjectDescription(),

        ],
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
    return Expanded(
      child: Center(
        child: InkWell(
          enableFeedback: true,
          hoverColor: Colors.transparent,

          onTap: (){
            Navigator.of(context).push(MaterialTransparentRoute(
                builder: (context)=>const VideoScreen())
            );
          },

          child: Stack(
            children: [
              Image.asset(
                "assets/images/projects_images/BookStore.jpg",
                height: 200.sp,
              ),

              Image.asset(
                "assets/images/projects_images/BookStore.jpg",
                height: 200.sp,
                color: CustomColor.bgLight2.withOpacity(0.3),
              ),

              Positioned(
                top: 0,
                bottom: 0,
                left: 0,
                right: 0,
                child: Icon(
                  FontAwesomeIcons.youtube,
                  size: 25.sp,
                  color: CustomColor.blue.withOpacity(0.8),
                ),
              ),

            ],
          ),
        ),
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
    return Text(
      '''A book store app that allows users to browse books, add them to cart, and purchase them. The app also allows users to search for books by name.''',
      maxLines: 5,
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
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Text(
        "Book Store App",
        style: TextStyle(
          fontSize: 12.sp,
          fontWeight: FontWeight.bold,
          color: CustomColor.blue,
        ),
      ),
    );
  }
}
