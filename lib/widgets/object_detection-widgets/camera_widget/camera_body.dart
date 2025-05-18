import 'package:flutter/material.dart';
import 'package:university_graduate_project/widgets/general_widgets/custom_appbar_for_objectDe.dart';
import 'package:university_graduate_project/widgets/object_detection-widgets/camera_widget/custom_text.dart';
import 'package:university_graduate_project/widgets/object_detection-widgets/camera_widget/camera_buttons.dart';
import '../../../screens/home_screen.dart';
import 'fridge_animation.dart';

class CameraBody extends StatelessWidget {
  const CameraBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 50),
          CustomAppbarForObjectde(onPressed: (){
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => HomeScreen(),
                ), // استبدل YourFirstScreen باسم الشاشة الأولى
                    (route) => false, // إزالة كل الشاشات السابقة
            );
          },),
          const SizedBox(height: 40),
          const CustomText(),
          const SizedBox(height: 60),
          FridgeAnimation(),
          const SizedBox(height: 30),
          CameraButtons()
        ],
      ),
    );
  }
}
