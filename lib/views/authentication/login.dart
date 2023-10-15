import 'package:flutter/material.dart';

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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
      ),
      body: Column(
        children: [
          Form(
            key: _formKey,
            child: Column(
              children: [
                //email_feild
                TextFormField(
                  validator: (val) =>
                      val?.isEmpty == true ? "Enter a valid email" : null,
                  onChanged: (val) {
                    setState(() {
                      email = val;
                    });
                  },
                ),

                //password_feild
                TextFormField(
                  validator: (val) => val!.length < 7
                      ? "Enter a password with at least 6 charactors"
                      : null,
                  onChanged: (val) {
                    setState(() {
                      password = val;
                    });
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
