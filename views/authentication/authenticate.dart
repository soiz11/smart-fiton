import 'package:flutter/material.dart';
import 'package:smart_fit_on/views/authentication/login.dart';
//import 'package:smart_fit_on/views/cus_screens/cus_screens.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({super.key});

  @override
  State<Authenticate> createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Login(),
    );
  }
}
