import 'package:flutter/material.dart';
import 'package:university_graduate_project/screens/auth_screen.dart';
import 'package:university_graduate_project/screens/home_screen.dart';
import 'package:university_graduate_project/screens/splash_screen.dart';
import 'package:university_graduate_project/utilis/color.dart';
void main()
{
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: backgroundColor
      ),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
