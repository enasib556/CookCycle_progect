import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart'; // إضافة الحزمة
import 'package:university_graduate_project/utilis/assets.dart';
import 'package:university_graduate_project/widgets/favourite_widgets/favourite_widget.dart';
import 'package:university_graduate_project/utilis/color.dart';
import 'package:university_graduate_project/widgets/object_detection-widgets/camera_widget/camera_body.dart';
import '../widgets/delivery_widgets/delivery_widget.dart';
import '../widgets/home_widgets/home_body.dart';
import '../widgets/profile_widget/profile_widget.dart';
import 'chat_screen.dart';
import 'login_screen.dart';

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
    CameraBody(),
    FavouriteWidget(),
    Center(
      child: Text(''),
    ),
    DeliveryWidget(),
    ProfileWidget(), // dummy for profile
  ];

  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
  }

  void _checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token'); // استرجاع التوكن من SharedPreferences

    if (token == null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    }
  }

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
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: SvgPicture.asset(
              AppImages.Camera,
              width: 30,
              color: Colors.white,
            ),
          ),
          Icon(Icons.favorite, size: 30, color: Colors.white),
          Icon(Icons.chat, size: 30, color: Colors.white),
          Icon(Icons.shopping_cart, size: 30, color: Colors.white),
          Icon(Icons.person, size: 30, color: Colors.white),
        ],
        color: primaryColor,
        buttonBackgroundColor: primaryColor,
        backgroundColor: Colors.transparent,
        animationCurve: Curves.easeInOutBack,
        animationDuration: const Duration(milliseconds: 600),
        onTap: (index) {
          setState(() {
            page = index;
          });
          if (index == 3) {
            page = 3;
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
