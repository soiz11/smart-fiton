import 'package:flutter/material.dart';
import 'package:smart_fit_on/cus_bottomnavbar.dart';
import 'package:smart_fit_on/views/authentication/register.dart';
import 'package:smart_fit_on/views/sel_screens/seller_dashboard.dart';

import 'package:smart_fit_on/views/components/custom_text_feild.dart';

import 'package:smart_fit_on/views/components/long_btn.dart';
import 'package:smart_fit_on/assets/colors/colors.dart';
import 'package:smart_fit_on/controllers/form_validators.dart';
import 'package:smart_fit_on/controllers/firebase_services.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: () async {
        // Check if the user is signed in
        User? currentUser = FirebaseAuth.instance.currentUser;
        if (currentUser == null) {
          // If the user is not signed in, navigate to the login page
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const Login()),
          );
          return false; // Prevent going back
        }
        return true; // Allow going back
      },
      child: MaterialApp(
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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 0),

                    //Pikdy image and tag line
                    Image.asset(
                      "lib/assets/images/PIKDY.png",
                      width: 200,
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "For an immersive shopping experience",
                      style: TextStyle(
                          color: AppColors.textGrey,
                          fontFamily: "secondary",
                          fontSize: 20),
                    ),
                    const SizedBox(height: 15),

                    //Form content
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
                              });
                            },
                          ),
                          const SizedBox(height: 20),

                          //Button with validation and submission
                          LongBtn(
                            btnText: "LOGIN",
                            onTap: () async {
                              if (_formKey.currentState!.validate()) {
                                User? user = await _firebaseServices.logIn(
                                  emailFieldValue,
                                  passwordFieldValue,
                                  context,
                                );
                                // ignore: use_build_context_synchronously
                                FocusScope.of(context).unfocus();
                                if (user != null) {
                                  String userType =
                                      await FirebaseServices.getCustomerType(
                                    emailFieldValue,
                                  );
                                  if (userType == 'Seller') {
                                    // ignore: use_build_context_synchronously
                                    Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            const SellerDashboard(),
                                      ),
                                    );
                                  } else if (userType == 'Buyer') {
                                    // ignore: use_build_context_synchronously
                                    Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            const CusBottomNavBar(),
                                      ),
                                    );
                                  }
                                }
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 15),

                    //Do you have an account section
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
                          padding:
                              const EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
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
      ),
    );
  }
}
