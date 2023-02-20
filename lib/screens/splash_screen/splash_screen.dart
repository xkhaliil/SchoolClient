import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:schoolclient/screens/administration_screen/admin_page.dart';
import 'package:schoolclient/screens/student_list_screen/student_list.dart';
import 'package:schoolclient/screens/login_screen/on_boarding.dart';

class SplashScreen extends StatelessWidget {
  static String routeName = '/';

  // ignore: non_constant_identifier_names
  

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
        if(currentUser.email?.startsWith("1212") ?? false){
          Navigator.pushAndRemoveUntil(
          context,
          PageRouteBuilder(
            transitionDuration: const Duration(milliseconds: 100),
            pageBuilder: (context, animation, secondaryAnimation) {
              return const AdminPage();
            },
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
          ),
          (route) => false,
        );
        }else {Navigator.pushAndRemoveUntil(
          context,
          PageRouteBuilder(
            transitionDuration: const Duration(milliseconds: 100),
            pageBuilder: (context, animation, secondaryAnimation) {
              return const StudentList();
            },
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
          ),
          (route) => false,
        );}
        
      } else {
        Navigator.pushAndRemoveUntil(
          context,
          PageRouteBuilder(
            transitionDuration: const Duration(milliseconds: 100),
            pageBuilder: (context, animation, secondaryAnimation) {
              return const OnBoarding();
            },
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
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
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                children: <Widget>[
                  Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                      child: Lottie.asset(
                        "video/133784_back_to_school.json",
                      ),
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
