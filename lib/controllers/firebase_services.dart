import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
//import 'package:fluttertoast/fluttertoast.dart';
import 'package:smart_fit_on/views/components/custom_toast.dart';
//import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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

    return null;
  }

  //Seller Basic data saving to firestore

  Future sellerBasicDataSaving(
    String userNameBusinessEmailValue,
    String mobileNoValue,
    String fullNameValue,
    String businessNameValue,
    String nicNoValue,
    String addressLine1Value,
    String addressLine2Value,
    String addressLine3Value,
    String customerType,
    BuildContext context,
  ) async {
    CollectionReference sellerBasicRef =
        FirebaseFirestore.instance.collection("SellerBasicData");
    try {
      await sellerBasicRef.add({
        'username': userNameBusinessEmailValue,
        'businessName': businessNameValue,
        'fullName': fullNameValue,
        'userType': customerType,
        'mobile': mobileNoValue,
        'nic': nicNoValue,
        'addressLine1': addressLine1Value,
        'addressLine2': addressLine2Value,
        'addressLine3': addressLine3Value,
      });
      print('Data written to Firestore database successfully.');
    } on FirebaseAuthException catch (e) {
      pikdyToasts.customErrorToast(e.message!, context);
      print(e.message!);
      //Fluttertoast.showToast(msg: e.message!, gravity: ToastGravity.TOP);
    }
  }

  //login function
  Future<User?> logIn(String emailFieldValue, String passwordFieldValue,
      BuildContext context) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: emailFieldValue,
        password: passwordFieldValue,
      );
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      pikdyToasts.customErrorToast(e.message!, context);
      print(e.message!);
      //Fluttertoast.showToast(msg: e.message!, gravity: ToastGravity.TOP);
    }
    return null;
  }
}
