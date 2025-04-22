import 'package:flutter/material.dart';
import '../../utilis/color.dart';

class DataUser extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;

  const DataUser({super.key, required this.title, required this.value, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Icon(icon, color: AuthColorButton, size: 35),
          SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 19,
                  color: Color(0xff6E7370).withOpacity(0.71),
                ),
              ),
              Text(
                value,
                style: TextStyle(fontFamily: 'SansitaOne', fontSize: 16),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
