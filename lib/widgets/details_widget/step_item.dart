import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../data.dart';

class StepItem extends StatelessWidget {
  final int index;

  const StepItem({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    bool isOdd = index.isOdd; // لو فردي يكون true

    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Container(
        color: Color(0xFFA8BBB3).withOpacity(0.15),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            textDirection: isOdd ? TextDirection.rtl : TextDirection.ltr, // تبديل الاتجاه
            children: [
              Image.asset(
                recipes[0].steps[index].image,
                width: 130,
                height: 130,
              ),
              const SizedBox(width: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset('assets/icons/chef.svg'),
                      const SizedBox(width: 10),
                      Text(
                        'Step ${recipes[0].steps[index].stepNumber}/5',
                        style: TextStyle(
                          fontFamily: 'SansitaOne',
                          fontSize: 17,
                          color: Color(0xFFA8BBB3),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: 155,
                    child: Text(
                      recipes[0].steps[index].description,
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.black.withOpacity(0.5),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}