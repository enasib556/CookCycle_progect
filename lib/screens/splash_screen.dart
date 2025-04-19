import 'package:flutter/material.dart';
import 'package:university_graduate_project/utilis/assets.dart';
import 'package:university_graduate_project/widgets/splash_widget/desciption_text.dart';
import 'package:university_graduate_project/widgets/splash_widget/splash_elevated_button.dart';
import '../utilis/color.dart';
import '../widgets/splash_widget/animation_icon.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppImages.splash_background), 
            fit: BoxFit.cover,
          ),
        ),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 40,),
              Image.asset(AppImages.cookCycle,width: 508,height: 80,fit: BoxFit.cover,),
              DesciptionText(),
              SizedBox(height: 25,),
              Container(
                width: 107,
                height: 8,
                decoration: BoxDecoration(
                  color: lightOrange,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              SizedBox(height: 40,),
              AnimationIcon(),
              SizedBox(height: 60),
              SplashElevatedButton(),
            ],
          ),
        ),
      )
    );
  }
}
