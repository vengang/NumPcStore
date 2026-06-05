import 'package:computer_store/auth/main_page.dart';
import 'package:flutter/material.dart';

class Accout extends StatelessWidget {
  const Accout({super.key});

  @override
  Widget build(BuildContext context) {
    final img =
        "https://upload.wikimedia.org/wikipedia/en/2/25/National_University_of_Cambodia_logo.png";
    return Scaffold(
      appBar: AppBar(
        title: Text("Account", style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Image.network(img),
            SizedBox(height: 15),
            Text(
              "Please Login to Continue",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            SizedBox(height: 100),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: Size(350, 50),
                backgroundColor: Colors.blue,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MainPage()),
                );
              },
              child: Text(
                "Login",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
