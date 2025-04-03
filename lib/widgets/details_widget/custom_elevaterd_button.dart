import 'package:flutter/material.dart';

import '../../utilis/color.dart';

class CustomElevaterdButton extends StatelessWidget {
  final String text;
  final Widget? icon;
  final VoidCallback? onPress;
  const CustomElevaterdButton({super.key, required this.text, this.icon, this.onPress});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryColor,
        minimumSize: Size(317, 66),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
         icon != null ? icon! : Container(),
          const SizedBox(width: 15),
          Text(
            text,
            style: TextStyle(
              fontFamily: 'SansitaOne',
              fontSize: 20,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

