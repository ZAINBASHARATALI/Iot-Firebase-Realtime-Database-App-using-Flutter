// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars
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
    // ignore: missing_enum_constant_in_switch
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
    }

    throw UnsupportedError(
      'DefaultFirebaseOptions are not supported for this platform.',
    );
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAY_zz7PqKNHVLg1sVG9R1FsrWTj_twDMQ',
    appId: '1:1014785445692:android:52102778ff4c017da41839',
    messagingSenderId: '1014785445692',
    projectId: 'fyp-app-d2688',
    databaseURL: 'https://fyp-app-d2688-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'fyp-app-d2688.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAWbjlGQEnYjDVZlhCobMY4_s4RVUoXjtk',
    appId: '1:1014785445692:ios:5b6adb3f88e568cea41839',
    messagingSenderId: '1014785445692',
    projectId: 'fyp-app-d2688',
    databaseURL: 'https://fyp-app-d2688-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'fyp-app-d2688.appspot.com',
    iosClientId: '1014785445692-c35q6v5mg357mffs1q0kalhq6t63ous4.apps.googleusercontent.com',
    iosBundleId: 'com.example.fyp',
  );
}
