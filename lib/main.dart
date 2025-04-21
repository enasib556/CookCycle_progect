import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:university_graduate_project/manager/auth_cubit/auth_cubit.dart';
import 'package:university_graduate_project/screens/splash_screen.dart';
import 'package:university_graduate_project/utilis/color.dart';

import 'manager/recipe_cubit/recipe_cubit.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<RecipeCubit>(
          create: (context) => RecipeCubit()..fetchRecipe(),
        ),
        BlocProvider<AuthCubit>(
          create: (context) => AuthCubit(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData.light().copyWith(
          scaffoldBackgroundColor: backgroundColor,
        ),
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}
