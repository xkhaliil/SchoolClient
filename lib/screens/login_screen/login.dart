import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:schoolclient/screens/administration-screen/admin_page.dart';

import 'package:schoolclient/screens/student_list_screen/student_list.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Login extends StatefulWidget {
  static String routeName = (Login).toString();

  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  // ignore: unused_field
  bool _loginAsAdmin = false;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final eliteEmail = "@elite.tn";
  final String adminUserUID = "";

  bool _isPasswordVisible = false;

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
      if (emailController.text == "1212" &&
          passwordController.text == "adminadmin") {
        _loginAsAdmin = true;
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: "${emailController.text}$eliteEmail",
          password: passwordController.text,
        );
        WidgetsBinding.instance.addPostFrameCallback((_) {
          Navigator.pop(context);
          Navigator.pushNamedAndRemoveUntil(
              context, AdminPage.routeName, (route) => false);
        });
      } else {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: "${emailController.text}$eliteEmail",
          password: passwordController.text,
        );
        WidgetsBinding.instance.addPostFrameCallback((_) {
          Navigator.pop(context);
          Navigator.pushNamedAndRemoveUntil(
              context, StudentList.routeName, (route) => false);
        });
      }
      // ignore: unused_catch_clause
    } on FirebaseAuthException catch (e) {
      // pop the loading circle
      Navigator.pop(context);
      // show error message
      Lottie.asset("");
      showErrorMessage();
    }
  }

  // error message to user
  void showErrorMessage() {
    showDialog(
      context: context,
      builder: (context) {
        // ignore: prefer_const_constructors
        return AlertDialog(
          backgroundColor: const Color(0xFF393E46),
          content: SizedBox(
            height: 100,
            child: Column(
              children: [
                Lottie.asset("video/error.json", height: 50),
                const SizedBox(height: 16),
                const Text("Impossible de se connecter"),
              ],
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
        backgroundColor: const Color(0xFF222831),
        body: Form(
          key: _formKey,
          child: Center(
            child: Card(
              color: const Color(0xFF393E46),
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
                              color: Color(0xFF00ADB5),
                              fontWeight: FontWeight.w900),
                          filled: true,
                          //<-- SEE HERE
                          fillColor: Color(0xFFF7F5EB),
                          hintText: 'Entrez votre numéro de téléphone',
                          prefixIcon: Icon(
                            Icons.phone,
                            color: Color(0xFF00ADB5),
                          ),
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(0xFF00ADB5), width: 2.0),
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
                            labelStyle: const TextStyle(
                                color: Color(0xFF00ADB5),
                                fontWeight: FontWeight.w900),
                            filled: true,
                            //<-- SEE HERE
                            fillColor: const Color(0xFFF7F5EB),
                            labelText: 'Mot de passe',
                            hintText: 'Entrez votre mot de passe',
                            prefixIcon: const Icon(
                              Icons.lock_outline_rounded,
                              color: Color(0xFF00ADB5),
                            ),
                            border: const OutlineInputBorder(),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xFF00ADB5), width: 2.0),
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
                            backgroundColor: const Color(0xFF00ADB5),
                          ),
                          onPressed: signUserIn,
                          child: const Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Text(
                              "S'authentifier",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                      _gap(),
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
