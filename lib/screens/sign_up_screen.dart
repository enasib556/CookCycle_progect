import 'package:flutter/material.dart';
import '../utilis/assets.dart';
import '../widgets/auths_widgets/custom_button.dart';
import '../widgets/auths_widgets/custom_dropdown_field.dart';
import '../widgets/auths_widgets/custom_text_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  String? selectedGender;

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
                        children: [
                          SizedBox(height: 10),
                          Image.asset(AppImages.fridge, width: 120.63, height: 100, fit: BoxFit.cover),
                          SizedBox(height: 2),
                          Image.asset(AppImages.cookCycle, width: 508, height: 65, fit: BoxFit.cover),
                          CustomTextField(label: "Full Name", hint: "enter your name..."),
                          SizedBox(height: 5),
                          CustomTextField(label: "Email", hint: "enter your email..."),
                          SizedBox(height: 5),
                          CustomTextField(label: "Phone Number", hint: "enter your phone number..."),
                          SizedBox(height: 5),
                          CustomDropdownField(
                            label: "Gender",
                            selectedValue: selectedGender,
                            items: ["Male", "Female"],
                            onChanged: (value) {
                              setState(() {
                                selectedGender = value;
                              });
                            },
                          ),
                          CustomTextField(label: "Password", hint: "enter your password...", isPassword: true),
                          SizedBox(height: 10),
                          CustomTextField(
                            label: "Confirm Password",
                            hint: "confirm your password...",
                            isPassword: true,
                          ),
                          SizedBox(height: 15),
                          customButton(text: 'Sign up'),
                          SizedBox(height: 20),
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
