// ignore_for_file: prefer_const_constructors

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:smart_fit_on/views/cus_screens/cus_cart.dart';
import 'package:smart_fit_on/views/cus_screens/cus_favorite.dart';
import 'package:smart_fit_on/views/cus_screens/cus_home.dart';

//Color softGreen = HexColor("#379300");

class CusBottomNavBar extends StatefulWidget {
  const CusBottomNavBar({super.key});

  @override
  State<CusBottomNavBar> createState() => _CusBottomNavBarState();
}

class _CusBottomNavBarState extends State<CusBottomNavBar> {
  int index = 1;

  @override
  Widget build(BuildContext context) {
    // ignore: non_constant_identifier_names
    List CusScreens = [CusFavorite(), CusHome(), CusCart()];

    return Scaffold(
      extendBody: true,
      bottomNavigationBar: CurvedNavigationBar(
        height: 70,
        index: index,
        backgroundColor: Colors.transparent,
        buttonBackgroundColor: Colors.black,
        color: HexColor("#379300"),
        items: const [
          Icon(Icons.favorite, color: Colors.white),
          Icon(Icons.home, color: Colors.white),
          Icon(Icons.shopping_cart, color: Colors.white),
        ],
        onTap: (index) => setState(
          () => this.index = index,
        ),
      ),
      body: CusScreens[index],
    );
  }
}
