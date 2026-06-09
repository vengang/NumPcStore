import 'package:computer_store/provider/add_to_card.dart';
import 'package:computer_store/provider/favorateProvider.dart';
import 'package:computer_store/provider/isActive.dart';
import 'package:computer_store/view/computerApp.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Widget providerApp() {
  return MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => Isactive()),
      ChangeNotifierProvider(create: ((context) => Favorateprovider())),
      ChangeNotifierProvider(create: ((context) => AddToCardProvider())),
    ],
    child: Computerapp(),
  );
}
