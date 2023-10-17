import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

final _formKey = GlobalKey<FormState>();
String email = "";
String password = "";

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey[300],
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //logo

                  const SizedBox(height: 10),

                  Image.asset(
                    "assets/images/PIKDY.png",
                    width: 200,
                  ),

                  const SizedBox(height: 10),

                  //welcome text
                  Text(
                    "For an immersive shopping experience",
                    style: TextStyle(
                        color: Colors.grey[700],
                        fontFamily: "secondary",
                        fontSize: 20),
                  ),

                  const SizedBox(height: 30),

                  //Text feilds

                  Form(
                    key: _formKey,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Column(
                        children: [
                          //email_feild
                          TextFormField(
                            decoration: InputDecoration(
                              enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey.shade400)),
                              hintText: "Username",
                              filled: true,
                              fillColor: Colors.grey[200],
                            ),
                            validator: (val) => val?.isEmpty == true
                                ? "Enter a valid email"
                                : null,
                            onChanged: (val) {
                              setState(() {
                                email = val;
                              });
                            },
                          ),

                          const SizedBox(height: 10),

                          //password_feild
                          TextFormField(
                            decoration: InputDecoration(
                              enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey.shade400)),
                              hintText: "Password",
                              filled: true,
                              fillColor: Colors.grey[200],
                            ),
                            validator: (val) => val!.length < 7
                                ? "Enter a password with at least 6 charactors"
                                : null,
                            onChanged: (val) {
                              setState(() {
                                password = val;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 15),

                  //login button
                  Container(
                    padding: const EdgeInsets.all(15),
                    margin: const EdgeInsets.symmetric(horizontal: 25.0),
                    decoration: BoxDecoration(
                      color: HexColor("#5ebf00"),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Center(
                      child: Text(
                        "Login",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Secondary",
                            fontWeight: FontWeight.bold,
                            fontSize: 22),
                      ),
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
                          padding:
                              const EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                          child: GestureDetector(
                            child: Text(
                              "Register",
                              style: TextStyle(
                                  color: HexColor("#5ebf00"),
                                  fontFamily: "Secondary",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                          ))
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
