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
                radius: 210,
                backgroundColor: CustomColor.blue,
                child: CircleAvatar(
                  radius: 170,
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
                  height: 500,
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
                const Text(
                  "Flutter Developer",
                  style: TextStyle(
                    fontSize: 32,
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
                            "https://api.whatsapp.com/send/?phone=201154951688&text=Hello"));
                      },
                      iconSize: 28,
                      icon: const FaIcon(FontAwesomeIcons.whatsapp,
                          color: Colors.green),
                    ),
                    IconButton(
                      iconSize: 28,

                      padding: EdgeInsets.zero,
                      //use twitter icon from font awesome
                      onPressed: () async {
                        //use url launcher to launch the mailto link
                        await launchUrl(Uri.parse(
                            "https://www.linkedin.com/in/ahmed-hany-3a86351b8/"));
                      },
                      icon: const FaIcon(
                        FontAwesomeIcons.linkedinIn,
                        color: Colors.blue,
                      ),
                    ),
                    IconButton(
                      iconSize: 28,

                      onPressed: () async {
                        //use url launcher to launch the mailto link
                        await launchUrl(Uri.parse(
                            "https://github.com/ahmedhany20200050"));
                      },
                      icon: const FaIcon(
                        FontAwesomeIcons.github,
                      ),
                    ),
                    IconButton(
                      iconSize: 28,

                      //use twitter icon from font awesome
                      onPressed: () async {
                        //use url launcher to launch the mailto link
                        await launchUrl(Uri.parse(
                            "mailto:ahmedhany20200050@gmail.com?subject=Flutter Development&body=Hello"));
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