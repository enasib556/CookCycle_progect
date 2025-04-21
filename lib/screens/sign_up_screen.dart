import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:university_graduate_project/manager/auth_cubit/register_cubit.dart';
import 'package:university_graduate_project/screens/home_screen.dart';
import 'package:university_graduate_project/utilis/color.dart';
import '../manager/auth_cubit/register_state.dart';
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

  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPassController = TextEditingController();
  final phoneController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterStates>(
      listener: (context, state) {
        if (state is RegisterSuccessState) {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => HomeScreen()));
        } else if (state is FailedToRegisterState) {
          showDialog(
              context: context,
              builder: (context) => AlertDialog(
                content: Text(
                  state.errorMessage,
                  style: const TextStyle(color: Colors.white),
                ),
                backgroundColor: lightOrange,
              ));
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
                      constraints:
                      BoxConstraints(minHeight: constraints.maxHeight),
                      child: IntrinsicHeight(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: Form(
                            key: formKey,
                            child: Column(
                              children: [
                                const SizedBox(height: 10),
                                Image.asset(
                                  AppImages.fridge,
                                  width: 120.63,
                                  height: 100,
                                  fit: BoxFit.cover,
                                ),
                                const SizedBox(height: 2),
                                Image.asset(
                                  AppImages.cookCycle,
                                  width: 508,
                                  height: 65,
                                  fit: BoxFit.cover,
                                ),
                                CustomTextField(
                                  label: "Full Name",
                                  hint: "Enter your name...",
                                  controller: fullNameController,
                                  validator: (value) {
                                    if (value?.isEmpty ?? true) {
                                      return "Full Name is required";
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(height: 5),
                                CustomTextField(
                                  label: "Email",
                                  hint: "Enter your email...",
                                  controller: emailController,
                                  validator: (value) {
                                    if (value?.isEmpty ?? true) {
                                      return "Email is required";
                                    }
                                    // يمكن إضافة تحقق من صحة البريد الإلكتروني هنا
                                    return null;
                                  },
                                ),
                                const SizedBox(height: 5),
                                CustomTextField(
                                  label: "Phone Number",
                                  hint: "Enter your phone number...",
                                  controller: phoneController,
                                  validator: (value) {
                                    if (value?.isEmpty ?? true) {
                                      return "Phone Number is required";
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(height: 5),
                                CustomDropdownField(
                                  label: "Gender",
                                  selectedValue: selectedGender,
                                  items: const ["Male", "Female"],
                                  onChanged: (value) {
                                    setState(() {
                                      selectedGender = value;
                                    });
                                  },
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Gender is required";
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(height: 5),
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
                                const SizedBox(height: 10),
                                CustomTextField(
                                  label: "Confirm Password",
                                  hint: "Confirm your password...",
                                  isPassword: true,
                                  controller: confirmPassController,
                                  validator: (value) {
                                    if (value?.isEmpty ?? true) {
                                      return "Confirm Password is required";
                                    }
                                    if (value != passwordController.text) {
                                      return "Passwords do not match";
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(height: 15),
                                CustomButton(
                                  text: 'Sign up',
                                  onTap: () {
                                    if (formKey.currentState!.validate()) {
                                      print("=== Form Data ===");
                                      print("Full Name: '${fullNameController.text}'");
                                      print("Email: '${emailController.text}'");
                                      print("Phone: '${phoneController.text}'");
                                      print("Gender: '$selectedGender'");
                                      print("Password: '${passwordController.text}'");
                                      print("Confirm Password: '${confirmPassController.text}'");
                                      print("=================");

                                      BlocProvider.of<RegisterCubit>(context).register(
                                        userName: fullNameController.text.trim(),
                                        email: emailController.text.trim(),
                                        password: passwordController.text,
                                        confirmPass: confirmPassController.text,
                                        phone: phoneController.text.trim(),
                                        gender: selectedGender!,
                                      );
                                    }
                                  },
                                ),
                                const SizedBox(height: 20),
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
