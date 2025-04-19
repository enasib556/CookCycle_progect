import 'package:flutter/material.dart';
import '../../utilis/color.dart';

class CustomElevaterdButton extends StatelessWidget {
  final String text;
  final Widget? icon;
  final VoidCallback? onPress;

  const CustomElevaterdButton({
    super.key,
    required this.text,
    this.icon,
    this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPress, // ✅ هنا المشكلة كانت
      style: ElevatedButton.styleFrom(
        backgroundColor: AuthColorButton,
        minimumSize: const Size(317, 66),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (icon != null) icon!,
          const SizedBox(width: 15),
          Text(
            text,
            style: const TextStyle(
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
