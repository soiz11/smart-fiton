import 'package:flutter/material.dart';

class CusHome extends StatefulWidget {
  const CusHome({super.key});

  @override
  State<CusHome> createState() => _CusHomeState();
}

class _CusHomeState extends State<CusHome> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromARGB(255, 129, 74, 74),
      body: Center(
        child: Text("Home"),
      ),
    );
  }
}
