import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utilis/color.dart';
import 'custom_row_for_total.dart';

class SubtotalContainer extends StatelessWidget {
  const SubtotalContainer({super.key});

  @override
  Widget build(BuildContext context) {
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
              CustomRowForTotal(text: 'Subtotal',price: 20,),
              const Spacer(),
              CustomRowForTotal(text: 'Delivery',price: 5,),
              const Spacer(),
              CustomRowForTotal(text: 'Total',price: 25,),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
