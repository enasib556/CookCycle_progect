import 'package:flutter/material.dart';
import 'package:university_graduate_project/utilis/assets.dart';

class ImageSection extends StatelessWidget {
  const ImageSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        AppImages.delivery, // عدل المسار حسب مكان الصورة
        height: 200,
      ),
    );
  }
}