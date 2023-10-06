import 'package:flutter/material.dart';

class CusFavorite extends StatefulWidget {
  const CusFavorite({super.key});

  @override
  State<CusFavorite> createState() => _CusFavoriteState();
}

class _CusFavoriteState extends State<CusFavorite> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.amber,
      body: Center(
        child: Text(
          "favourite",
          style: TextStyle(
            fontFamily: "Secondary",
            fontSize: 66,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
