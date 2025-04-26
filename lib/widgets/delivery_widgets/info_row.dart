import 'package:flutter/material.dart';
import '../../utilis/color.dart';

class InfoRow extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const InfoRow({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: AuthColorButton, size: 22),
        const SizedBox(width: 10),
        Expanded(
          child: RichText(
            text: TextSpan(
              text: '$title ',
              style: const TextStyle(
                color: Color(0xff6E7370),
                fontWeight: FontWeight.bold,
                fontSize: 17,
              ),
              children: [
                TextSpan(
                  text: subtitle,
                  style: const TextStyle(
                    fontWeight: FontWeight.normal,
                    color: Color(0xff6E7370),
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
