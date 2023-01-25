

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:schoolclient/screens/student_list_screen/student-list.dart';

import 'package:schoolclient/screens/login_screen/onBoarding.dart';
class SplashScreen extends StatelessWidget {
static String routeName = '/';

  @override
  Widget build(BuildContext context) {
    //this is the delay then the next route 
    Future.delayed(Duration(seconds: 5), () {
      // user is logged in
          var currentUser = FirebaseAuth.instance.currentUser;

          if (currentUser != null) {
            print(currentUser.uid);
            Navigator.pushNamedAndRemoveUntil(
                context, StudentList.routeName, (route) => false);
          } else {
            Navigator.pushNamedAndRemoveUntil(
                context, OnBoarding.routeName, (route) => false);
          }
    });
    return  SafeArea(
          child: Scaffold(
            body: Center(
              child: Column(
                    children: [
                      Container(
                       height: 509,
                       width: 300,
                      
                        child:Lottie.asset("video/133784-back-to-school.json",), 
                      ),
                      Container(
                       
                        width: 150,
                        height: 150,
                        child: Image(image: AssetImage("images/logo-eliteee.png",)),
                      )
                    ],
                  ),
            ),
            ),
            
              
              
           
          
         
        
        
    );
    
  }
}