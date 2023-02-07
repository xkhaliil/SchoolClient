import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
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
    Future.delayed(const Duration(milliseconds: 2200), () {
      // user is logged in
      var currentUser = FirebaseAuth.instance.currentUser;

      // if (currentUser != null) {
        
      //     Navigator.pushNamedAndRemoveUntil(
      //         context, StudentList.routeName, (route) => false);
        
      // } else {
      //   Navigator.pushNamedAndRemoveUntil(
      //       context, OnBoarding.routeName, (route) => false);
      // }


      if (currentUser != null) {
  Navigator.pushAndRemoveUntil(
    context,
    PageRouteBuilder(
      transitionDuration: const Duration(milliseconds: 100),
      pageBuilder: (context, animation, secondaryAnimation) {
        return const StudentList();
      },
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
    ),
    (route) => false,
  );
} else {
  Navigator.pushAndRemoveUntil(
    context,
    PageRouteBuilder(
      transitionDuration: const Duration(milliseconds: 100),
      pageBuilder: (context, animation, secondaryAnimation) {
        return const OnBoarding();
      },
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
    ),
    (route) => false,
  );
}
    });
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              Stack(
                children: <Widget>[
                  Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                      width: 500.0,
                      height: 850,
                      child: 
                      Lottie.asset(
                  "video/133784-back-to-school.json"),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
