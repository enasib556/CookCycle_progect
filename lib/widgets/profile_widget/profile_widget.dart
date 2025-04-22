import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:university_graduate_project/screens/login_screen.dart';
import 'package:university_graduate_project/utilis/assets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../screens/sign_up_screen.dart';
import '../../utilis/color.dart';
import '../general_widgets/custom_appbar.dart';
import 'data_user.dart';
 // تأكد من استيراد صفحة التسجيل هنا

class ProfileWidget extends StatefulWidget {
  const ProfileWidget({super.key});

  @override
  State<ProfileWidget> createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  File? _image; // الصورة التي سيتم اختيارها
  String userName = '';
  String email = '';
  String gender = '';
  String phone = '';

  // دالة لاختيار الصورة من الكاميرا أو المعرض
  Future<void> _pickImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  // دالة لجلب البيانات من SharedPreferences
  Future<void> _loadUserData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      userName = prefs.getString('username') ?? 'N/A';
      email = prefs.getString('email') ?? 'N/A';
      gender = prefs.getString('gender') ?? 'N/A';
      phone = prefs.getString('phone') ?? 'N/A';
    });
  }

  // دالة لتسجيل الخروج
  Future<void> _logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('token'); // مسح التوكن من SharedPreferences
    await prefs.clear(); // مسح باقي البيانات المخزنة إذا أردت ذلك
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()), // التوجيه مباشرة إلى صفحة التسجيل
    );
  }

  @override
  void initState() {
    super.initState();
    _loadUserData(); // تحميل البيانات عند بداية تشغيل الصفحة
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          CustomAppbar(title: 'Profile', needDeleteButton: false, needSearchButton: false),
          SizedBox(height: 30),
          Stack(
            clipBehavior: Clip.none,
            children: [
              CircleAvatar(
                radius: 80,
                backgroundImage: _image == null
                    ? AssetImage(AppImages.profile) // الصورة الافتراضية لو مفيش صورة مختارة
                    : FileImage(_image!) as ImageProvider,
              ),
              Positioned(
                bottom: 0,
                right: 10,
                child: GestureDetector(
                  onTap: () {
                    // فتح خيارات الكاميرا أو المعرض عند الضغط على الصورة
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Choose Image Source'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                _pickImage(ImageSource.camera);
                                Navigator.pop(context);
                              },
                              child: Text('Camera'),
                            ),
                            TextButton(
                              onPressed: () {
                                _pickImage(ImageSource.gallery);
                                Navigator.pop(context);
                              },
                              child: Text('Gallery'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: CircleAvatar(
                    radius: 21,
                    backgroundColor: AuthColorButton,
                    child: Icon(Icons.camera_alt, color: Colors.white, size: 22),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 35),
          DataUser(icon: Icons.person, title: 'Name', value: userName),
          SizedBox(height: 25),
          DataUser(icon: Icons.email, title: 'Email', value: email),
          SizedBox(height: 25),
          DataUser(icon: Icons.male, title: 'Gender', value: gender),
          SizedBox(height: 25),
          DataUser(icon: Icons.phone, title: 'Phone Number', value: phone),
          SizedBox(height: 25),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: GestureDetector(
              onTap: _logout,
              child: Row(
                children: [
                  Icon(Icons.logout, color: AuthColorButton, size: 35),
                  const SizedBox(width: 15),
                  Text('Logout', style: TextStyle(fontFamily: 'SansitaOne', fontSize: 18)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
