import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../utilis/color.dart';
import '../widgets/chat_widgets/custom_chat.dart';
import '../widgets/chat_widgets/header_clipper.dart';
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
      backgroundColor: backgroundColor,
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
                    color:  primaryColor,
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
                  child: CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.white,
                    child: IconButton(
                      icon: Icon(Icons.arrow_back, color: primaryColor),
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => HomeScreen()),
                              (route) => false, // إزالة كل الشاشات السابقة
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 630,
              child: CustomChat(onImageSelected: _pickImage),
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

