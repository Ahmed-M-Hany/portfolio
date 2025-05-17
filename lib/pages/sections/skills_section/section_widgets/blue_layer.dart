

import 'package:flutter/material.dart';

class BlueLayer extends StatelessWidget {
  const BlueLayer({
    super.key,
    required this.imagePath,
    required this.color,
  });

  final String? imagePath;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    bool isMobile=
        MediaQuery.of(context).size.width < 600; // Check if the screen is mobile
    return Image.asset(
      imagePath!,
      height: isMobile?90:150,
      width: isMobile?60:100,
      fit: BoxFit.contain,
      color: color?.withOpacity(0.8),
    );
  }
}
