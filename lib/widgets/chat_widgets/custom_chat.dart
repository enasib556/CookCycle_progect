import 'dart:io';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:record/record.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:http/http.dart' as http;

import 'package:university_graduate_project/widgets/chat_widgets/send_container.dart';
import 'massege_container.dart';

class CustomChat extends StatefulWidget {
  const CustomChat({
    super.key,
    required Future<void> Function(ImageSource source) onImageSelected,
  });

  @override
  State<CustomChat> createState() => _CustomChatState();
}

class _CustomChatState extends State<CustomChat> {
  TextEditingController messageController = TextEditingController();
  List<Map<String, dynamic>> messages = [];
  final Record _record = Record();
  bool _isRecording = false;
  final AudioPlayer _audioPlayer = AudioPlayer();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        messages.add({
          "text": " Hello ! How can I help you? 😊",
          "isSender": false,
          "type": "text",
          "time": DateTime.now().toString(),
        });
      });
    });
  }

  void _showOption() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text(
          'choose image source',
          style: TextStyle(
            fontFamily: 'SansitaOne',
            color: Color(0xFF00643A),
            fontSize: 20,
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.image, color: Color(0xFF00643A)),
              title: const Text('gallery', style: TextStyle(
                fontFamily: 'SansitaOne',
                color: Color(0xFF00643A),
                fontSize: 15
              )),
              onTap: () {
                Navigator.pop(context);
                pickImage(ImageSource.gallery);
              },
            ),
            ListTile(
              leading: const Icon(Icons.camera, color: Color(0xFF00643A)),
              title: const Text('camera', style: TextStyle(
                fontFamily: 'SansitaOne',
                color: Color(0xFF00643A),
                fontSize: 15,
              )),
              onTap: () {
                Navigator.pop(context);
                pickImage(ImageSource.camera);
              },
            ),
          ],
        ),
      ),
    );
  }

  void sendMessage() {
    if (messageController.text.isNotEmpty) {
      final text = messageController.text;
      messageController.clear();
      _sendMessage(text);
    }
  }

  Future<void> _sendMessage(String userMessage) async {
    setState(() {
      messages.insert(0, {
        "text": userMessage,
        "isSender": true,
        "type": "text",
        "time": DateTime.now().toString(),
      });
    });

    try {
      final response = await http.post(
        Uri.parse("http://192.168.1.6:8000/chat/"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"user_input": userMessage}),
      );

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        setState((
          
        ) {
          messages.insert(0, {
            "text": responseData["response"],
            "isSender": false,
            "type": "text",
            "time": DateTime.now().toString(),
          });
        });
      } else {
        setState(() {
          messages.insert(0, {
            "text": "Error: Failed to fetch response",
            "isSender": false,
            "type": "text",
            "time": DateTime.now().toString(),
          });
        });
      }
    } catch (e) {
      setState(() {
        messages.insert(0, {
          "text": "Error: $e",
          "isSender": false,
          "type": "text",
          "time": DateTime.now().toString(),
        });
      });
    }
  }

  Future<void> pickImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        messages.insert(0, {
          "image": File(pickedFile.path),
          "isSender": true,
          "type": "image",
          "time": DateTime.now().toString(),
        });
      });

      Future.delayed(const Duration(seconds: 1), () {
        setState(() {
          messages.insert(0, {
            "text": "I received your image! 📷 thank you for sending it.",
            "isSender": false,
            "type": "text",
            "time": DateTime.now().toString(),
          });
        });
      });
    }
  }

  void _toggleRecording() async {
    if (_isRecording) {
      final path = await _record.stop();
      setState(() {
        _isRecording = false;
      });

      if (path != null) {
        setState(() {
          messages.insert(0, {
            "audio": File(path),
            "isSender": true,
            "type": "audio",
            "time": DateTime.now().toString(),
          });
        });

        Future.delayed(const Duration(seconds: 1), () {
          setState(() {
            messages.insert(0, {
              "text": "I received your audio! 🎤 thank you for sending it.",
              "isSender": false,
              "type": "text",
              "time": DateTime.now().toString(),
            });
          });
        });
      }
    } else {
      await _record.start();
      setState(() {
        _isRecording = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            reverse: true,
            itemCount: messages.length,
            itemBuilder: (context, index) {
              final message = messages[index];
              return Align(
                alignment: message["isSender"]
                    ? Alignment.centerRight
                    : Alignment.centerLeft,
                child: MessageContainer(
                  message: message["text"] ?? "",
                  image: message["image"],
                  audio: message["audio"],
                  isSender: message["isSender"],
                  type: message["type"],
                  time: message["time"],
                ),
              );
            },
          ),
        ),
        SendContainer(
          messageController: messageController,
          sendMessage: sendMessage,
          toggleRecording: _toggleRecording,
          isRecording: _isRecording,
          showOption: _showOption,
        ),
      ],
    );
  }
}
