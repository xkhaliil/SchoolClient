import 'package:flutter/cupertino.dart';
import 'package:schoolclient/screens/student_list_screen/student-list.dart';
import 'package:schoolclient/screens/student_screen/student-screen.dart';

import 'package:schoolclient/screens/login_screen/onBoarding.dart';
import 'package:schoolclient/screens/login_screen/login.dart';

import 'package:schoolclient/screens/splash-screen/splash_screen.dart';

Map<String,WidgetBuilder> routes = {
SplashScreen.routeName : (context) =>SplashScreen() ,
Login.routeName : (context) =>Login() ,
StudentScreen.routeName : (context) =>StudentScreen() ,
StudentList.routeName : (context) =>StudentList() ,
OnBoarding.routeName : (context) =>OnBoarding() ,

};