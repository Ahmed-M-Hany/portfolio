

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
      height: 30.sp,
      width: 20.sp,
      fit: BoxFit.contain,
      color: color?.withOpacity(0.8),
    );
  }
}
