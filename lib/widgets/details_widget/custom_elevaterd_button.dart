import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utilis/color.dart';

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final Widget? icon;
  final VoidCallback? onPress;
  final Color? color;

  const CustomElevatedButton({
    super.key,
    required this.text,
    this.icon,
    this.onPress, this.color,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPress, // هذا الزر الآن يستدعي onPress عند الضغط
      style: ElevatedButton.styleFrom(
        backgroundColor: color ?? AuthColorButton,
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
            style:  GoogleFonts.roboto(
              fontWeight: FontWeight.w500,
              fontSize: 25,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
