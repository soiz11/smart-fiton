import 'package:flutter/material.dart';
import 'package:smart_fit_on/assets/colors/colors.dart';
import 'package:smart_fit_on/views/authentication/as_buyer.dart';
import 'package:smart_fit_on/views/authentication/as_seller.dart';
import 'package:smart_fit_on/views/authentication/register.dart';
import 'package:smart_fit_on/views/components/reg_headline.dart';
import 'package:smart_fit_on/views/components/custom_text_feild.dart';
import 'dart:developer' as dev;
import 'package:smart_fit_on/views/components/long_btn.dart';

// ignore: must_be_immutable
class OnBoarding extends StatefulWidget {
  bool isSeller;
  bool isBuyer;
  OnBoarding({super.key, required this.isSeller, required this.isBuyer});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

String userNameBusinessEmailValue = '';
String mobileNoValue = '';
String passwordValue = '';
String confirmPasswordValue = '';

final _formKey = GlobalKey<FormState>();

class _OnBoardingState extends State<OnBoarding> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: AppColors.bodyGrey,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 25.0,
            ),
            child: ScrollConfiguration(
              behavior: const ScrollBehavior().copyWith(overscroll: false),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          //header),

                          const SizedBox(height: 80),

                          RegHeading(
                            headerText: "ON BOARDING .....",
                            icon: Icons.play_arrow_rounded,
                            onTap: () {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          const Register()));
                            },
                          ),

                          const SizedBox(height: 60),

                          CustomTextField(
                            hintText: 'Username / Business Email',
                            validator: (val) {
                              return val!.length < 7
                                  ? "Enter a password with at least 6 characters"
                                  : null;
                            },
                            onChanged: (value) {
                              setState(
                                () {
                                  userNameBusinessEmailValue = value;
                                  dev.log(
                                      'Password Field Value: $userNameBusinessEmailValue');
                                },
                              );
                            },
                          ),

                          const SizedBox(height: 10),

                          CustomTextField(
                            hintText: 'Mobile No',
                            validator: (val) {
                              return val!.length < 7
                                  ? "Enter a password with at least 6 characters"
                                  : null;
                            },
                            onChanged: (value) {
                              setState(
                                () {
                                  mobileNoValue = value;
                                  dev.log(
                                      'Password Field Value: $mobileNoValue');
                                },
                              );
                            },
                          ),

                          const SizedBox(height: 30),

                          CustomTextField(
                            hintText: 'Password',
                            validator: (val) {
                              return val!.length < 7
                                  ? "Enter a password with at least 6 characters"
                                  : null;
                            },
                            onChanged: (value) {
                              setState(
                                () {
                                  passwordValue = value;
                                  dev.log(
                                      'Password Field Value: $passwordValue');
                                },
                              );
                            },
                          ),

                          const SizedBox(height: 10),

                          CustomTextField(
                            hintText: 'Confirm Password',
                            validator: (val) {
                              return val!.length < 7
                                  ? "Enter a password with at least 6 characters"
                                  : null;
                            },
                            onChanged: (value) {
                              setState(
                                () {
                                  confirmPasswordValue = value;
                                  dev.log(
                                      'Password Field Value: $confirmPasswordValue');
                                },
                              );
                            },
                          ),

                          const SizedBox(height: 30),

                          GestureDetector(
                            child: LongBtn(
                              btnColor: AppColors.mainGreen,
                              btnText: "NEXT",
                              btnTextColor: Colors.white,
                              isBorderRequired: false,
                              isIcon: true,
                              icon: Icons.play_arrow_rounded,
                              onTap: () {
                                if (widget.isSeller) {
                                  // Navigate to the Seller page
                                  Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          const AsSeller(),
                                    ),
                                  );

                                  setState(() {
                                    widget.isSeller = false;
                                  });
                                } else if (widget.isBuyer) {
                                  // Navigate to the Buyer page
                                  Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          const AsBuyer(),
                                    ),
                                  );

                                  setState(() {
                                    widget.isBuyer = false;
                                  });
                                }
                              },
                            ),
                          ),
                          // Add other widgets here
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
