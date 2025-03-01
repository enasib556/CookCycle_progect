import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../widgets/container_text.dart';
import 'home_screen.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  File? _selectedImage;

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                ClipPath(
                  clipper: HeaderClipper(),
                  child: Container(
                    height: 140,
                    width: double.infinity,
                    color: const Color(0xFFA8BBB3),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 20,
                  left: 0,
                  top: 15,
                  child: Image.asset('assets/icons/1 (1).png', fit: BoxFit.cover),
                ),
                // Adding the back button icon in the top left corner
                Positioned(
                  top: 50, // Adjust the top position as per your requirement
                  left: 10, // Adjust the left position as per your requirement
                  child: IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen()), // استبدل YourFirstScreen باسم الشاشة الأولى
                            (route) => false, // إزالة كل الشاشات السابقة
                      );
                    },
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 620,
              child: ContainerText(onImageSelected: _pickImage),
            ),
            if (_selectedImage != null)
              Padding(
                padding: const EdgeInsets.all(10),
                child: Image.file(_selectedImage!, height: 200),
              ),
          ],
        ),
      ),
    );
  }
}

class HeaderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 50);
    path.quadraticBezierTo(
      size.width / 2,
      size.height * 1.2,
      size.width,
      size.height - 30,
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
