

import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../constants/colors.dart';

class CardsProjectsItems extends StatelessWidget {
  const CardsProjectsItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
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
    return SizedBox(
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
    );
  }
}