import 'package:flutter/material.dart';
import '../../utilis/color.dart';
import 'custom_container.dart';

class QuanitityCounter extends StatefulWidget {
  final int quantity;
  final Function(int) onQuantityChanged;

  const QuanitityCounter({
    super.key,
    required this.quantity,
    required this.onQuantityChanged,
  });

  @override
  State<QuanitityCounter> createState() => _QuanitityCounterState();
}

class _QuanitityCounterState extends State<QuanitityCounter> {
  late int quantity;

  @override
  void initState() {
    super.initState();
    quantity = widget.quantity;
  }

  void _increment() {
    setState(() {
      quantity++;
    });
    widget.onQuantityChanged(quantity);
  }

  void _decrement() {
    if (quantity > 1) {
      setState(() {
        quantity--;
      });
      widget.onQuantityChanged(quantity);
    }
  }

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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '$quantity',
                    style: TextStyle(
                      fontFamily: 'SansitaOne',
                      fontSize: 24,
                      color: colorIconCart,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                ],
              ),
            ),
            Positioned(
              top: 8,
              right: -10,
              child: GestureDetector(
                onTap: _increment,
                child: CustomContainer(
                  width: 24,
                  height: 24,
                  color: primaryColor.withOpacity(0.73),
                  child: const Icon(Icons.add, size: 18, color: Colors.white),
                ),
              ),
            ),
            Positioned(
              bottom: 5,
              right: -10,
              child: GestureDetector(
                onTap: _decrement,
                child: CustomContainer(
                  width: 24,
                  height: 24,
                  color: primaryColor.withOpacity(0.73),
                  child: const Icon(Icons.remove, size: 18, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
