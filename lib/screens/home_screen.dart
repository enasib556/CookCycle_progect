import 'package:flutter/material.dart';

import 'chat_screen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int page = 0;

  List<Widget> pages = [
    Center(
      child: Text('1'),
    ),
    Center(
      child: Text('2'),
    ),
    Center(
      child: Text(''),
    ),
    Center(
      child: Text('4'),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: pages[page],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: page,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 0,
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        selectedIconTheme: IconThemeData(color: Color(0xFFA8BBB3)),
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.w500),
        selectedItemColor: Colors.black,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
              color: Color(0xFFA8BBB3),
              size: 30,
            ),
            label: 'home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite_border_outlined,
              color: Color(0xFFA8BBB3),
              size: 30,
            ),
            label: 'favourite',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.chat,
              color: Color(0xFFA8BBB3),
              size: 30,
            ),
            label: 'chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_cart_outlined,
              color: Color(0xFFA8BBB3),
              size: 30,
            ),
            label: 'cart',
          ),
        ],
        onTap: (index) {
          setState(() {
            page = index;
          });
          // إذا كان الأيقونة الثالثة هي التي تم النقر عليها، يتم التوجه إلى شاشة الشات
          if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ChatScreen()),
            );
          }
        },
      ),
    );
  }
}
