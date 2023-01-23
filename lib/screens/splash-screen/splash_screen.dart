

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:schoolclient/screens/login_screen/info-after.dart';
class SplashScreen extends StatelessWidget {
static String routeName = 'SplashScreen';

  @override
  Widget build(BuildContext context) {
    //this is the delay then the next route 
    Future.delayed(Duration(seconds: 5), () {
      Navigator.pushNamedAndRemoveUntil(context, InfoAfter.routeName, (route) => false);
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