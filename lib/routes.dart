import 'package:flutter/cupertino.dart';
import 'package:schoolclient/screens/administration_screen/create/add_document.dart';
import 'package:schoolclient/screens/administration_screen/create/add_subject.dart';
import 'package:schoolclient/screens/administration_screen/create/add_account.dart';
import 'package:schoolclient/screens/administration_screen/create/add_class.dart';
import 'package:schoolclient/screens/administration_screen/create/add_homework.dart';
import 'package:schoolclient/screens/administration_screen/create/add_news.dart';
import 'package:schoolclient/screens/administration_screen/create/add_student.dart';
import 'package:schoolclient/screens/administration_screen/delete/delete_account.dart';
import 'package:schoolclient/screens/administration_screen/delete/delete_class.dart';
import 'package:schoolclient/screens/administration_screen/delete/delete_document.dart';
import 'package:schoolclient/screens/administration_screen/delete/delete_homework.dart';
import 'package:schoolclient/screens/administration_screen/delete/delete_news.dart';
import 'package:schoolclient/screens/administration_screen/delete/delete_student.dart';
import 'package:schoolclient/screens/administration_screen/delete/delete_subject.dart';
import 'package:schoolclient/screens/administration_screen/update/update_account.dart';

import 'package:schoolclient/screens/administration_screen/update/update_student.dart';

import 'package:schoolclient/screens/administration_screen/admin_page.dart';
import 'package:schoolclient/screens/administration_screen/create_screen.dart';
import 'package:schoolclient/screens/administration_screen/delete_screen.dart';
import 'package:schoolclient/screens/administration_screen/update_screen.dart';

import 'package:schoolclient/screens/student_list_screen/student_list.dart';
import 'package:schoolclient/screens/student_screen/cours_et_travaux/matiere_screen.dart';
import 'package:schoolclient/screens/student_screen/student_screen.dart';
import 'package:schoolclient/screens/login_screen/on_boarding.dart';
import 'package:schoolclient/screens/login_screen/login.dart';
import 'package:schoolclient/screens/splash_screen/splash_screen.dart';

Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => const SplashScreen(),
  Login.routeName: (context) => const Login(),
  StudentScreen.routeName: (context) => const StudentScreen(),
  StudentList.routeName: (context) => const StudentList(),
  OnBoarding.routeName: (context) => const OnBoarding(),
  MatierePage.routeName: (context) => const MatierePage(),
  AdminPage.routeName: (context) => const AdminPage(),
  //creation
  CreateScreen.routeName: (context) => const CreateScreen(),
  AddAccount.routeName: (context) => const AddAccount(),
  AddStudent.routeName: (context) => const AddStudent(),
  AddClass.routeName: (context) => const AddClass(),
  AddSubject.routeName: (context) => const AddSubject(),
  AddDocument.routeName: (context) => const AddDocument(),
  AddHomeWork.routeName: (context) => const AddHomeWork(),
  AddNews.routeName: (context) => const AddNews(),

  //supprimer
  DeleteScreen.routeName: (context) => const DeleteScreen(),
  DeleteAccount.routeName: (context) => const DeleteAccount(),
  DeleteStudent.routeName: (context) => const DeleteStudent(),
  DeleteClass.routeName: (context) => const DeleteClass(),
  DeleteSubject.routeName: (context) => const DeleteSubject(),
  DeleteDocument.routeName: (context) => const DeleteDocument(),
  DeleteHomeWork.routeName: (context) => const DeleteHomeWork(),
  DeleteNews.routeName: (context) => const DeleteNews(),

  //Modifier
  UpdateScreen.routeName: (context) => const UpdateScreen(),
  UpdateAccount.routeName: (context) => const UpdateAccount(),
  UpdateStudent.routeName: (context) => const UpdateStudent(),
};
