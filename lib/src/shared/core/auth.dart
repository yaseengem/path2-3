import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class AuthWorker {
  const AuthWorker();

  Future<int> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();

// Ideal time to initialize
    await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
        return 0;
      } else {
        print('User is signed in!');
        return 1;
      }
    });
    return 0;
//...
  }
}
