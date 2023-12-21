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
    apiKey: 'AIzaSyB0hCIMVhwF2HR23djthAmFmctVWAP5RiE',
    appId: '1:1039319991942:web:9e24602da842725a9ef307',
    messagingSenderId: '1039319991942',
    projectId: 'air-purifier-e1b0d',
    authDomain: 'air-purifier-e1b0d.firebaseapp.com',
    databaseURL: 'https://air-purifier-e1b0d-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'air-purifier-e1b0d.appspot.com',
    measurementId: 'G-QLS56H7Q5D',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBEq_0DKPet6klKasAX-cIW6sr2D6SULck',
    appId: '1:1039319991942:android:015b5c561c7d90369ef307',
    messagingSenderId: '1039319991942',
    projectId: 'air-purifier-e1b0d',
    databaseURL: 'https://air-purifier-e1b0d-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'air-purifier-e1b0d.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCXgAlakQcmc0qDiv_l0u2bWvmDM8mqWaU',
    appId: '1:1039319991942:ios:bd8a0b2339b9b0509ef307',
    messagingSenderId: '1039319991942',
    projectId: 'air-purifier-e1b0d',
    databaseURL: 'https://air-purifier-e1b0d-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'air-purifier-e1b0d.appspot.com',
    iosBundleId: 'com.example.airPurifier',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCXgAlakQcmc0qDiv_l0u2bWvmDM8mqWaU',
    appId: '1:1039319991942:ios:9ca5d48a02fdb75b9ef307',
    messagingSenderId: '1039319991942',
    projectId: 'air-purifier-e1b0d',
    databaseURL: 'https://air-purifier-e1b0d-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'air-purifier-e1b0d.appspot.com',
    iosBundleId: 'com.example.airPurifier.RunnerTests',
  );
}
