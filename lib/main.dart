import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:schoolclient/routes.dart';
import 'package:schoolclient/screens/login_screen/info-after.dart';
import 'package:schoolclient/screens/splash-screen/splash_screen.dart';

void main() {
  runApp(MyApp());
  }
class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: Color(0xFFF7F5EB),
        primaryColor:Color(0xFFF7F5EB),
      ),
      initialRoute: SplashScreen.routeName,
      routes: routes,
      
    );
  }
}