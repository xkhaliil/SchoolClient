import 'package:flutter/cupertino.dart';
import 'package:schoolclient/screens/home_screen/choosekid.dart';
import 'package:schoolclient/screens/home_screen/home-screen.dart';
import 'package:schoolclient/screens/login_screen/info-after.dart';
import 'package:schoolclient/screens/login_screen/login-screen2.dart';
import 'package:schoolclient/screens/login_screen/login_screen.dart';
import 'package:schoolclient/screens/splash-screen/splash_screen.dart';

Map<String,WidgetBuilder> routes = {
SplashScreen.routeName : (context) =>SplashScreen() ,
LoginScreen.routeName : (context) =>LoginScreen() ,
LoginScreen2.routeName : (context) =>LoginScreen2() ,
HomeScreen.routeName : (context) =>HomeScreen() ,
ChooseKid.routeName : (context) =>ChooseKid() ,
InfoAfter.routeName : (context) =>InfoAfter() ,
};