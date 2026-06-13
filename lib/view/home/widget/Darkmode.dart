import 'package:computer_store/provider/themlogic.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:computer_store/provider/themlogic.dart';

class Option extends StatefulWidget {
  Option({super.key});

  @override
  State<Option> createState() => OptionarkmodeState();
}

class OptionarkmodeState extends State<Option> {
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
