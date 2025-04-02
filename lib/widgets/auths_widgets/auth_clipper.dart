import 'package:flutter/material.dart';

class AuthClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height * 0.4); // رفع مستوى القص ليبدأ من الفورم
    path.quadraticBezierTo(
        size.width / 2, size.height * 0.8, size.width, size.height * 0.6);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}