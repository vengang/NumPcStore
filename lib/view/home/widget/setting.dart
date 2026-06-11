import 'package:computer_store/view/home/widget/Darkmode.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

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
                    MaterialPageRoute(builder: (context) => Darkmode()),
                  );
                },
                icon: Icon(Icons.keyboard_arrow_right_outlined),
              ),
            ),
          ),
          SizedBox(height: 10),
          Card(
            child: ListTile(
              leading: Icon(Icons.shopping_bag),
              title: Text("My Computer"),
              trailing: IconButton(
                onPressed: () {},
                icon: Icon(Icons.keyboard_arrow_right_outlined),
              ),
            ),
          ),
          SizedBox(height: 10),
          Card(
            child: ListTile(
              leading: Icon(Icons.logout),
              title: Text("Logout"),
              trailing: IconButton(
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                },
                icon: Icon(Icons.keyboard_arrow_right_outlined),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
