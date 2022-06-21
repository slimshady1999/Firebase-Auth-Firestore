import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

// RegisterAuh //

Future<bool> signupUser(String email, String password) async {
  try {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    return true;
  } on FirebaseAuthException catch (e) {
    if (e.code == "Weak Password") {
      if (kDebugMode) {
        print("Password is Weak");
      }
    } else if (e.code == "invalid EmailAddress") {
      if (kDebugMode) {
        print("Invalid Email address");
      }
      return false;
    }
  } catch (e) {
    if (kDebugMode) {
      print(e.toString);
    }
  }
  return false;
}

// Login Auth //

Future<bool> signinUser(String email, String password) async {
  try {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    return true;
  } on FirebaseAuthException catch (e) {
    if (e.code == "Weak Password") {
      if (kDebugMode) {
        print("Password is Weak");
      }
    } else if (e.code == "invalid EmailAddress") {
      if (kDebugMode) {
        print("Invalid Email address");
      }
      return false;
    }
  } catch (e) {
    if (kDebugMode) {
      print(e.toString);
    }
  }
  return false;
}
