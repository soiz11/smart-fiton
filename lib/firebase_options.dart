// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyAcbgbJS1AqHkn5Erik8ILGnFBUvW7y_mU',
    appId: '1:970999155967:web:2d71da4bfdbf01f11ed0ca',
    messagingSenderId: '970999155967',
    projectId: 'smart-fit-on-f7434',
    authDomain: 'smart-fit-on-f7434.firebaseapp.com',
    storageBucket: 'smart-fit-on-f7434.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAnTXupBLJjxEuishQdhAgMixz4QGDoi0w',
    appId: '1:970999155967:android:79cf31e41a3bfafa1ed0ca',
    messagingSenderId: '970999155967',
    projectId: 'smart-fit-on-f7434',
    storageBucket: 'smart-fit-on-f7434.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDFFgmky9Rsy7MmmN5LfeQlGaSZy3-g0TE',
    appId: '1:970999155967:ios:309c2dc192538a4c1ed0ca',
    messagingSenderId: '970999155967',
    projectId: 'smart-fit-on-f7434',
    storageBucket: 'smart-fit-on-f7434.appspot.com',
    iosBundleId: 'com.example.smartFitOn',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDFFgmky9Rsy7MmmN5LfeQlGaSZy3-g0TE',
    appId: '1:970999155967:ios:8f216968deb55a9d1ed0ca',
    messagingSenderId: '970999155967',
    projectId: 'smart-fit-on-f7434',
    storageBucket: 'smart-fit-on-f7434.appspot.com',
    iosBundleId: 'com.example.smartFitOn.RunnerTests',
  );
}