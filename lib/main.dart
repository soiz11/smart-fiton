// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:smart_fit_on/models/UserModel.dart';
import 'package:smart_fit_on/services/auth.dart';
//import 'package:smart_fit_on/views/authentication/login.dart';
//import 'package:smart_fit_on/views/authentication/login.dart';
//import 'package:smart_fit_on/views/wrapper.dart';
//import 'package:smart_fit_on/cus_bottomnavbar.dart';
//import 'package:smart_fit_on/views/wrapper.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:smart_fit_on/views/authentication/login.dart';
//import 'package:smart_fit_on/views/authentication/login.dart';
import 'package:smart_fit_on/views/authentication/register.dart';
import 'firebase_options.dart';
import 'package:smart_fit_on/assets/colors/colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<UserModel?>.value(
      initialData: UserModel(uid: ""),
      value: AuthServices().user,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          //backgroundColor: AppColors.bodyGrey,
          body: Login(),
        ),
      ),
    );

    /* MaterialApp(
      debugShowCheckedModeBanner: false,

      home: Wrapper(),
      //home: Wrapper(),
      //CusBottomNavBar(),
    ); */
  }
}
