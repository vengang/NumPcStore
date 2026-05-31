import 'package:computer_store/core/const/color.dart';
import 'package:computer_store/view/home/page/homeScreen.dart';
import 'package:computer_store/view/home/widget/menu.dart';
import 'package:flutter/material.dart';

class Computerapp extends StatelessWidget {
  const Computerapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      // light
      theme: ThemeData(
        brightness: Brightness.light,
        colorScheme: ColorScheme.light(
          primary: AppColors.primary,
          secondary: AppColors.secondary,
          tertiary: AppColors.tertiary,
        ),
        scaffoldBackgroundColor: Colors.white,
      ),
      //dark
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        colorScheme: ColorScheme.dark(
          primary: AppColors.primary, // same meaning
          secondary: AppColors.secondary,
          tertiary: AppColors.tertiary,
        ),
        scaffoldBackgroundColor: const Color(0xFF0F172A),
      ),

      home: Menu(),
    );
  }
}
