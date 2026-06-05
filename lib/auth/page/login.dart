import 'package:computer_store/auth/page/Signup.dart';
import 'package:computer_store/view/home/widget/custom_textfiled.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  final VoidCallback showRegisterPage;
  LoginPage({super.key,required this.showRegisterPage});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final email = TextEditingController();
  final password = TextEditingController();

  bool _hidepassword = true;

  Future Login() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email.text.trim(),
      password: password.text.trim(),
    );
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final pic =
        "https://upload.wikimedia.org/wikipedia/en/2/25/National_University_of_Cambodia_logo.png";

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 100),

                Center(child: Image.network(pic, height: 180)),

                SizedBox(height: 30),

                _buildTextFiled(),
                SizedBox(height: 20),
                _buildElevatedButtom(),
                SizedBox(height: 20),
                 GestureDetector(
                  onTap: widget.showRegisterPage,
                   child: RichText(
                      text: TextSpan(
                        style: TextStyle(color: Colors.grey[700], fontSize: 16),
                        children: [
                          TextSpan(text: "Not a member?"),
                          TextSpan(
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                            text: "Register here!",
                          ),
                        ],
                      ),
                    ),
                 ),
                
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextFiled() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Welcome",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 80, 72, 46),
          ),
        ),

        SizedBox(height: 20),

        CustomTextfiled(
          hintText: "Email Address",
          prefixIcon: Icons.email,
          controller: email,
        ),

        SizedBox(height: 20),

        CustomTextfiled(
          hintText: "Password",
          prefixIcon: Icons.lock,
          controller: password,
          obscureText: _hidepassword,
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                _hidepassword = !_hidepassword;
              });
            },
            icon: Icon(_hidepassword ? Icons.visibility : Icons.visibility_off),
          ),
        ),
      ],
    );
  }

  Widget _buildElevatedButtom() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
        fixedSize: Size(350, 50),
      ),
      onPressed: () {
        Login();
      },
      child: Text("Login", style: TextStyle(fontSize: 25, color: Colors.white)),
    );
  }
}
