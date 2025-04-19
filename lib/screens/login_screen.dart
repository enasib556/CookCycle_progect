import 'package:flutter/material.dart';
import 'package:university_graduate_project/widgets/auths_widgets/custom_button.dart';
import '../utilis/assets.dart';
import '../utilis/color.dart';
import '../widgets/auths_widgets/custom_text_field.dart';
import 'sign_up_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
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
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: 40),
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
                            hint: "enter your email...",
                          ),
                          SizedBox(height: 26),
                          CustomTextField(
                            label: "Password",
                            hint: "enter your password...",
                            isPassword: true,
                          ),
                          SizedBox(height: 30),
                          customButton(text: 'Log in'),
                          SizedBox(height: 20),
                          Text(
                            'Don\'t have an account?',
                            style: TextStyle(color: darkGreen),
                          ),
                          SizedBox(height: 5),
                          InkWell(
                            onTap:
                                () => Navigator.push(
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
            );
          },
        ),
      ),
    );
  }
}
