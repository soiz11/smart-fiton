import 'package:flutter/material.dart';
import 'package:smart_fit_on/assets/colors/colors.dart';
import 'package:smart_fit_on/views/authentication/as_buyer.dart';
import 'package:smart_fit_on/views/authentication/as_seller.dart';
import 'package:smart_fit_on/views/authentication/register.dart';
import 'package:smart_fit_on/views/components/reg_headline.dart';
import 'package:smart_fit_on/views/components/custom_text_feild.dart';
import 'dart:developer' as dev;
import 'package:smart_fit_on/views/components/long_btn.dart';
import 'package:smart_fit_on/controllers/form_validators.dart';
import 'package:smart_fit_on/controllers/firebase_services.dart';
// **import 'package:firebase_auth/firebase_auth.dart';

// ignore: must_be_immutable
class OnBoarding extends StatefulWidget {
  bool isSeller;
  bool isBuyer;
  String? passwordValue;
  String? confirmPasswordValue;
  OnBoarding(
      {super.key,
      required this.isSeller,
      required this.isBuyer,
      this.passwordValue,
      this.confirmPasswordValue});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

String userNameBusinessEmailValue = '';
String mobileNoValue = '';
String passwordValue = '';
String confirmPasswordValue = '';
String originalPassword = "";

final _formKey = GlobalKey<FormState>();
final _formValidators = FormValidators();
final FirebaseServices _firebaseServices = FirebaseServices();

String errorMessage = "";

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
                            validator: _formValidators.validateEmail,
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

                          if (errorMessage.isNotEmpty)
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                errorMessage,
                                style: const TextStyle(
                                  color: Colors.red,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          const SizedBox(height: 10),

                          CustomTextField(
                            hintText: 'Mobile No',
                            validator: _formValidators.validateMobile,
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
                            validator: _formValidators.validatePassword,
                            onChanged: (password) {
                              setState(
                                () {
                                  passwordValue = password;
                                  dev.log(
                                      'Password Field Value: $passwordValue');
                                },
                              );
                            },
                          ),

                          const SizedBox(height: 10),

                          CustomTextField(
                            hintText: 'Confirm Password',
                            validator: (confirmPasswordValue) {
                              return _formValidators.validatePasswordConfirm(
                                  passwordValue, confirmPasswordValue);
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
                                onTap: () async {
                                  if (_formKey.currentState!.validate()) {
                                    var result =
                                        await _firebaseServices.createUser(
                                            userNameBusinessEmailValue,
                                            confirmPasswordValue,
                                            context);

                                    FocusScope.of(context).unfocus();

                                    setState(() {});

                                    if (result != null) {
                                      print('User created successfully!');
                                      // Perform the Firebase database update here
                                      print('Submitting to Firebase database');
                                      if (widget.isSeller) {
                                        // Navigate to the Seller page
                                        Navigator.of(context).pushReplacement(
                                          MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                const AsSeller(),
                                          ),
                                        );
                                      } else if (widget.isBuyer) {
                                        // Navigate to the Buyer page
                                        Navigator.of(context).pushReplacement(
                                          MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                const AsBuyer(),
                                          ),
                                        );
                                      }
                                    }
                                  }
                                }
                                /*
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
                                }*/
                                ),
                          ),
                        ],
                      ),
                    ),
                    // Add other widgets here
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
