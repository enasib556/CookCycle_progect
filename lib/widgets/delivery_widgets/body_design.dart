import 'package:flutter/material.dart';
import '../details_widget/custom_elevaterd_button.dart';

import 'image.dart';
import 'info_row.dart';
import 'title_section.dart';

class BodyDesign extends StatelessWidget {
  final VoidCallback onOrderPressed;
  const BodyDesign({super.key, required this.onOrderPressed});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            const TitleSection(),
            const SizedBox(height: 24),
            const InfoRow(
              icon: Icons.access_time,
              title: 'Delivery Time:',
              subtitle: '30–60 minutes.',
            ),
            const SizedBox(height: 25),
            const InfoRow(
              icon: Icons.location_on_outlined,
              title: 'Available in:',
              subtitle: 'Ismailia.',
            ),
            const SizedBox(height: 25),
            const InfoRow(
              icon: Icons.payment,
              title: 'Payment Options:',
              subtitle: 'Cash on delivery or secure online payment.',
            ),
            const SizedBox(height: 25),
            const InfoRow(
              icon: Icons.calendar_today,
              title: 'Available Daily:',
              subtitle: '9:00 AM – 11:00 PM',
            ),
            const SizedBox(height: 20),
            const Expanded(child: ImageSection()),
            const SizedBox(height: 30),
            SizedBox(
              width: 282,
              height: 60,
              child: CustomElevatedButton(
                text: 'Start Ordering',
                onPress: onOrderPressed,
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
