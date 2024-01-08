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

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDwHAE6jZYf4oFAXAFcegt4gfqFUEI39-w',
    appId: '1:945491701132:web:8a96bdba38df4711bb3aa9',
    messagingSenderId: '945491701132',
    projectId: 'cleanapp-a4fb0',
    authDomain: 'cleanapp-a4fb0.firebaseapp.com',
    storageBucket: 'cleanapp-a4fb0.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA6xsfFx9GKybPVWUMzby4XMP2owwgQsCA',
    appId: '1:945491701132:android:84c253d06c5e1bfcbb3aa9',
    messagingSenderId: '945491701132',
    projectId: 'cleanapp-a4fb0',
    storageBucket: 'cleanapp-a4fb0.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCQrKBBcZgSu3m0ADgjP_sDIOui7x3MYtU',
    appId: '1:945491701132:ios:10e4068f62691393bb3aa9',
    messagingSenderId: '945491701132',
    projectId: 'cleanapp-a4fb0',
    storageBucket: 'cleanapp-a4fb0.appspot.com',
    iosBundleId: 'com.example.cleanApp',
  );
}