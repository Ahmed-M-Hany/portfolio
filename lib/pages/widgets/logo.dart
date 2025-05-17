import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import '../../constants/colors.dart';

class Logo extends StatelessWidget {
  const Logo({super.key, required this.logoText, this.onTap});
  final String logoText;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return DefaultTextStyle(
      style:TextStyle(
        fontFamily: 'NextArt',
        color: CustomColor.blue,
        fontWeight: FontWeight.w700,
        fontSize: width>500?64:54,
      ),
      child: AnimatedTextKit(
        onTap: onTap,
        totalRepeatCount: 1,
        displayFullTextOnTap: true,
        animatedTexts: [
          TyperAnimatedText(
            curve: Curves.linear,
            speed: const Duration(milliseconds: 80),
            logoText,
          ),
        ],
      ),
    );
  }
}
