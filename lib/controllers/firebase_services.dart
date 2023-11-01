import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:smart_fit_on/views/components/custom_toast.dart';

class FirebaseServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  PikdyToasts pikdyToasts = PikdyToasts();
  //sign up

  Future<UserCredential?> createUser(String userNameBusinessEmailValue,
      String confirmPasswordValue, BuildContext context) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
        email: userNameBusinessEmailValue,
        password: confirmPasswordValue,
      );
    } on FirebaseAuthException catch (e) {
      pikdyToasts.customErrorToast(e.message!, context);
      print(e.message!);
      //Fluttertoast.showToast(msg: e.message!, gravity: ToastGravity.TOP);
    }
    // Handle the error here

    return null;
  }
}
