import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:university_graduate_project/manager/auth_cubit/login_cubit.dart';
import 'package:university_graduate_project/manager/auth_cubit/login_state.dart';
import 'package:university_graduate_project/screens/home_screen.dart';
import 'package:university_graduate_project/utilis/color.dart';
import 'package:shared_preferences/shared_preferences.dart'; // إضافة الحزمة
import '../models/authModels/auth_model.dart';
import '../utilis/assets.dart';
import '../widgets/auths_widgets/custom_button.dart';
import '../widgets/auths_widgets/custom_text_field.dart';
import 'sign_up_screen.dart';
 // استيراد الـ AuthResponse

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) async {
        if (state is LoginSuccessState) {
          // استجابة الـ Login
          AuthResponse authResponse = state.authResponse; // الحصول على استجابة التوثيق
          if (authResponse.success) {
            // حفظ التوكن في SharedPreferences
            SharedPreferences prefs = await SharedPreferences.getInstance();
            prefs.setString('token', authResponse.token ?? ''); // تخزين التوكن

            // الانتقال إلى الشاشة الرئيسية
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            );
          } else {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                content: Text(
                  authResponse.message,
                  style: const TextStyle(color: Colors.white),
                ),
                backgroundColor: lightOrange,
              ),
            );
          }
        } else if (state is LoginFailedState) {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              content: Text(
                state.errorMessage,
                style: const TextStyle(color: Colors.white),
              ),
              backgroundColor: lightOrange,
            ),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          resizeToAvoidBottomInset: true,
          body: SafeArea(
            child: LayoutBuilder(
              builder: (context, constraints) {
                return Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(AppImages.splash_background),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(minHeight: constraints.maxHeight),
                      child: IntrinsicHeight(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: Form(
                            key: formKey,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const SizedBox(height: 40),
                                Image.asset(
                                  AppImages.fridge,
                                  width: 186.05,
                                  height: 161,
                                  fit: BoxFit.cover,
                                ),
                                const SizedBox(height: 20),
                                Image.asset(
                                  AppImages.camCook,
                                  width: 200,
                                  fit: BoxFit.fill,
                                ),
                                const SizedBox(height: 8),
                                CustomTextField(
                                  label: "Email",
                                  hint: "Enter your email...",
                                  controller: emailController,
                                  validator: (value) {
                                    if (value?.isEmpty ?? true) {
                                      return "Email is required";
                                    }
                                    return null;
                                  },
                                ),
                                SizedBox(height: 26),
                                CustomTextField(
                                  label: "Password",
                                  hint: "Enter your password...",
                                  isPassword: true,
                                  controller: passwordController,
                                  validator: (value) {
                                    if (value?.isEmpty ?? true) {
                                      return "Password is required";
                                    }
                                    return null;
                                  },
                                ),
                                SizedBox(height: 30),
                                CustomButton(
                                  text: 'Log in',
                                  onTap: () {
                                    if (formKey.currentState!.validate()) {
                                      BlocProvider.of<LoginCubit>(context).login(
                                        email: emailController.text.trim(),
                                        password: passwordController.text.trim(),
                                      );
                                    }
                                  },
                                ),
                                SizedBox(height: 20),
                                Text(
                                  'Don\'t have an account?',
                                  style: TextStyle(color: darkGreen),
                                ),
                                SizedBox(height: 5),
                                InkWell(
                                  onTap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => SignUpScreen(),
                                    ),
                                  ),
                                  child: Text(
                                    'Sign up',
                                    style: TextStyle(
                                      color: darkGreen,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
