// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyCwOlLonkMY1wJAxvfxAokc0C_Ra_JZURk',
    appId: '1:1029565128403:web:7191a14656186fa2653e26',
    messagingSenderId: '1029565128403',
    projectId: 'babymonitor-60812',
    authDomain: 'babymonitor-60812.firebaseapp.com',
    databaseURL: 'https://babymonitor-60812-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'babymonitor-60812.appspot.com',
    measurementId: 'G-G1PRQP8TXB',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCcUo3oLH0TJStZpOzi46mfxWdkcsDxGWg',
    appId: '1:1029565128403:android:5945f7ede103cb42653e26',
    messagingSenderId: '1029565128403',
    projectId: 'babymonitor-60812',
    databaseURL: 'https://babymonitor-60812-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'babymonitor-60812.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC8AcqKn9Y1JfqvElSkScHYG-0xVqIx_0M',
    appId: '1:1029565128403:ios:546bebb37b1c297b653e26',
    messagingSenderId: '1029565128403',
    projectId: 'babymonitor-60812',
    databaseURL: 'https://babymonitor-60812-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'babymonitor-60812.appspot.com',
    iosBundleId: 'com.example.babyMonitoringApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC8AcqKn9Y1JfqvElSkScHYG-0xVqIx_0M',
    appId: '1:1029565128403:ios:546bebb37b1c297b653e26',
    messagingSenderId: '1029565128403',
    projectId: 'babymonitor-60812',
    databaseURL: 'https://babymonitor-60812-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'babymonitor-60812.appspot.com',
    iosBundleId: 'com.example.babyMonitoringApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCwOlLonkMY1wJAxvfxAokc0C_Ra_JZURk',
    appId: '1:1029565128403:web:60f7e966fd129abd653e26',
    messagingSenderId: '1029565128403',
    projectId: 'babymonitor-60812',
    authDomain: 'babymonitor-60812.firebaseapp.com',
    databaseURL: 'https://babymonitor-60812-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'babymonitor-60812.appspot.com',
    measurementId: 'G-RXNGVXD5LJ',
  );
}
