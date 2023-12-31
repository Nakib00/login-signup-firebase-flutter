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
    apiKey: 'AIzaSyBTudnkgEleuLSlUDIX9eM59IET3IsF684',
    appId: '1:251241889905:web:0bc168c27d23a1757e1bd0',
    messagingSenderId: '251241889905',
    projectId: 'insert-read-update-database',
    authDomain: 'insert-read-update-database.firebaseapp.com',
    databaseURL: 'https://insert-read-update-database-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'insert-read-update-database.appspot.com',
    measurementId: 'G-C4J95L0CEM',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC3M8JcDDGMFNChJgD8lq04Nq2IDiJ51Os',
    appId: '1:251241889905:android:5591e8c2d7ef1ac67e1bd0',
    messagingSenderId: '251241889905',
    projectId: 'insert-read-update-database',
    databaseURL: 'https://insert-read-update-database-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'insert-read-update-database.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBCFHu5ZBX0Hi79rbOscwYI3UCFwHOY86I',
    appId: '1:251241889905:ios:dbb3865c2c9bba597e1bd0',
    messagingSenderId: '251241889905',
    projectId: 'insert-read-update-database',
    databaseURL: 'https://insert-read-update-database-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'insert-read-update-database.appspot.com',
    iosClientId: '251241889905-ioffi9qnmj3vp7q7oma3qc3ue9n1r4em.apps.googleusercontent.com',
    iosBundleId: 'com.example.loginSignupApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBCFHu5ZBX0Hi79rbOscwYI3UCFwHOY86I',
    appId: '1:251241889905:ios:590bde35f39e50e07e1bd0',
    messagingSenderId: '251241889905',
    projectId: 'insert-read-update-database',
    databaseURL: 'https://insert-read-update-database-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'insert-read-update-database.appspot.com',
    iosClientId: '251241889905-h1jlcn1svfv5qbv1ig54a44g15u3jpkp.apps.googleusercontent.com',
    iosBundleId: 'com.example.loginSignupApp.RunnerTests',
  );
}
