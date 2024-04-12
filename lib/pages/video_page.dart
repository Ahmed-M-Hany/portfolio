import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
class VideoScreen extends StatelessWidget {
  const VideoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.5),
      body: Stack(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Container(
              color: Colors.black.withOpacity(0.6),
              height: double.infinity,
              width: double.infinity,
            ),
          ),
          Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.7,
              child: const HtmlWidget(
                '<iframe src="https://www.youtube-nocookie.com/embed/TVoMrmlqIcg?si=s1Q18VohepHyLSuo&autoplay=1&color=#00C4F0" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
