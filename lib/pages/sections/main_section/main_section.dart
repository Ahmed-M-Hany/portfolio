import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
      textDirection: TextDirection.rtl,
      direction: Axis.horizontal,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: CustomColor.blue.withOpacity(0.5),
                blurRadius: 25.sp,
                spreadRadius: 2.sp,
              ),
            ],
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              CircleAvatar(
                radius: 50.sp,
                backgroundColor: CustomColor.blue,
                child: CircleAvatar(
                  radius: 40.sp,
                  backgroundColor: CustomColor.scaffoldBg,
                ),
              ),
              Image.asset(
                "assets/images/protfolioImage.png",
                height: 120.sp,
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
                    fontSize: 10.sp,
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
                      iconSize: 10.sp,
                      icon: FaIcon(FontAwesomeIcons.whatsapp,
                          color: Colors.green),
                    ),
                    IconButton(
                      iconSize: 10.sp,

                      padding: EdgeInsets.zero,
                      //use twitter icon from font awesome
                      onPressed: () async {
                        //use url launcher to launch the mailto link
                        await launchUrl(Uri.parse(
                            "https://www.linkedin.com/in/%D8%A7%D8%AD%D9%85%D8%AF-%D9%87%D8%A7%D9%86%D9%8A-3a86351b8/"));
                      },
                      icon: FaIcon(
                        FontAwesomeIcons.linkedinIn,
                        color: Colors.blue,
                      ),
                    ),
                    IconButton(
                      iconSize: 10.sp,

                      onPressed: () async {
                        //use url launcher to launch the mailto link
                        await launchUrl(Uri.parse(
                            "https://github.com/ahmedhany20200050"));
                      },
                      icon: FaIcon(
                        FontAwesomeIcons.github,
                      ),
                    ),
                    IconButton(
                      iconSize: 10.sp,

                      //use twitter icon from font awesome
                      onPressed: () async {
                        //use url launcher to launch the mailto link
                        await launchUrl(Uri.parse(
                            "mailto:ahmedhany20200050@gmail.com?subject=Flutter Development&body=Hello"));
                      },
                      icon: FaIcon(
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
