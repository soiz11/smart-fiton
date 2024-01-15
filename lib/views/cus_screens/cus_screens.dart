import 'package:flutter/material.dart';
//NOT IN USE

class CusScreens extends StatefulWidget {
  const CusScreens({super.key});

  @override
  State<CusScreens> createState() => _CusScreensState();
}

class _CusScreensState extends State<CusScreens> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.red,
      body: Center(
        child: Text("Homt"),
      ),
    );
  }
}
