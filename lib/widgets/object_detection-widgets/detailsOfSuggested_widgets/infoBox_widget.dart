import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utilis/color.dart';

class InfoBoxWidget extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const InfoBoxWidget({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      height: 135,
      padding: const EdgeInsets.only(top: 30),
      decoration: BoxDecoration(
        color: infoBoxColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Icon(icon, color: Colors.orange),
          const SizedBox(height: 8),
          Text(label, style:  GoogleFonts.roboto(fontWeight: FontWeight.bold, fontSize: 12)),
          const SizedBox(height: 4),
          Text(value, style:  GoogleFonts.roboto(fontSize: 12)),
        ],
      ),
    );
  }
}
