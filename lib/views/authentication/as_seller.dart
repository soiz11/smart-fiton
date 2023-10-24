import 'package:flutter/material.dart';
import 'package:smart_fit_on/views/authentication/on_boarding.dart';
//import 'package:smart_fit_on/views/authentication/register.dart';
import 'package:smart_fit_on/views/components/reg_headline.dart';
import 'package:smart_fit_on/views/components/custom_text_feild.dart';

import 'dart:developer' as dev;
import 'package:smart_fit_on/views/components/long_btn.dart';
import 'package:smart_fit_on/assets/colors/colors.dart';

class AsSeller extends StatefulWidget {
  const AsSeller({super.key});

  @override
  State<AsSeller> createState() => _AsSellerState();
}

String fullNameValue = "";
String businessNameValue = "";
String nicNoValue = "";
String addressLine1Value = "";
String addressLine2Value = "";
String addressLine3Value = "";

final _formKey = GlobalKey<FormState>();

class _AsSellerState extends State<AsSeller> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.bodyGrey,
        image: DecorationImage(
          image: AssetImage("lib/assets/images/greenbg.png"),
          fit: BoxFit.contain,
          alignment: Alignment.bottomCenter,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            SafeArea(
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
                              //header

                              const SizedBox(height: 30),
                              RegHeading(
                                headerText: "SELLER",
                                icon: Icons.play_arrow_rounded,
                                onTap: () {
                                  Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          OnBoarding(
                                        isSeller: true,
                                        isBuyer: false,
                                      ),
                                    ),
                                  );
                                },
                              ),

                              const SizedBox(height: 50),

                              CustomTextField(
                                hintText: 'Full Name',
                                validator: (val) {
                                  return val!.length < 7
                                      ? "Enter a password with at least 6 characters"
                                      : null;
                                },
                                onChanged: (value) {
                                  setState(
                                    () {
                                      fullNameValue = value;
                                      dev.log(
                                          'Password Field Value: $fullNameValue');
                                    },
                                  );
                                },
                              ),

                              const SizedBox(height: 10),

                              CustomTextField(
                                hintText: 'Business Name',
                                validator: (val) {
                                  return val!.length < 7
                                      ? "Enter a password with at least 6 characters"
                                      : null;
                                },
                                onChanged: (value) {
                                  setState(
                                    () {
                                      businessNameValue = value;
                                      dev.log(
                                          'Password Field Value: $businessNameValue ');
                                    },
                                  );
                                },
                              ),

                              const SizedBox(height: 10),

                              CustomTextField(
                                hintText: 'NIC No',
                                validator: (val) {
                                  return val!.length < 7
                                      ? "Enter a password with at least 6 characters"
                                      : null;
                                },
                                onChanged: (value) {
                                  setState(
                                    () {
                                      nicNoValue = value;
                                      dev.log(
                                          'Password Field Value: $nicNoValue');
                                    },
                                  );
                                },
                              ),

                              // Add other CustomTextField widgets

                              const SizedBox(height: 30),

                              CustomTextField(
                                hintText: 'Address Line 1',
                                validator: (val) {
                                  return val!.length < 7
                                      ? "Enter a password with at least 6 characters"
                                      : null;
                                },
                                onChanged: (value) {
                                  setState(
                                    () {
                                      addressLine1Value = value;
                                      dev.log(
                                          'Password Field Value: $addressLine1Value');
                                    },
                                  );
                                },
                              ),

                              const SizedBox(height: 10),

                              CustomTextField(
                                hintText: 'Address Line 2',
                                validator: (val) {
                                  return val!.length < 7
                                      ? "Enter a password with at least 6 characters"
                                      : null;
                                },
                                onChanged: (value) {
                                  setState(
                                    () {
                                      addressLine2Value = value;
                                      dev.log(
                                          'Password Field Value: $addressLine2Value');
                                    },
                                  );
                                },
                              ),

                              const SizedBox(height: 10),

                              CustomTextField(
                                hintText: 'Address Line 3',
                                validator: (val) {
                                  return val!.length < 7
                                      ? "Enter a password with at least 6 characters"
                                      : null;
                                },
                                onChanged: (value) {
                                  setState(
                                    () {
                                      addressLine3Value = value;
                                      dev.log(
                                          'Password Field Value: $addressLine3Value');
                                    },
                                  );
                                },
                              ),

                              const SizedBox(height: 30),

                              GestureDetector(
                                child: LongBtn(
                                  btnColor: Colors.black,
                                  btnText: "SUBMIT",
                                  btnTextColor: Colors.white,
                                  isBorderRequired: false,
                                  onTap: () {
                                    // Add your logic here
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
          ],
        ),
      ),
    );
  }
}
