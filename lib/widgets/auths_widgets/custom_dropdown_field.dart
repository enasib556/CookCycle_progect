import 'package:flutter/material.dart';

import '../../utilis/color.dart';

class CustomDropdownField extends StatelessWidget {
  final String label;
  final String? selectedValue;
  final List<String> items;
  final void Function(String?) onChanged;

  const CustomDropdownField({
    super.key,
    required this.label,
    required this.selectedValue,
    required this.items,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: darkGreen,
            fontSize: 16,
          ),
        ),
        SizedBox(height: 5),
        DropdownButtonFormField<String>(
          value: selectedValue,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            hintStyle: TextStyle(color: Color(0xff6E7370).withOpacity(0.81)),
            hintText: 'Select an option',
            contentPadding: EdgeInsets.symmetric(
              vertical: 14,
              horizontal: 16,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: BorderSide(color: Color(0xff6E7370)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: BorderSide(
                color: Color(0xffBEC0BF),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: BorderSide(
                color: Color(0xffA8BBB3),
                width: 2,
              ),
            ),
          ),
          icon: Icon(Icons.arrow_drop_down, color: Color(0xffBEC0BF)),
          style: TextStyle(color: Colors.black),
          items: items
              .map((gender) => DropdownMenuItem(
                    value: gender,
                    child: Text(gender),
                  ))
              .toList(),
          onChanged: onChanged,
        ),
      ],
    );
  }
}
