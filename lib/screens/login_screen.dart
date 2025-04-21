import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:university_graduate_project/manager/auth_cubit/login_cubit.dart';
import 'package:university_graduate_project/manager/auth_cubit/login_state.dart';
import 'package:university_graduate_project/screens/home_screen.dart';
import 'package:university_graduate_project/utilis/color.dart';
import 'package:shared_preferences/shared_preferences.dart'; // إضافة الحزمة
import '../utilis/assets.dart';
import '../widgets/auths_widgets/custom_button.dart';
import '../widgets/auths_widgets/custom_text_field.dart';
import 'sign_up_screen.dart';

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
          // حفظ التوكن في SharedPreferences
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setString('token', state.token); // تخزين التوكن

          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => HomeScreen()),
          );
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
                                Image.asset(
                                  AppImages.cookCycle,
                                  width: 508,
                                  height: 80,
                                  fit: BoxFit.cover,
                                ),
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
