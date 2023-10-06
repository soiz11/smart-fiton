import 'package:flutter/material.dart';

class CusCart extends StatefulWidget {
  const CusCart({super.key});

  @override
  State<CusCart> createState() => _CusCartState();
}

class _CusCartState extends State<CusCart> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Text(
          "Cart",
          style: TextStyle(
            fontFamily: "Main",
            fontSize: 66,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
