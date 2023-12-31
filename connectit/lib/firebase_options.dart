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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA09pdRWmnxy0b9v-xgkqxLda1eLG6elKo',
    appId: '1:305896379489:android:23f251543785a0e6db8620',
    messagingSenderId: '305896379489',
    projectId: 'connectit-dev',
    storageBucket: 'connectit-dev.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA3doFFJTQIjnmussMBUxEHTB3AXv7QODg',
    appId: '1:305896379489:ios:85ef6ef235be84d1db8620',
    messagingSenderId: '305896379489',
    projectId: 'connectit-dev',
    storageBucket: 'connectit-dev.appspot.com',
    androidClientId: '305896379489-fmr5nsoksbacj47nt07uunhltuhhv085.apps.googleusercontent.com',
    iosClientId: '305896379489-8abnt9ehvkoa0b32treiqfu0am3b0hje.apps.googleusercontent.com',
    iosBundleId: 'com.connectit.connectit',
  );
}
