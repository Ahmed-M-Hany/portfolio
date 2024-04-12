import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../constants/colors.dart';


class HeaderMobile extends StatelessWidget {
  const HeaderMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: const LinearGradient(colors: [
          Colors.transparent,
          CustomColor.bgLight1,
        ]),
        borderRadius: BorderRadius.circular(100),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextButton(
            onPressed: () async {
              //use url launcher to launch the whatsapp link
              await launchUrl(Uri.parse(
                  "https://drive.google.com/file/d/1ZzOqeCgHyW7yPB7R6nGE8gAoVwdy8X5Z/view?usp=sharing"));
            },
            style: TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              backgroundColor: CustomColor.blue,
              enableFeedback: true,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100),
              ),
            ),
            child: Text(
              "Download CV",
              style: TextStyle(
                color: CustomColor.whitePrimary,
              ),
            ),
          ),
          const Spacer(),
          IconButton(
            onPressed: () {
              Scaffold.of(context).openEndDrawer();
            },
            icon: const Icon(Icons.menu),
            padding: EdgeInsets.zero,
          ),
        ],
      ),
    );
  }
}
