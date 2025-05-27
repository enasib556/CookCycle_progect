import 'package:flutter/material.dart';
import '../../utilis/color.dart';
import 'custom_row_for_total.dart';

class SubtotalContainer extends StatelessWidget {
  final double subtotal;

  const SubtotalContainer({
    super.key,
    required this.subtotal,
  });

  @override
  Widget build(BuildContext context) {
    const double delivery = 5.0;
    final double total = subtotal + delivery;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        width: double.infinity,
        height: 159,
        decoration: BoxDecoration(
          color: primaryColor.withOpacity(0.24),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              CustomRowForTotal(text: 'Subtotal', price: subtotal),
              const Spacer(),
              const CustomRowForTotal(text: 'Delivery', price: delivery),
              const Spacer(),
              CustomRowForTotal(text: 'Total', price: total),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
