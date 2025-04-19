import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../screens/home_screen.dart';
import '../../utilis/color.dart';

class CustomAppbar extends StatelessWidget {
  final String title;
  final bool needDeleteButton;
  final bool? needSearchButton;
  const CustomAppbar({
    super.key,
    required this.title,
    required this.needDeleteButton,  this.needSearchButton,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back_ios, color: newColor),
                    onPressed:
                        () => Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomeScreen(),
                          ), // استبدل YourFirstScreen باسم الشاشة الأولى
                          (route) => false, // إزالة كل الشاشات السابقة
                        ),
                  ),
                  Text(
                    title,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontFamily: 'SansitaOne',
                      color: AuthColorButton,
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  needSearchButton == false
                      ? Container():
                  Padding(
                    padding: EdgeInsets.only(right: 15),
                    child: CircleAvatar(
                      backgroundColor: secondaryColor,
                      radius: 20,
                      child: Icon(Icons.search, color: colorTextHome),
                    ),
                  ),
                  needDeleteButton == false
                      ? Container()
                      : Padding(
                        padding: EdgeInsets.only(right: 15),
                        child: CircleAvatar(
                          backgroundColor: secondaryColor,
                          radius: 20,
                          child: Icon(Icons.delete, color: colorTextHome),
                        ),
                      ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 10,),
        const Divider(
          color: Color(0xffA8BBB3),
          thickness: 1,
          // endIndent: 30,
          // indent: 30,
          height: 1,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width,
        )
      ],
    );
  }
}

