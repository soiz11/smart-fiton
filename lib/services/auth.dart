import 'package:firebase_auth/firebase_auth.dart';
import 'package:smart_fit_on/models/UserModel.dart';

class AuthServices {
  //register using mail and password
  //sign in using gmail
  //sign out

  //firebase instance
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //create a user from uid
  UserModel? _userWithFirebaseUserId(User? user) {
    return user != null ? UserModel(uid: user.uid) : null;
  }

  //create stream for cheking the auth changes in the user
  Stream<UserModel?> get user {
    return _auth.authStateChanges().map(_userWithFirebaseUserId);
  }
}
