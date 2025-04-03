import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:university_graduate_project/screens/auth_screen.dart';

import '../utilis/color.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> animation;
  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );
    animation = Tween(
      begin: Offset(-5, 0),
      end: Offset.zero,
    ).animate(animationController);
    animationController.forward();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColorSplash,
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SlideTransition(
              position: animation,
              child: SvgPicture.asset('assets/icons/fridge_icon.svg'),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 30),
              child: Image.asset('assets/icons/1 (1).png',width: 508,height: 100,fit: BoxFit.cover,),
            ),
            SizedBox(height: 60),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => AuthScreen()));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: colorElevatedButton,
                minimumSize: Size(247, 61),
              ),
              child: Text(
                'Get Started',
                textAlign: TextAlign.center,
                style: GoogleFonts.sansita(
                  fontSize: 28,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      )
    );
  }
}
