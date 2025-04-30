import 'package:flutter/material.dart';
import '../../utilis/color.dart';
import 'custom_container.dart';

class QuanitityCounter extends StatefulWidget {
  const QuanitityCounter({super.key});

  @override
  State<QuanitityCounter> createState() => _QuanitityCounterState();
}

class _QuanitityCounterState extends State<QuanitityCounter> {
  int quantity = 00;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Align(
        alignment: Alignment.centerRight,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            CustomContainer(
              width: 67,
              height: 67,
              child: Center(
                child: Text(
                  '$quantity',
                  style: TextStyle(
                    fontFamily: 'SansitaOne',
                    fontSize: 24,
                    color: colorIconCart,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 8,
              right: -10,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    quantity++;
                  });
                },
                child: CustomContainer(
                  width: 24,
                  height: 24,
                  color: primaryColor.withOpacity(0.73),
                  child: Icon(Icons.add, size: 18, color: Colors.white),
                ),
              ),
            ),
            Positioned(
              bottom: 5,
              right: -10,
              child: GestureDetector(
                onTap: () {
                  if (quantity == 0) return;
                  setState(() {
                    quantity--;
                  });
                },
                child: CustomContainer(
                  width: 24,
                  height: 24,
                  color: primaryColor.withOpacity(0.73),
                  child: Icon(
                    Icons.remove,
                    size: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
