import 'package:flutter/material.dart';

class Searchbar extends StatelessWidget {
  final ValueChanged<String> onChanged;
  const Searchbar({super.key, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: TextField(
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: "Search...",
          hintStyle:
          TextStyle(color: Colors.grey.shade500),
          prefixIcon: Icon(
            Icons.search,
            color: Colors.green.shade900,
          ),
          filled: true,
          fillColor: Color(0xffDDE5E5), // خلفية الحقل
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(27), // زوايا ناعمة للحقل
            borderSide: BorderSide.none, // إزالة الإطار الافتراضي
          ),
          contentPadding:
          EdgeInsets.symmetric(vertical: 14), // تقليل الارتفاع الداخلي
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(27),
            borderSide: BorderSide(
                color: Colors.green.shade900, width: 2), // حدود عند التركيز
          ),
        ),
      ),
    );
  }
}
