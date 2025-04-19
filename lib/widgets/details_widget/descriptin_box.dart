import 'package:flutter/material.dart';

import '../../data.dart';
import '../../utilis/color.dart';

class DescriptinBox extends StatelessWidget {
  const DescriptinBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 30),
        Container(
          width: 317,
          height: 62,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: primaryColor)),
          child: Center(
            child: Text(
              recipes[0].description!,
              style: TextStyle(
                fontSize: 22,
                color: Color(0xFF6E7370).withOpacity(0.7),
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
        SizedBox(height: 40),
      ],
    );
  }
}

