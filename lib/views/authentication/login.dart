import 'package:flutter/material.dart';
import 'package:smart_fit_on/cus_bottomnavbar.dart';
import 'package:smart_fit_on/views/authentication/register.dart';

import 'package:smart_fit_on/views/components/custom_text_feild.dart';

import 'dart:developer' as dev;
import 'package:smart_fit_on/views/components/long_btn.dart';
import 'package:smart_fit_on/assets/colors/colors.dart';
import 'package:smart_fit_on/controllers/form_validators.dart';
import 'package:smart_fit_on/controllers/firebase_services.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

final _formKey = GlobalKey<FormState>();
final FirebaseServices _firebaseServices = FirebaseServices();

String emailFieldValue = '';
String passwordFieldValue = '';

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: AppColors.bodyGrey,
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 25.0,
          ),
          child: Center(
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //logo

                  const SizedBox(height: 0),

                  Image.asset(
                    "lib/assets/images/PIKDY.png",
                    width: 200,
                  ),

                  const SizedBox(height: 10),

                  //welcome text
                  const Text(
                    "For an immersive shopping experience",
                    style: TextStyle(
                        color: AppColors.textGrey,
                        fontFamily: "secondary",
                        fontSize: 20),
                  ),

                  const SizedBox(height: 15),

                  //Text feilds

                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        const SizedBox(height: 10),
                        CustomTextField(
                          hintText: 'Username',
                          validator: (String? value) =>
                              FormValidators.validateLoginEmailAndPassword(
                                  value, 'username or business email'),
                          onChanged: (value) {
                            setState(() {
                              emailFieldValue = value;
                              // ignore: avoid_print
                              dev.log('Email Field Value: $emailFieldValue');
                            });
                          },
                        ),
                        const SizedBox(height: 10),
                        CustomTextField(
                          hintText: 'Password',
                          validator: (String? value) =>
                              FormValidators.validateLoginEmailAndPassword(
                                  value, 'password'),
                          onChanged: (value) {
                            setState(() {
                              passwordFieldValue = value;
                              dev.log(
                                  'Password Field Value: $passwordFieldValue');
                            });
                          },
                        ),
                        const SizedBox(height: 20),
                        LongBtn(
                            btnColor: AppColors.mainGreen,
                            btnText: "LOGIN",
                            btnTextColor: Colors.white,
                            isBorderRequired: false,
                            onTap: () async {
                              if (_formKey.currentState!.validate()) {
                                await _firebaseServices.logIn(emailFieldValue,
                                    passwordFieldValue, context);

                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            const CusBottomNavBar()));
                              }
                            }),
                      ],
                    ),
                  ),

                  const SizedBox(height: 15),

                  //toggle area
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account?",
                        style: TextStyle(
                            color: Colors.grey[700],
                            fontFamily: "Secondary",
                            fontSize: 18),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        const Register()));
                          },
                          child: const Text(
                            "Register",
                            style: TextStyle(
                                color: AppColors.mainGreen,
                                fontFamily: "Secondary",
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
