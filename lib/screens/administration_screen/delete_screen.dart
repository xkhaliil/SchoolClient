import 'package:flutter/material.dart';
import 'package:schoolclient/screens/administration_screen/delete/delete_account.dart';
import 'package:schoolclient/screens/administration_screen/delete/delete_class.dart';
import 'package:schoolclient/screens/administration_screen/delete/delete_homework.dart';
import 'package:schoolclient/screens/administration_screen/delete/delete_news.dart';
import 'package:schoolclient/screens/administration_screen/delete/delete_student.dart';
import 'package:schoolclient/screens/administration_screen/delete/delete_subject.dart';


class DeleteScreen extends StatelessWidget {
  const DeleteScreen({Key? key}) : super(key: key);
  static String routeName = (DeleteScreen).toString();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text("Espace Suppresion")),
          backgroundColor: const Color(0xFF222831),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30),
            
            const Text(
              "    Suppression",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                
              ),
              
            ),

            // Children widget here
            const SizedBox(height: 10),
            const Divider(
              color: Colors.grey,
              height: 1,
              thickness: 1,
              indent: 10,
              endIndent: 10,
            ),
            // ignore: prefer_const_constructors
            ListTile(
              leading: const Icon(
                Icons.add,
                size: 55,
              ),
              
              title: const Text(
                "Supprimer un compte",
                textScaleFactor: 1.5,
              ),
              onTap: () {
                Navigator.pushNamed(context, DeleteAccount.routeName);
              },
              
            ),
            const SizedBox(height: 10),
            ListTile(
              leading: const Icon(
                Icons.add,
                size: 55,
              ),
              
              title: const Text(
                "Supprimer un éleve",
                textScaleFactor: 1.5,
              ),
              onTap: () {
                Navigator.pushNamed(context, DeleteStudent.routeName);
              },
            ),
            const SizedBox(height: 10),
            ListTile(
              leading: const Icon(
                Icons.add,
                size: 55,
              ),
              
              title: const Text(
                "Supprimer une classe",
                textScaleFactor: 1.5,
              ),
              onTap: () {
                Navigator.pushNamed(context, DeleteClass.routeName);
              },
            ),
            const SizedBox(height: 10),
            ListTile(
              leading: const Icon(
                Icons.add,
                size: 55,
              ),
              
              title: const Text(
                "Supprimer une matière",
                textScaleFactor: 1.5,
              ),
              onTap: () {
                Navigator.pushNamed(context, DeleteSubject.routeName);
              },
            ),
            const SizedBox(height: 10),
            ListTile(
              leading: const Icon(
                Icons.add,
                size: 55,
              ),
             
              title: const Text(
                "Supprimer un cours",
                textScaleFactor: 1.5,
              ),
              onTap: () {
                Navigator.pushNamed(context, deleteDocument.routeName);
              },
            ),
            const SizedBox(height: 10),
            ListTile(
              leading: const Icon(
                Icons.add,
                size: 55,
              ),
             
              title: const Text(
                "Supprimer un travail à domicile",
                textScaleFactor: 1.5,
              ),
              onTap: () {
                Navigator.pushNamed(context, DeleteHomeWork.routeName);
              },
            ),
            const SizedBox(height: 10),
            ListTile(
              leading: const Icon(
                Icons.add,
                size: 55,
              ),
              
              title: const Text(
                "Supprimer une annonces",
                textScaleFactor: 1.5,
              ),
              onTap: () {
                Navigator.pushNamed(context, DeleteNews.routeName);
              },
            ),
            
           
            
            
          ],
        ),
      ),
    );
  }
}
