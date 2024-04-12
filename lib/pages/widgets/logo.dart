import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../constants/colors.dart';

class Logo extends StatelessWidget {
  const Logo({super.key, required this.logoText, this.onTap});
  final String logoText;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style:TextStyle(
        fontFamily: 'NextArt',
        color: CustomColor.blue,
        fontWeight: FontWeight.w700,
        fontSize: 18.sp,
      ),
      child: AnimatedTextKit(
        onTap: onTap,
        pause: const Duration(milliseconds: 0),
        totalRepeatCount: 1,
        displayFullTextOnTap: true,
        animatedTexts: [
          TyperAnimatedText(
            curve: Curves.bounceInOut,
            speed: const Duration(milliseconds: 600),
            logoText,
          ),
        ],
      ),
    );
  }
}
