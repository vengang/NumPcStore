import 'package:computer_store/auth/auth_page.dart';
import 'package:computer_store/auth/page/login.dart';
import 'package:computer_store/auth/page/profilePage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, shnapshot) {
        if (shnapshot.hasData) {
          return Profilepage();
        } else {
          return AuthPage();
        }
      },
    );
  }
}
