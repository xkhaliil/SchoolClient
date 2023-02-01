import 'package:flutter/cupertino.dart';
import 'package:schoolclient/screens/administration-screen/addAccount.dart';
import 'package:schoolclient/screens/administration-screen/addStudent.dart';
import 'package:schoolclient/screens/administration-screen/admin_screen.dart';
import 'package:schoolclient/screens/login_screen/login_admin.dart';
import 'package:schoolclient/screens/student_list_screen/student_list.dart';
import 'package:schoolclient/screens/student_screen/student_screen.dart';
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
  LoginAdmin.routeName: (context) => const LoginAdmin(),
  AddAccount.routeName: (context) => const AddAccount(),
  AddStudent.routeName:(context) => const AddStudent(),
};
