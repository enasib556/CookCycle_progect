import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:university_graduate_project/widgets/favourite_widgets/favourite_widget.dart';
import 'package:university_graduate_project/utilis/color.dart';
import '../widgets/cart_widgets/cart_widget.dart';
import '../widgets/delivery_widgets/delivery_widget.dart';
import '../widgets/home_widgets/home_body.dart';
import '../widgets/profile_widget/profile_widget.dart';
import 'chat_screen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
  int page = 0;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  List<Widget> pages = [
    HomeWidget(),
    FavouriteWidget(),
    Center(
      child: Text(''),
    ),
    DeliveryWidget(),
    ProfileWidget(), // dummy for profile
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: beige,
      body: pages[page],
      bottomNavigationBar: CurvedNavigationBar(
      key: _bottomNavigationKey,
      index: 0,
        items: <Widget>[
          Icon(Icons.home, size: 30, color: Colors.white),
          Icon(Icons.favorite, size: 30, color: Colors.white),
          Icon(Icons.chat, size: 30, color: Colors.white),
          Icon(Icons.shopping_cart, size: 30, color: Colors.white),
          Icon(Icons.person, size: 30, color: Colors.white),
        ],
      color: primaryColor,
      buttonBackgroundColor:primaryColor,
      backgroundColor: Colors.transparent,
      animationCurve: Curves.easeInOutBack,
      animationDuration: const Duration(milliseconds: 600),
      onTap: (index) {
        setState(() {
          page = index;
        });
        if (index == 2) {
          page=2;
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ChatScreen()),
          );
        }
      },
      letIndexChange: (index) => true,
    ),
      );
  }
}
