import 'package:flutter/material.dart';

class GradientItem extends StatefulWidget {
  final String name;
  final String quantity;

  const GradientItem({super.key, required this.name, required this.quantity});

  @override
  State<GradientItem> createState() => _GradientItemState();
}

class _GradientItemState extends State<GradientItem> {
  bool isSelected = false;  // Move the state variable outside build method

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              setState(() {
                isSelected = !isSelected;  // Toggle selection state
              });
            },
            child: Icon(
              Icons.check_outlined,
              color: isSelected ? Color(0xFF00643A) : Color(0xFFC6C6C6),
              size: 30,
            ),
          ),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.name,
                style: TextStyle(
                  fontSize: 17,
                  color: Color(0xFF2A2C2C),
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                widget.quantity,
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF5B5D5E).withOpacity(0.6),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

