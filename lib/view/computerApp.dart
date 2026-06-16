import 'package:computer_store/core/const/color.dart';
import 'package:computer_store/provider/themlogic.dart';
import 'package:computer_store/view/home/widget/menu.dart';
import 'package:computer_store/view/home/widget/setting.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Computerapp extends StatelessWidget {
  const Computerapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => Themlogic())],
      child: Consumer<Themlogic>(
        builder: (context, themeLogic, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            themeMode: themeLogic.dark ? ThemeMode.dark : ThemeMode.light,

            theme: ThemeData(
              brightness: Brightness.light,
              colorScheme: ColorScheme.light(
                primary: AppColors.primary,
                secondary: AppColors.secondary,
                tertiary: AppColors.tertiary,
              ),
            ),

            darkTheme: ThemeData(
              brightness: Brightness.dark,
              appBarTheme: const AppBarTheme(
                backgroundColor: Color(0xFF0F172A),
                foregroundColor: Colors.white,
              ),
              colorScheme: ColorScheme.dark(
                primary: AppColors.primary,
                secondary: AppColors.secondary,
                tertiary: AppColors.tertiary,
              ),
              scaffoldBackgroundColor:  Color(0xFF0F172A),
            ),

            home: Menu(),
          );
        },
      ),
    );
  }
}
