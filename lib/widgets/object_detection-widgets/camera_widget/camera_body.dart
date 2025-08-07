import 'package:flutter/material.dart';
import 'package:university_graduate_project/widgets/general_widgets/custom_appbar_for_objectDe.dart';
import 'package:university_graduate_project/widgets/object_detection-widgets/camera_widget/custom_text.dart';
import 'package:university_graduate_project/widgets/object_detection-widgets/camera_widget/camera_buttons.dart';
import '../../../screens/home_screen.dart';
import '../../../utilis/color.dart';
import 'fridge_animation.dart';

class CameraBody extends StatefulWidget {
  const CameraBody({super.key});

  @override
  State<CameraBody> createState() => _CameraBodyState();
}

class _CameraBodyState extends State<CameraBody> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 50),
          CustomAppbarForObjectde(
            onPressed: () {
              Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (context) => HomeScreen()), (route) => false);
            },
            trailingWidget: Transform.scale(
              scale: 0.9,
              child: Switch(
                value: isSwitched,
                activeTrackColor: colorTextHome,
                activeColor: Colors.white,
                inactiveThumbColor: Colors.white,
                inactiveTrackColor: Colors.grey[350],
                onChanged: (value) {
                  setState(() {
                    isSwitched = value;
                  });
                },
              ),
            ),
          ),
          const SizedBox(height: 40),
          const CustomText(),
          const SizedBox(height: 50),
          FridgeAnimation(),
          const SizedBox(height: 30),
          CameraButtons()
        ],
      ),
    );
  }
}

