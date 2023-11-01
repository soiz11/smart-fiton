import 'package:firebase_auth/firebase_auth.dart';

class FirebaseServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //sign up

  Future<UserCredential?> createUser(
      String userNameBusinessEmailValue, String confirmPasswordValue) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
        email: userNameBusinessEmailValue,
        password: confirmPasswordValue,
      );
    } on FirebaseAuthException catch (e) {
      // Handle the error here
      print('Failed to create user: $e');
      return null;
    }
  }
}
