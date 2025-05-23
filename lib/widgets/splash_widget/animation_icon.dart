import 'package:flutter/material.dart';
import '../../utilis/assets.dart';


class AnimationIcon extends StatefulWidget {
  const AnimationIcon({super.key});

  @override
  State<AnimationIcon> createState() => _AnimationIconState();
}

class _AnimationIconState extends State<AnimationIcon>
    with TickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> animation;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 4),
    );

    animation = Tween<Offset>(
      begin: Offset(-5, 0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.easeOut,
    ));

    animationController.forward();
  }

  @override
  void dispose() {
    animationController.stop();
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: animation,
      child: Image.asset(
        AppImages.fridge,
        width: 300,
        height: 260,
        fit: BoxFit.cover,
      ),
    );
  }
}
