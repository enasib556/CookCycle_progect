import 'package:flutter/material.dart';
import 'package:university_graduate_project/widgets/favourite_widgets/favourite_widget.dart';
import 'package:university_graduate_project/utilis/color.dart';
import '../widgets/cart_widgets/cart_widget.dart';
import '../widgets/home_widgets/home_body.dart';
import 'chat_screen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
  int page = 0;

  List<Widget> pages = [
    HomeWidget(),
    FavouriteWidget(),
    Center(
      child: Text(''),
    ),
    CartWidget(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: pages[page],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: page,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 0,
        backgroundColor: backgroundColor,
        type: BottomNavigationBarType.fixed,
        selectedIconTheme: IconThemeData(color: primaryColor),
        unselectedIconTheme: IconThemeData(color:primaryColor),
        selectedItemColor: primaryColor,
        unselectedItemColor: primaryColor,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined, size: 30),
            activeIcon: Icon(Icons.home, size: 30),
            label: 'home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border_outlined, size: 30),
            activeIcon: Icon(Icons.favorite, size: 30),
            label: 'favourite',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_outlined, size: 30),
            activeIcon: Icon(Icons.chat, size: 30),
            label: 'chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined, size: 30),
            activeIcon: Icon(Icons.shopping_cart, size: 30),
            label: 'cart',
          ),
        ],
        onTap: (index) {
          setState(() {
            page = index;
          });
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
