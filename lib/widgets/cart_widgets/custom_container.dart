import 'package:flutter/material.dart';

import '../../utilis/color.dart';

class CustomContainer extends StatelessWidget {
  final double width;
  final double height;
  final Widget child;
  final Color? color;
  const CustomContainer({super.key, required this.width, required this.height, required this.child,  this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color==null?colorCard:color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: child,
    );
  }
}
