import 'package:flutter/material.dart';
import 'package:university_graduate_project/utilis/color.dart';

import '../../screens/login_screen.dart';

class SplashElevatedButton extends StatelessWidget {
  const SplashElevatedButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: colorElevatedButton,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  minimumSize: Size(247, 55),
                ),
                child: Text(
                  'Get Started',
                  style: TextStyle(
                    fontFamily: 'SansitaOne',
                    fontSize: 26,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
              );
  }
}