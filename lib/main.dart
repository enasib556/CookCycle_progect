import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:university_graduate_project/manager/auth_cubit/login_cubit.dart';
import 'package:university_graduate_project/manager/auth_cubit/register_cubit.dart';
import 'package:university_graduate_project/screens/splash_screen.dart';
import 'package:university_graduate_project/screens/home_screen.dart';
import 'package:university_graduate_project/utilis/color.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'manager/recipe_cubit/recipe_cubit.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // تحقق من التوكن المخزن في SharedPreferences
  final prefs = await SharedPreferences.getInstance();
  final token = prefs.getString("token");

  runApp(MyApp(isLoggedIn: token != null));  // إذا كان هناك توكن، يعتبر المستخدم مسجل دخول
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;
  const MyApp({super.key, required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<RecipeCubit>(create: (context) => RecipeCubit()..fetchRecipe()),
        BlocProvider<RegisterCubit>(create: (context) => RegisterCubit()),
        BlocProvider<LoginCubit>(create: (context) => LoginCubit()),

      ],
      child: MaterialApp(
        theme: ThemeData.light().copyWith(scaffoldBackgroundColor: backgroundColor),
        debugShowCheckedModeBanner: false,
        home: isLoggedIn ? HomeScreen() : SplashScreen(), // إذا كان مستخدم مسجل دخول، يعرض الشاشة الرئيسية
      ),
    );
  }
}
