import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../utilis/color.dart';
import '../widgets/chat_widgets/custom_chat.dart';
import '../widgets/chat_widgets/header_clipper.dart';
import 'home_screen.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  Future<void> _handleImagePick(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null) {
      print("Image picked: ${pickedFile.path}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Column(
        children: [
          Stack(
            children: [
              ClipPath(
                clipper: HeaderClipper(),
                child: Container(
                  height: 140,
                  width: double.infinity,
                  color: primaryColor,
                ),
              ),
              Positioned(
                bottom: 0,
                right: 20,
                left: 0,
                top: 15,
                child: Image.asset('assets/icons/1 (1).png', fit: BoxFit.cover),
              ),
              Positioned(
                top: 50,
                left: 15,
                child: IconButton(
                  icon: Icon(Icons.arrow_back_ios, color: Colors.white, size: 28),
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => HomeScreen()),
                      (route) => false,
                    );
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Expanded(
            child: CustomChat(
              onImageSelected: _handleImagePick,
            ),
          ),
          SizedBox(height: 15,)  
        ],
      ),
    );
  }
}