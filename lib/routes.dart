import 'package:flutter/cupertino.dart';
import 'package:schoolclient/screens/administration-screen/Create/addDocument.dart';
import 'package:schoolclient/screens/administration-screen/Create/addSubject.dart';
import 'package:schoolclient/screens/administration-screen/Create/addAccount.dart';
import 'package:schoolclient/screens/administration-screen/Create/addClass.dart';
import 'package:schoolclient/screens/administration-screen/Create/addHomework.dart';
import 'package:schoolclient/screens/administration-screen/Create/addNews.dart';
import 'package:schoolclient/screens/administration-screen/Create/addStudent.dart';
import 'package:schoolclient/screens/administration-screen/adminPage.dart';
import 'package:schoolclient/screens/administration-screen/CreateScreen.dart';

import 'package:schoolclient/screens/student_list_screen/student_list.dart';
import 'package:schoolclient/screens/student_screen/cours_et_travaux/matierePage.dart';
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
  CreateScreen.routeName: (context) => const CreateScreen(),

  AddAccount.routeName: (context) => const AddAccount(),
  AddStudent.routeName: (context) => const AddStudent(),
  AddClass.routeName: (context) => const AddClass(),
  AddSubject.routeName: (context) => const AddSubject(),
  AddDocument.routeName: (context) => const AddDocument(),
  AddHomeWork.routeName: (context) => const AddHomeWork(),
  AddNews.routeName: (context) => const AddNews(),
  AdminPage.routeName: (context) => const AdminPage(),
  MatierePage.routeName: (context) => const MatierePage(),

};
