import 'package:computer_store/auth/page/login.dart';
import 'package:computer_store/view/home/widget/Darkmode.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  final user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50, left: 30),
                child: CircleAvatar(
                  radius: 40,
                  backgroundImage: NetworkImage(
                    "https://i.pinimg.com/736x/86/84/57/868457c39ac2f160956b61ebdb6a5de8.jpg",
                  ),
                ),
              ),
              SizedBox(width: 30),
              Padding(
                padding: const EdgeInsets.only(top: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      user?.displayName ?? "Your name",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(user?.email ?? "No Email"),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Card(
            child: ListTile(
              leading: Icon(Icons.person_3_outlined),
              title: Text("My Prifile"),
              trailing: IconButton(
                onPressed: () {},
                icon: Icon(Icons.keyboard_arrow_right_outlined),
              ),
            ),
          ),
          SizedBox(height: 10),
          Card(
            child: ListTile(
              leading: Icon(Icons.settings),
              title: Text("Setting"),
              trailing: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Option()),
                  );
                },
                icon: Icon(Icons.keyboard_arrow_right_outlined),
              ),
            ),
          ),
          SizedBox(height: 10),
          Card(
            child: InkWell(
              onTap: () =>
                  pushScreen(context, screen: AboutUs(), withNavBar: false),
              child: ListTile(
                leading: Icon(Icons.shopping_bag),
                title: Text("About Us"),
                trailing: Icon(Icons.keyboard_arrow_right_outlined),
              ),
            ),
          ),
          SizedBox(height: 10),
          Card(
            child: InkWell(
              onDoubleTap: () {
                FirebaseAuth.instance.signOut();
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) =>
                        LoginPage(showRegisterPage: () => user),
                  ),
                );
              },
              child: ListTile(
                leading: Icon(Icons.logout),
                title: Text("Logout"),
                trailing: Icon(Icons.keyboard_arrow_right_outlined),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("About Us"), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Text(
              '   This application was developed as part of a university assignment to demonstrate knowledge and skills in software development. The project focuses on creating a user-friendly, efficient, and reliable solution that meets user needs.',
            ),
            SizedBox(height: 8),
            Text(
              '   Through the development of this application, various technologies and programming concepts were applied, including system design, user interface development, and data management.',
            ),
            SizedBox(height: 8),
            Text('    Thank you for using this application.'),
            Spacer(),
            Center(child: Text("Version 1.0.0 (11)")),
            SizedBox(height: 25),
          ],
        ),
      ),
    );
  }
}
