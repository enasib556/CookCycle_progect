import 'package:flutter/material.dart';

class HeaderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 30); // يبدأ الخط من الأسفل على اليسار
    path.quadraticBezierTo(size.width * 0.25, size.height - 90, size.width * 0.5, size.height - 40); // موجة منخفضة في المنتصف
    path.quadraticBezierTo(size.width * 0.85, size.height+32, size.width, size.height -20); // موجة مرتفعة على اليمين
    path.lineTo(size.width, 0); // إغلاق المسار مع الحواف العلوية
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}