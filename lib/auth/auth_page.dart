import 'package:computer_store/auth/page/Signup.dart';
import 'package:computer_store/auth/page/login.dart';
import 'package:computer_store/view/home/widget/setting.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool showLoginPage = true;
  bool isRegistering = false; 

  void toggleScreen() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  void setRegistering(bool value) { 
    setState(() {
      isRegistering = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        // Block StreamBuilder from reacting during registration
        if (isRegistering) {
          return Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        // User is logged in → go to Setting
        if (snapshot.hasData) {
          return Setting();
        }

        // User is not logged in → show Login or Signup
        if (showLoginPage) {
          return LoginPage(showRegisterPage: toggleScreen);
        } else {
          return Signup(
            showLoginPage: toggleScreen,
            setRegistering: setRegistering, 
          );
        }
      },
    );
  }
}