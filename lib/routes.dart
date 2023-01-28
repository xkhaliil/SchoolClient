import 'package:flutter/cupertino.dart';
import 'package:schoolclient/screens/administration-screen/admin_screen.dart';
import 'package:schoolclient/screens/student_list_screen/student-list.dart';
import 'package:schoolclient/screens/student_screen/student-screen.dart';
import 'package:schoolclient/screens/login_screen/onBoarding.dart';
import 'package:schoolclient/screens/login_screen/login.dart';
import 'package:schoolclient/screens/splash-screen/splash_screen.dart';

Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => const SplashScreen(),
  Login.routeName: (context) => const Login(),
  StudentScreen.routeName: (context) => const StudentScreen(),
  StudentList.routeName: (context) => const StudentList(),
  OnBoarding.routeName: (context) => const OnBoarding(),
  AdminPage.routeName: (context) => const AdminPage(),
};
