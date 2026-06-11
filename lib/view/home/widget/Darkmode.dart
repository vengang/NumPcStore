import 'package:computer_store/provider/themlogic.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:computer_store/provider/themlogic.dart';

class Darkmode extends StatefulWidget {
  Darkmode({super.key});

  @override
  State<Darkmode> createState() => _DarkmodeState();
}

class _DarkmodeState extends State<Darkmode> {
  bool switched = false;
  bool switchlight = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
        title: Text("Setting", style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Card(
            child: ListTile(
              leading: Icon(Icons.dark_mode),
              title: Text("Dark Mode"),
              trailing: Switch(
                value: context.watch<Themlogic>().dark,
                onChanged: (value) {
                  context.read<Themlogic>().toggle();

                  setState(() {
                    switched = value;
                    switchlight = !value;
                  });
                },
              ),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.light_mode),
              title: Text("Light Mode"),
              trailing: Switch(
                value: !context.watch<Themlogic>().dark,
                onChanged: (value) {
                  context.read<Themlogic>().toggle();

                  setState(() {
                    switchlight = value;
                    switched = !value;
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
