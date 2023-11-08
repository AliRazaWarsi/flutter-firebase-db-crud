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
    apiKey: 'AIzaSyBRw7dn5b2ZMO3zvLyAIr-nIrrxV6OL27Y',
    appId: '1:587080732878:web:cdbc94dc09fe5c3612809f',
    messagingSenderId: '587080732878',
    projectId: 'flutterdbconnection',
    authDomain: 'flutterdbconnection.firebaseapp.com',
    databaseURL: 'https://flutterdbconnection-default-rtdb.firebaseio.com',
    storageBucket: 'flutterdbconnection.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBnGHSv7tKqa9onrqjN-TRyUbHttXZ9r90',
    appId: '1:587080732878:android:5317f66b8dd306c212809f',
    messagingSenderId: '587080732878',
    projectId: 'flutterdbconnection',
    databaseURL: 'https://flutterdbconnection-default-rtdb.firebaseio.com',
    storageBucket: 'flutterdbconnection.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBl5lCkCP6FdkCHkg5D4awdAOilTYmZChQ',
    appId: '1:587080732878:ios:0e899dde54de635212809f',
    messagingSenderId: '587080732878',
    projectId: 'flutterdbconnection',
    databaseURL: 'https://flutterdbconnection-default-rtdb.firebaseio.com',
    storageBucket: 'flutterdbconnection.appspot.com',
    iosBundleId: 'com.example.flutterAppDbConnection',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBl5lCkCP6FdkCHkg5D4awdAOilTYmZChQ',
    appId: '1:587080732878:ios:662a57e0598e41aa12809f',
    messagingSenderId: '587080732878',
    projectId: 'flutterdbconnection',
    databaseURL: 'https://flutterdbconnection-default-rtdb.firebaseio.com',
    storageBucket: 'flutterdbconnection.appspot.com',
    iosBundleId: 'com.example.flutterAppDbConnection.RunnerTests',
  );
}