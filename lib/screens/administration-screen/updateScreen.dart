import 'package:flutter/material.dart';


import 'package:schoolclient/screens/administration-screen/Update/updateAccount.dart';
import 'package:schoolclient/screens/administration-screen/Update/updateClass.dart';
import 'package:schoolclient/screens/administration-screen/Update/updateDocument.dart';
import 'package:schoolclient/screens/administration-screen/Update/updateHomework.dart';
import 'package:schoolclient/screens/administration-screen/Update/updateNews.dart';
import 'package:schoolclient/screens/administration-screen/Update/updateStudent.dart';
import 'package:schoolclient/screens/administration-screen/Update/updateSubject.dart';

class UpdateScreen extends StatelessWidget {
  const UpdateScreen({Key? key}) : super(key: key);
  static String routeName = (UpdateScreen).toString();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text("Espace de mise a jour")),
          backgroundColor: const Color(0xFF222831),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30),
            
            const Text(
              "    Mettre a jour",
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
                "mettre a jour un compte",
                textScaleFactor: 1.5,
              ),
              onTap: () {
                Navigator.pushNamed(context, UpdateAccount.routeName);
              },
              
            ),
            const SizedBox(height: 10),
            ListTile(
              leading: const Icon(
                Icons.add,
                size: 55,
              ),
              
              title: const Text(
                "mettre a jour un éleve",
                textScaleFactor: 1.5,
              ),
              onTap: () {
                Navigator.pushNamed(context, UpdateStudent.routeName);
              },
            ),
            const SizedBox(height: 10),
            ListTile(
              leading: const Icon(
                Icons.add,
                size: 55,
              ),
              
              title: const Text(
                "mettre a jour une classe",
                textScaleFactor: 1.5,
              ),
              onTap: () {
                Navigator.pushNamed(context, UpdateClass.routeName);
              },
            ),
            const SizedBox(height: 10),
            ListTile(
              leading: const Icon(
                Icons.add,
                size: 55,
              ),
              
              title: const Text(
                "mettre a jour une matière",
                textScaleFactor: 1.5,
              ),
              onTap: () {
                Navigator.pushNamed(context, UpdateSubject.routeName);
              },
            ),
            const SizedBox(height: 10),
            ListTile(
              leading: const Icon(
                Icons.add,
                size: 55,
              ),
             
              title: const Text(
                "mettre a jour un cours",
                textScaleFactor: 1.5,
              ),
              onTap: () {
                Navigator.pushNamed(context, UpdateDocument.routeName);
              },
            ),
            const SizedBox(height: 10),
            ListTile(
              leading: const Icon(
                Icons.add,
                size: 55,
              ),
             
              title: const Text(
                "mettre a jour un travail à domicile",
                textScaleFactor: 1.5,
              ),
              onTap: () {
                Navigator.pushNamed(context, UpdateHomeWork.routeName);
              },
            ),
            const SizedBox(height: 10),
            ListTile(
              leading: const Icon(
                Icons.add,
                size: 55,
              ),
              
              title: const Text(
                "mettre a jour une annonces",
                textScaleFactor: 1.5,
              ),
              onTap: () {
                Navigator.pushNamed(context, UpdateNews.routeName);
              },
            ),
            
           
            
            
          ],
        ),
      ),
    );
  }
}
