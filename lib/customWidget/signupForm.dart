import 'package:flutter/material.dart';

import '../firebaseHelper/firebaseHelper.dart';
import '../pages/homePage.dart';
import '../pages/loginpage.dart';

final formKey = GlobalKey<FormState>();
final TextEditingController _emailTextController = TextEditingController();
final TextEditingController _passwordTextController = TextEditingController();
signupForm(BuildContext context) {
  return Form(
    key: formKey,
    child: Column(
      children: [
        // Email TextField //

        Padding(
          padding: const EdgeInsets.all(12.0),
          child: TextFormField(
            controller: _emailTextController,
            keyboardType: TextInputType.emailAddress,
            style: const TextStyle(
                fontSize: 14, color: Colors.black, fontWeight: FontWeight.w500),
            decoration: InputDecoration(
                label: const Text("Email"),
                labelStyle: const TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.w400),
                fillColor: Colors.white,
                filled: true,
                floatingLabelAlignment: FloatingLabelAlignment.center,
                prefixIcon: Icon(Icons.email),
                prefixIconColor: Colors.red,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                )),
          ),
        ),
        const SizedBox(height: 10),

        // Passowrd TextForm //

        Padding(
          padding: const EdgeInsets.all(12.0),
          child: TextFormField(
            controller: _passwordTextController,
            obscureText: true,
            keyboardType: TextInputType.text,
            style: const TextStyle(
                fontSize: 14, color: Colors.black, fontWeight: FontWeight.w500),
            decoration: InputDecoration(
                label: const Text("Password"),
                filled: true,
                labelStyle: const TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.w400),
                fillColor: Colors.white,
                floatingLabelAlignment: FloatingLabelAlignment.center,
                prefixIcon: const Icon(Icons.security),
                prefixIconColor: Colors.black,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                )),
          ),
        ),

        const SizedBox(height: 9),

        // Button //

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
                bool isValidated = await signupUser(
                    _emailTextController.text, _passwordTextController.text);
                if (isValidated) {
                  // ignore: use_build_context_synchronously
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                          builder: (context) => HomePage(
                              emailTextController: _emailTextController.text,
                              passwordTextController:
                                  _passwordTextController.text)),
                      (route) => false);
                }
              },
              child: const Center(
                child: Text("Sign Up",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w400)),
              ),
            ),
          ),
        ),

        const SizedBox(height: 20),

        // Already have an account section //

        Container(
          height: 50,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Have an account?",
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w400)),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                          builder: (context) => const LoginPage()),
                      (route) => false);
                },
                child: const Text("Login",
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.red,
                        fontWeight: FontWeight.w500)),
              )
            ],
          ),
        )
      ],
    ),
  );
}
