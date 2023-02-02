import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:schoolclient/screens/administration-screen/CreateScreen.dart';
import 'package:schoolclient/screens/student_list_screen/student_list.dart';
import 'package:schoolclient/screens/login_screen/onBoarding.dart';

class SplashScreen extends StatelessWidget {
  static String routeName = '/';
  // ignore: non_constant_identifier_names
  final String AdminUID = "GH3IlKXyYWZcDVB4qETtRB4L3Df2";

  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //this is the delay then the next route
    Future.delayed(const Duration(seconds: 3), () {
      // user is logged in
      var currentUser = FirebaseAuth.instance.currentUser;

      // if (currentUser.uid == AdminUID) {
      //   Navigator.pushNamedAndRemoveUntil(
      //       context, AdminPage.routeName, (route) => false);
      // } else
       if (currentUser != null) {
       
        Navigator.pushNamedAndRemoveUntil(
            context, StudentList.routeName, (route) => false);
      } else {
        Navigator.pushNamedAndRemoveUntil(
            context, OnBoarding.routeName, (route) => false);
      }
    });
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              SizedBox(
                height: 509,
                width: 300,
                child: Lottie.asset(
                  "video/133784-back-to-school.json",
                ),
              ),
              const SizedBox(
                width: 150,
                height: 150,
                child: Image(
                    image: AssetImage(
                  "images/logo-eliteee.png",
                )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
