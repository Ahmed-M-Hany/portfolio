import 'package:flutter/material.dart';
import 'package:portfolio/pages/home_page.dart';

void main() async{
  runApp(const MyApp());
}
final
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ahmed Hany Flutter Portfolio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const HomePage(),
    );
  }
}


