import 'package:firebase_core/firebase_core.dart';
import 'package:firebaseauth/pages/signup.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
      const MaterialApp(debugShowCheckedModeBanner: false, home: SignupPage()));
}
