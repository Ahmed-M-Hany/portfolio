import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../constants/colors.dart';
import '../../widgets/logo.dart';

class MainSection extends StatelessWidget {
  const MainSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    bool isMobile=
        MediaQuery.of(context).size.width < 600; // Check if the screen is mobile
    return Wrap(
      alignment: WrapAlignment.spaceAround,
      crossAxisAlignment: WrapCrossAlignment.center,
      textDirection: TextDirection.rtl,
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: CustomColor.blue.withOpacity(0.5),
                blurRadius: 25,
                spreadRadius: 2,
              ),
            ],
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              CircleAvatar(
                radius: isMobile?170:210,
                backgroundColor: CustomColor.blue,
                child: CircleAvatar(
                  radius: isMobile?140:170,
                  backgroundColor: CustomColor.scaffoldBg,
                ),
              ),
              ShaderMask(
                shaderCallback: (Rect bounds) {
                  return LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black,
                      Colors.transparent,
                    ],
                    stops: [0.9, 1.0],
                  ).createShader(bounds);
                },
                blendMode: BlendMode.dstIn,
                child: Image.asset(
                  "assets/images/protfolioImage.png",
                  height: isMobile?400:500,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
        Wrap(
          alignment: WrapAlignment.start,
          children: [
            Column(
              children: [
                const Logo(
                  logoText: "Ahmed Hany",
                ),
                 Text(
                  "Flutter Developer",
                  style: TextStyle(
                    fontSize: isMobile?16:32,
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
                            "https://api.whatsapp.com/send/?phone=201063029878"));
                      },
                      iconSize: isMobile?16:28,
                      icon: const FaIcon(FontAwesomeIcons.whatsapp,
                          color: Colors.green),
                    ),
                    IconButton(
                      iconSize: isMobile?16:28,

                      padding: EdgeInsets.zero,
                      //use twitter icon from font awesome
                      onPressed: () async {
                        //use url launcher to launch the mailto link
                        await launchUrl(Uri.parse(
                            "https://www.linkedin.com/in/ahmed-m-hany/"));
                      },
                      icon: const FaIcon(
                        FontAwesomeIcons.linkedinIn,
                        color: Colors.blue,
                      ),
                    ),
                    IconButton(
                      iconSize: isMobile?16:28,

                      onPressed: () async {
                        //use url launcher to launch the mailto link
                        await launchUrl(Uri.parse(
                            "https://github.com/ahmed-m-hany"));
                      },
                      icon: const FaIcon(
                        FontAwesomeIcons.github,
                      ),
                    ),
                    IconButton(
                      iconSize: isMobile?16:28,

                      //use twitter icon from font awesome
                      onPressed: () async {
                        //use url launcher to launch the mailto link
                        await launchUrl(Uri.parse(
                            "mailto:ahmed.m.hany78@gmail.com?subject=Flutter Development"));
                      },
                      icon: const FaIcon(
                        FontAwesomeIcons.envelope,
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
    );
  }
}