import 'package:flutter/material.dart';
import 'package:schoolclient/screens/administration-screen/Create/addDocument.dart';
import 'package:schoolclient/screens/administration-screen/Create/addSubject.dart';
import 'package:schoolclient/screens/administration-screen/Create/addAccount.dart';
import 'package:schoolclient/screens/administration-screen/Create/addClass.dart';
import 'package:schoolclient/screens/administration-screen/Create/addHomework.dart';
import 'package:schoolclient/screens/administration-screen/Create/addNews.dart';
import 'package:schoolclient/screens/administration-screen/Create/addStudent.dart';
import 'package:schoolclient/screens/login_screen/login.dart';

class CreateScreen extends StatelessWidget {
  const CreateScreen({Key? key}) : super(key: key);
  static String routeName = (CreateScreen).toString();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text("Espace Creation")),
          backgroundColor: const Color(0xFF222831),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30),
            
            const Text(
              "    Creation",
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
                "Création d'un compte",
                textScaleFactor: 1.5,
              ),
              onTap: () {
                Navigator.pushNamed(context, AddAccount.routeName);
              },
              
            ),
            const SizedBox(height: 10),
            ListTile(
              leading: const Icon(
                Icons.add,
                size: 55,
              ),
              
              title: const Text(
                "Ajouter un élève à un compte",
                textScaleFactor: 1.5,
              ),
              onTap: () {
                Navigator.pushNamed(context, AddStudent.routeName);
              },
            ),
            const SizedBox(height: 10),
            ListTile(
              leading: const Icon(
                Icons.add,
                size: 55,
              ),
              
              title: const Text(
                "Ajouter une classe",
                textScaleFactor: 1.5,
              ),
              onTap: () {
                Navigator.pushNamed(context, AddClass.routeName);
              },
            ),
            const SizedBox(height: 10),
            ListTile(
              leading: const Icon(
                Icons.add,
                size: 55,
              ),
              
              title: const Text(
                "Ajouter des matières à une classe",
                textScaleFactor: 1.5,
              ),
              onTap: () {
                Navigator.pushNamed(context, AddSubject.routeName);
              },
            ),
            const SizedBox(height: 10),
            ListTile(
              leading: const Icon(
                Icons.add,
                size: 55,
              ),
             
              title: const Text(
                "Ajouter des cours",
                textScaleFactor: 1.5,
              ),
              onTap: () {
                Navigator.pushNamed(context, AddDocument.routeName);
              },
            ),
            const SizedBox(height: 10),
            ListTile(
              leading: const Icon(
                Icons.add,
                size: 55,
              ),
             
              title: const Text(
                "Ajouter un travail à domicile",
                textScaleFactor: 1.5,
              ),
              onTap: () {
                Navigator.pushNamed(context, AddHomeWork.routeName);
              },
            ),
            const SizedBox(height: 10),
            ListTile(
              leading: const Icon(
                Icons.add,
                size: 55,
              ),
              
              title: const Text(
                "Ajouter des annonces",
                textScaleFactor: 1.5,
              ),
              onTap: () {
                Navigator.pushNamed(context, AddNews.routeName);
              },
            ),
            
           
            
            
          ],
        ),
      ),
    );
  }
}
