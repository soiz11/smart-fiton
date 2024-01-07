import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:smart_fit_on/views/authentication/as_buyer.dart';
import 'package:smart_fit_on/views/authentication/login.dart';
//import 'package:fluttertoast/fluttertoast.dart';
import 'package:smart_fit_on/views/components/custom_toast.dart';
//import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:smart_fit_on/views/cus_screens/still_dev.dart';
import 'package:flutter/material.dart';

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

  //Buyer Basic data saving to firestore

  Future buyerBasicDataSaving(
    String userNameBusinessEmailValue,
    String mobileNoValue,
    String fisrtNameValue,
    String lastNameValue,
    String nicNoValue,
    String addressLine1Value,
    String addressLine2Value,
    String addressLine3Value,
    String customerType,
    BuildContext context,
  ) async {
    CollectionReference buyerBasicRef =
        FirebaseFirestore.instance.collection("BuyerBasicData");
    try {
      await buyerBasicRef.add({
        'username': userNameBusinessEmailValue,
        'firstName': firstNameValue,
        'lastName': lastNameValue,
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

  //getCustomerType method
  static Future<String> getCustomerType(String email) async {
    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection("SellerBasicData")
        .where("username", isEqualTo: email)
        .get();
    print("username: $email");
    if (snapshot.docs.isNotEmpty) {
      print("Seller");
      return "Seller";
    } else {
      print("Buyer");
      return "Buyer";
    }
  }

  //logout

  Future<void> signOut(BuildContext context) async {
    try {
      await _auth.signOut();
      await Future.delayed(
          Duration.zero); // This line allows the async gap to be closed
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Login()),
      );
    } catch (e) {
      print("Error signing out: $e");
    }
  }
}
