import 'package:computer_store/provider/isActive.dart';
import 'package:computer_store/view/computerApp.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Widget providerApp() {
  return MultiProvider(
    providers: [ChangeNotifierProvider(create: (context) => Isactive())],
    child: Computerapp(),
  );
}
