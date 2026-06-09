import 'package:computer_store/auth/main_page.dart';
import 'package:computer_store/core/const/color.dart';
import 'package:computer_store/view/home/page/add_to_card_page.dart';
import 'package:computer_store/view/home/page/favoratePage.dart';
import 'package:computer_store/view/home/page/homeScreen.dart';
import 'package:computer_store/view/home/page/searchScreen.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

class Menu extends StatelessWidget {
  const Menu({super.key});

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      tabs: [
        PersistentTabConfig(
          screen: Homescreen(),
          item: ItemConfig(icon: Icon(Icons.home), title: "Home"),
        ),
        PersistentTabConfig(
          screen: Searchscreen(),
          item: ItemConfig(icon: Icon(Icons.grid_view), title: "Browse"),
        ),
        PersistentTabConfig(
          screen: AddToCardPage(),
          item: ItemConfig(icon: Icon(Icons.shopping_cart), title: "Cart"),
        ),

        PersistentTabConfig(
          screen: Favoratepage(),
          item: ItemConfig(icon: Icon(Icons.favorite_border), title: "Save"),
        ),

        PersistentTabConfig(
          screen:MainPage(),
          item: ItemConfig(icon: Icon(Icons.person), title: "Me"),
        ),
      ],
      navBarBuilder: (navBarConfig) => Style2BottomNavBar(
        navBarConfig: navBarConfig,
        navBarDecoration: NavBarDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
        ),
      ),
    );
  }
}
