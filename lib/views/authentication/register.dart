import 'package:flutter/material.dart';
import 'package:smart_fit_on/assets/colors/colors.dart';
import 'package:smart_fit_on/views/authentication/login.dart';
import 'package:smart_fit_on/views/authentication/on_boarding.dart';
import 'package:smart_fit_on/views/components/long_btn.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool isSeller = false;
  bool isBuyer = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: AppColors.bodyGrey,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Container widget
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 2.0,
                ),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 25.0,
                  ),
                  width: MediaQuery.of(context).size.width,
                  color: AppColors.bodyGrey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //const SizedBox(height: 100),
                      const SizedBox(height: 230),

                      // Onboard text
                      const Text(
                        "Let's get you board on ...",
                        style: TextStyle(
                          color: AppColors.textGrey,
                          fontFamily: "secondary",
                          fontSize: 25,
                        ),
                      ),

                      const SizedBox(height: 0),

                      //register as text
                      const Text(
                        "Regsiter As",
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: "quad",
                          fontSize: 55,
                        ),
                      ),

                      const SizedBox(height: 10),

                      //logo

                      /*      const SizedBox(height: 20),

                      Center(
                        child: Image.asset(
                          "lib/assets/images/PIKDY.png",
                          width: 200,
                        ),
                      ),

                      const SizedBox(height: 45),
                */
                      const SizedBox(height: 15),

                      GestureDetector(
                        child: LongBtn(
                          btnColor: AppColors.mainGreen,
                          btnText: "BUYER",
                          btnTextColor: Colors.white,
                          isBorderRequired: false,
                          onTap: () {
                            setState(() {
                              isBuyer = !isBuyer;
                            });
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        OnBoarding(
                                            isSeller: isSeller,
                                            isBuyer: isBuyer)));
                          },
                        ),
                      ),

                      const SizedBox(height: 15),

                      GestureDetector(
                        child: LongBtn(
                          btnColor: AppColors.bodyGrey,
                          btnText: "seller",
                          btnTextColor: Colors.black,
                          isBorderRequired: true,
                          onTap: () {
                            setState(() {
                              isSeller = !isSeller;
                            });

                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        OnBoarding(
                                            isSeller: isSeller,
                                            isBuyer: isBuyer)));
                          },
                        ),
                      ),

                      const SizedBox(height: 20),

                      //clickable text
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Do you have an account?",
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
                                            const Login()));
                              },
                              child: const Text(
                                "Login",
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

              // Add other widgets here
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Image.asset(
                    "lib/assets/images/curve.png",
                    width: MediaQuery.of(context).size.width,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
