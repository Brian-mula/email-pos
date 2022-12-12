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
    apiKey: 'AIzaSyAlYjDfX-v0U1xdNic8AeOVocs8wzIvdyo',
    appId: '1:16773188266:web:f4748cbc7d9a82a134ded3',
    messagingSenderId: '16773188266',
    projectId: 'flutter-pos-e12d0',
    authDomain: 'flutter-pos-e12d0.firebaseapp.com',
    storageBucket: 'flutter-pos-e12d0.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBnwbjZTQUdTBsDrg8-kBaWzH9nGDD4VsY',
    appId: '1:16773188266:android:8c414c0ee0658c2834ded3',
    messagingSenderId: '16773188266',
    projectId: 'flutter-pos-e12d0',
    storageBucket: 'flutter-pos-e12d0.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBoqH6Uq6ktztZ2bAoxZYYrFxYkWMRvCfI',
    appId: '1:16773188266:ios:dedc147f44373ffb34ded3',
    messagingSenderId: '16773188266',
    projectId: 'flutter-pos-e12d0',
    storageBucket: 'flutter-pos-e12d0.appspot.com',
    androidClientId: '16773188266-d201cd3fk8gcjosfk1nrf5313di5g6q9.apps.googleusercontent.com',
    iosClientId: '16773188266-29mq5j5hj564fue2d9gmkn3gglhp9fh8.apps.googleusercontent.com',
    iosBundleId: 'com.example.emailpos',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBoqH6Uq6ktztZ2bAoxZYYrFxYkWMRvCfI',
    appId: '1:16773188266:ios:dedc147f44373ffb34ded3',
    messagingSenderId: '16773188266',
    projectId: 'flutter-pos-e12d0',
    storageBucket: 'flutter-pos-e12d0.appspot.com',
    androidClientId: '16773188266-d201cd3fk8gcjosfk1nrf5313di5g6q9.apps.googleusercontent.com',
    iosClientId: '16773188266-29mq5j5hj564fue2d9gmkn3gglhp9fh8.apps.googleusercontent.com',
    iosBundleId: 'com.example.emailpos',
  );
}