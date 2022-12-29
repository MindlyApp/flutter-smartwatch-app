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
    apiKey: 'AIzaSyAevCOvt6rb_LOdtGEQ-VUT5dWD7viRDxg',
    appId: '1:556134750333:web:e0eef118ed4aae0d91b914',
    messagingSenderId: '556134750333',
    projectId: 'emotivate-c06b1',
    authDomain: 'emotivate-c06b1.firebaseapp.com',
    storageBucket: 'emotivate-c06b1.appspot.com',
    measurementId: 'G-WGHCCKTWXF',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDUrqn44UEefNFguaO4CngNKsH1J_iigqY',
    appId: '1:556134750333:android:24af47806f71baf991b914',
    messagingSenderId: '556134750333',
    projectId: 'emotivate-c06b1',
    storageBucket: 'emotivate-c06b1.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCzoSoyBojz6iTgN6gH3YvlkyLmvCgsgVk',
    appId: '1:556134750333:ios:4b3b35686aec09e591b914',
    messagingSenderId: '556134750333',
    projectId: 'emotivate-c06b1',
    storageBucket: 'emotivate-c06b1.appspot.com',
    iosClientId: '556134750333-38htjipd5885g2jsr540nejsg9k3aoo9.apps.googleusercontent.com',
    iosBundleId: 'io.mindstreamers.flutterSmartwatchApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCzoSoyBojz6iTgN6gH3YvlkyLmvCgsgVk',
    appId: '1:556134750333:ios:4b3b35686aec09e591b914',
    messagingSenderId: '556134750333',
    projectId: 'emotivate-c06b1',
    storageBucket: 'emotivate-c06b1.appspot.com',
    iosClientId: '556134750333-38htjipd5885g2jsr540nejsg9k3aoo9.apps.googleusercontent.com',
    iosBundleId: 'io.mindstreamers.flutterSmartwatchApp',
  );
}
