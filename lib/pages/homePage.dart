import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebaseauth/pages/loginpage.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  String emailTextController;
  String passwordTextController;
  HomePage(
      {super.key,
      required this.emailTextController,
      required this.passwordTextController});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(emailTextController,
              style: const TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.w900)),
          const SizedBox(height: 20),
          Text(passwordTextController,
              style: const TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.w900)),
          const SizedBox(height: 30),

          // Logout Button //

          Container(
            height: 45,
            width: 140,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.circular(13),
            ),
            child: Material(
              borderRadius: BorderRadius.circular(13),
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(13),
                onTap: () async {
                  await FirebaseAuth.instance.signOut().then((value) =>
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                              builder: (context) => const LoginPage()),
                          (route) => false));
                },
                child: const Center(
                  child: Text("Log out",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w400)),
                ),
              ),
            ),
          ),
        ])));
  }
}
