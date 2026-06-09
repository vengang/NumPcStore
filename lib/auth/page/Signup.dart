import 'package:computer_store/auth/page/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  final VoidCallback showLoginPage;
  Signup({super.key, required this.showLoginPage});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final email = TextEditingController();
  final password = TextEditingController();
  final Comfirmpassword = TextEditingController();
  final name = TextEditingController();
  bool _hidepassword = true;

  Future Register() async {
    if (passwordComfirm()) {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email.text.trim(),
        password: password.text.trim(),
      );
    }
  }

  bool passwordComfirm() {
    if (password.text.trim() == Comfirmpassword.text.trim()) {
      return true;
    } else {
      return false;
    }
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    Comfirmpassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 25),
                _buildTextFiled(),
                SizedBox(height: 20),
                _buildCheckBox(),
                SizedBox(height: 25),
                _buildElevatedButtom(),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: widget.showLoginPage,
                      child: RichText(
                        text: TextSpan(
                          style: TextStyle(
                            color: Colors.grey[700],
                            fontSize: 16,
                          ),
                          children: [
                            TextSpan(text: "Already has an Account?"),
                            TextSpan(
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                              text: "Login here!",
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
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
          "Sign Up",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 80, 72, 46),
          ),
        ),
        Text("Create an account to get started"),

        SizedBox(height: 20),
        Text(
          "Name",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        TextField(
          controller: name,
          decoration: InputDecoration(
            hintText: "Enter your name",
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          ),
        ),
        SizedBox(height: 10),
        Text(
          "Email Address",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        TextField(
          controller: email,
          decoration: InputDecoration(
            hintText: "name@email.com",
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          ),
        ),

        SizedBox(height: 10),
        Text(
          "Password",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        TextField(
          controller: password,
          decoration: InputDecoration(
            hintText: "Create a password",
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  _hidepassword = !_hidepassword;
                });
              },
              icon: Icon(
                _hidepassword ? Icons.visibility_off : Icons.visibility,
              ),
            ),
          ),
          obscureText: _hidepassword,
        ),
        SizedBox(height: 15),
        TextField(
          controller: Comfirmpassword,
          decoration: InputDecoration(
            hintText: "Comfirm Your Password",
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  _hidepassword = !_hidepassword;
                });
              },
              icon: Icon(
                _hidepassword ? Icons.visibility_off : Icons.visibility,
              ),
            ),
          ),
          obscureText: _hidepassword,
        ),
      ],
    );
  }

  bool checked = false;

  Widget _buildCheckBox() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Checkbox(
          value: checked,
          activeColor: Colors.black,
          onChanged: (value) {
            setState(() {
              checked = value!;
            });
          },
        ),

        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 12),
            child: RichText(
              text: TextSpan(
                style: TextStyle(color: Colors.grey[700], fontSize: 16),
                children: [
                  TextSpan(text: "I've read and agree with the "),

                  TextSpan(
                    text: "Terms and Conditions",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  TextSpan(text: " and the "),

                  TextSpan(
                    text: "Privacy Policy.",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildElevatedButtom() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
        fixedSize: Size(300, 50),
      ),
      onPressed: () {
        Register();
      },
      child: Text(
        "Sign Up",
        style: TextStyle(fontSize: 25, color: Colors.white),
      ),
    );
  }
}
