import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:university_graduate_project/utilis/assets.dart';

class FridgeAnimation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(AppImages.fridge3,width: 190,
        fit: BoxFit.fill,)
          .animate()
          .moveY(begin: 0, end: -30, duration: 400.ms)
          .then()
          .moveY(begin: -30, end: 0, duration: 400.ms)
          .then(delay: 200.ms)
          .moveY(begin: 0, end: -10, duration: 300.ms)
          .then()
          .moveY(begin: -10, end: 0, duration: 300.ms)
          .then()
          .shimmer(duration: 800.ms), // تأثير وميض
    );
  }
}
