import 'package:flutter/cupertino.dart';
import 'package:schoolclient/screens/administration-screen/Create/addDocument.dart';
import 'package:schoolclient/screens/administration-screen/Create/addSubject.dart';
import 'package:schoolclient/screens/administration-screen/Create/addAccount.dart';
import 'package:schoolclient/screens/administration-screen/Create/addClass.dart';
import 'package:schoolclient/screens/administration-screen/Create/addHomework.dart';
import 'package:schoolclient/screens/administration-screen/Create/addNews.dart';
import 'package:schoolclient/screens/administration-screen/Create/addStudent.dart';
import 'package:schoolclient/screens/administration-screen/Delete/deleteAccount.dart';
import 'package:schoolclient/screens/administration-screen/Delete/deleteClass.dart';
import 'package:schoolclient/screens/administration-screen/Delete/deleteDocument.dart';
import 'package:schoolclient/screens/administration-screen/Delete/deleteHomework.dart';
import 'package:schoolclient/screens/administration-screen/Delete/deleteNews.dart';
import 'package:schoolclient/screens/administration-screen/Delete/deleteStudent.dart';
import 'package:schoolclient/screens/administration-screen/Delete/deleteSubject.dart';
import 'package:schoolclient/screens/administration-screen/Update/updateAccount.dart';
import 'package:schoolclient/screens/administration-screen/Update/updateClass.dart';
import 'package:schoolclient/screens/administration-screen/Update/updateDocument.dart';
import 'package:schoolclient/screens/administration-screen/Update/updateHomework.dart';
import 'package:schoolclient/screens/administration-screen/Update/updateNews.dart';
import 'package:schoolclient/screens/administration-screen/Update/updateStudent.dart';
import 'package:schoolclient/screens/administration-screen/Update/updateSubject.dart';
import 'package:schoolclient/screens/administration-screen/adminPage.dart';
import 'package:schoolclient/screens/administration-screen/createScreen.dart';
import 'package:schoolclient/screens/administration-screen/deleteScreen.dart';
import 'package:schoolclient/screens/administration-screen/updateScreen.dart';

import 'package:schoolclient/screens/student_list_screen/student_list.dart';
import 'package:schoolclient/screens/student_screen/cours_et_travaux/matiereScreen.dart';
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
  UpdateClass.routeName: (context) => const UpdateClass(),
  UpdateSubject.routeName: (context) => const UpdateSubject(),
  UpdateDocument.routeName: (context) => const UpdateDocument(),
  UpdateHomeWork.routeName: (context) => const UpdateHomeWork(),
  UpdateNews.routeName: (context) => const UpdateNews(),
};
