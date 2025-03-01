import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:record/record.dart';
import 'package:audioplayers/audioplayers.dart'; // استيراد حزمة التشغيل الصوتي
import 'package:university_graduate_project/widgets/chat_widgets/send_container.dart';
import 'massege_container.dart';

class CustomChat extends StatefulWidget {
  const CustomChat({super.key, required Future<void> Function(ImageSource source) onImageSelected});

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
    // message bot in start
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        messages.add({
          "text": "مرحبًا! كيف يمكنني مساعدتك اليوم؟ 😊",
          "isSender": false,
          "type": "text",
          "time": DateTime.now().toString(), // إضافة الوقت
        });
      });
    });
  }

  void _showOption() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('اختر مصدر الصورة'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.image),
              title: const Text('المعرض'),
              onTap: () {
                Navigator.pop(context);
                pickImage(ImageSource.gallery);
              },
            ),
            ListTile(
              leading: const Icon(Icons.camera),
              title: const Text('الكاميرا'),
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
      setState(() {
        messages.insert(0, {
          "text": messageController.text,
          "isSender": true,
          "type": "text",
          "time": DateTime.now().toString(), // إضافة الوقت
        });
        messageController.clear();
      });
      // اضافة رسالة البوت
      Future.delayed(const Duration(seconds: 1), () {
        setState(() {
          messages.insert(0, {
            "text": "لقد تلقيت رسالتك! كيف يمكنني مساعدتك؟ 🤖",
            "isSender": false,
            "type": "text",
            "time": DateTime.now().toString(), // إضافة الوقت
          });
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
          "time": DateTime.now().toString(), // إضافة الوقت
        });
      });
      // اضافة رسالة البوت
      Future.delayed(const Duration(seconds: 1), () {
        setState(() {
          messages.insert(0, {
            "text": "لقد استلمت صورتك! 📷 شكرًا لإرسالها.",
            "isSender": false,
            "type": "text",
            "time": DateTime.now().toString(), // إضافة الوقت
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
            "time": DateTime.now().toString(), // إضافة الوقت
          });
        });
        // اضافة رسالة البوت
        Future.delayed(const Duration(seconds: 1), () {
          setState(() {
            messages.insert(0, {
              "text": "لقد استلمت تسجيلك الصوتي! 🎤 شكرًا لإرساله.",
              "isSender": false,
              "type": "text",
              "time": DateTime.now().toString(), // إضافة الوقت
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
                  time: message["time"], // تمرير الوقت
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