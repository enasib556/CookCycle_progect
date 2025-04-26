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
            SizedBox(height: 20),
            TitleSection(),
            SizedBox(height: 24),
            InfoRow(
              icon: Icons.access_time,
              title: 'Delivery Time:',
              subtitle: '30–60 minutes.',
            ),
            SizedBox(height: 25),
            InfoRow(
              icon: Icons.location_on_outlined,
              title: 'Available in:',
              subtitle: 'Ismailia.',
            ),
            SizedBox(height: 25),
            InfoRow(
              icon: Icons.payment,
              title: 'Payment Options:',
              subtitle: 'Cash on delivery or secure online payment.',
            ),
            SizedBox(height: 25),
            InfoRow(
              icon: Icons.calendar_today,
              title: 'Available Daily:',
              subtitle: '9:00 AM – 11:00 PM',
            ),
            SizedBox(height: 20),
            Expanded(child: ImageSection()),
            SizedBox(height: 30),
            SizedBox(
              width: 282,
              height: 60,
              child: CustomElevatedButton(
                text: 'Start Ordering',
                onPress: onOrderPressed,
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
