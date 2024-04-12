import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../constants/colors.dart';
import '../../constants/nav_items_strings.dart';
import '../home_page.dart';


class HeaderDesktop extends StatelessWidget {
  const HeaderDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      width: double.infinity,
      alignment: Alignment.topCenter,
      decoration: BoxDecoration(
        gradient: const LinearGradient(colors: [
          Colors.transparent,
          CustomColor.bgLight1,
        ]),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Row(
        children: [
          //download cv button
          TextButton(
            onPressed: () async {
              //use url launcher to launch the whatsapp link
              await launchUrl(Uri.parse(
                  "https://drive.google.com/file/d/1ZzOqeCgHyW7yPB7R6nGE8gAoVwdy8X5Z/view?usp=sharing"));
            },
            style: TextButton.styleFrom(
              backgroundColor: CustomColor.blue,
              enableFeedback: true,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100),
              ),
            ),
            child: Text(
              "Download CV",
              style: TextStyle(color: CustomColor.whitePrimary),
            ),
          ),
          const Spacer(),
          for (int i = 0; i < navItemsStrings.length; i++)
            Padding(
              padding: const EdgeInsets.only(right: 16.0, bottom: 4),
              child: TextButton(
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
                clipBehavior: Clip.none,
                onPressed: () {
                  context
                      .findAncestorStateOfType<HomePageState>()
                      ?.scrollToIndex(i);
                },
                child: Text(
                  navItemsStrings[i],
                  style: const TextStyle(
                    overflow: TextOverflow.visible,
                    color: CustomColor.whitePrimary,
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
