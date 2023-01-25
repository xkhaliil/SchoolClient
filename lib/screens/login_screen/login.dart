// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:schoolclient/screens/student_list_screen/student-list.dart';
import 'package:schoolclient/screens/login_screen/onBoarding.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Login extends StatefulWidget {
  static String routeName = 'Login';

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _isPasswordVisible = false;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final eliteEmail="@elite.tn";

  void signUserIn() async {
    // show loading circle
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    // try sign in
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: "${emailController.text}$eliteEmail",
        password: passwordController.text,
      );

      // pop the loading circle

      Navigator.pop(context);

      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => StudentList())
      );
    } on FirebaseAuthException catch (e) {
      // pop the loading circle
      Navigator.pop(context);
      // show error message
      showErrorMessage("Impossible de se connecter");
    }
  }

  // error message to user
  void showErrorMessage(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Color(0xFFA0C3D2),
          title: Center(
            child: Text(
              message,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Form(
          key: _formKey,
          child: Center(
            child: Card(
              color: Color(0xFFEAE0DA),
              elevation: 8,
              child: Container(
                padding: const EdgeInsets.all(32.0),
                constraints: const BoxConstraints(maxWidth: 350),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Lottie.asset("video/rasyethareklogin.json", height: 120),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Center(
                          child: Text(
                            "Bienvenue",
                            style: Theme.of(context).textTheme.headline5,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          "Entrez le numéro de téléphone et le mot de passe.",
                          style: Theme.of(context).textTheme.caption,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      _gap(),
                      TextFormField(
                        controller: emailController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Entrez le numéro';
                          }

                          return null;
                        },
                        decoration: const InputDecoration(
                          labelText: 'Téléphone',
                          labelStyle: TextStyle(
                              color: Color(0xFFA0C3D2),
                              fontWeight: FontWeight.w900),
                          filled: true, //<-- SEE HERE
                          fillColor: Color(0xFFF7F5EB),
                          hintText: 'Entrez votre numéro de téléphone',
                          prefixIcon: Icon(
                            Icons.phone,
                            color: Color(0xFFA0C3D2),
                          ),
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(0xFFA0C3D2), width: 2.0),
                          ),
                        ),
                      ),
                      _gap(),
                      TextFormField(
                        controller: passwordController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Entrez votre mot de passe ';
                          }

                          return null;
                        },
                        obscureText: !_isPasswordVisible,
                        decoration: InputDecoration(
                            labelStyle: TextStyle(
                                color: Color(0xFFA0C3D2),
                                fontWeight: FontWeight.w900),
                            filled: true, //<-- SEE HERE
                            fillColor: Color(0xFFF7F5EB),
                            labelText: 'Mot de passe',
                            hintText: 'Entrez votre mot de passe',
                            prefixIcon: const Icon(
                              Icons.lock_outline_rounded,
                              color: Color(0xFFA0C3D2),
                            ),
                            border: const OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xFFA0C3D2), width: 2.0),
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(_isPasswordVisible
                                  ? Icons.visibility_off
                                  : Icons.visibility),
                              onPressed: () {
                                setState(() {
                                  _isPasswordVisible = !_isPasswordVisible;
                                });
                              },
                            )),
                      ),
                      _gap(),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(7)),
                            backgroundColor: Color(0xFFA0C3D2),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Text(
                              "s'authentifier",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ),
                          onPressed: signUserIn,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _gap() => const SizedBox(height: 16);
}
