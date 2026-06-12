import 'package:computer_store/core/const/color.dart';
import 'package:computer_store/provider/darkMode.dart';
import 'package:computer_store/provider/mulProvider.dart';
import 'package:computer_store/view/home/page/homeScreen.dart';
import 'package:computer_store/view/home/widget/menu.dart';
import 'package:computer_store/view/home/widget/setting.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Computerapp extends StatelessWidget {
  const Computerapp({super.key});

  @override
  Widget build(BuildContext context) {
    bool _isDark = context.watch<DarkMode>().isDarkMode;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: _isDark ? ThemeMode.dark : ThemeMode.light,
      // light
      theme: ThemeData(
        brightness: Brightness.light,
        colorScheme: ColorScheme.light(
          primary: AppColors.primary,
          secondary: AppColors.secondary,
          tertiary: AppColors.tertiary,
        ),
      ),
      //dark
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        colorScheme: ColorScheme.dark(
          surface: const Color.fromARGB(255, 6, 29, 122).withValues(alpha: .1),
        ),
        scaffoldBackgroundColor: const Color(0xFF0F172A),
      ),
      home: Homescreen(),
    );
  }
}
