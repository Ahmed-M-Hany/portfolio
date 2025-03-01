

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
    return Image.asset(
      imagePath!,
      height: 30,
      width: 20,
      fit: BoxFit.contain,
      color: color?.withOpacity(0.8),
    );
  }
}
