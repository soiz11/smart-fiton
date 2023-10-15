// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:smart_fit_on/views/authentication/login.dart';
//import 'package:smart_fit_on/cus_bottomnavbar.dart';
//import 'package:smart_fit_on/views/wrapper.dart';
//import 'package:firebase_core/firebase_core.dart';

void main() {
  //WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: Login(),
      //home: Wrapper(),
      //CusBottomNavBar(),
    );
  }
}
