import 'package:flutter/material.dart';
import 'package:schoolclient/screens/administration-screen/addAccount.dart';
import 'package:schoolclient/screens/administration-screen/addStudent.dart';
import 'package:schoolclient/screens/login_screen/login.dart';

class AdminPage extends StatelessWidget {
  const AdminPage({Key? key}) : super(key: key);
  static String routeName = (AdminPage).toString();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text("espace administration")),
          backgroundColor: const Color(0xFF86C8BC),
        ),
        body: Column(
          children: [
            // ignore: prefer_const_constructors
            ListTile(
              leading: const Icon(
                Icons.supervisor_account,
                size: 55,
              ),
              subtitle: const Text("ss"),
              title: const Text(
                "add account",
                textScaleFactor: 1.5,
              ),
              onTap: () {
                Navigator.pushNamed(context, AddAccount.routeName);
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.supervisor_account,
                size: 55,
              ),
              subtitle: const Text("ss"),
              title: const Text(
                "add student to account",
                textScaleFactor: 1.5,
              ),
              onTap: () {Navigator.pushNamed(context, AddStudent.routeName);},
            ),
            ListTile(
              leading: const Icon(
                Icons.supervisor_account,
                size: 55,
              ),
              subtitle: const Text("ss"),
              title: const Text(
                "add class",
                textScaleFactor: 1.5,
              ),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(
                Icons.supervisor_account,
                size: 55,
              ),
              subtitle: const Text("ss"),
              title: const Text(
                "add subjects to a class",
                textScaleFactor: 1.5,
              ),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(
                Icons.manage_accounts,
                size: 55,
              ),
              subtitle: const Text("ss"),
              title: const Text(
                "add cours",
                textScaleFactor: 1.5,
              ),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(
                Icons.manage_accounts,
                size: 55,
              ),
              subtitle: const Text("ss"),
              title: const Text(
                "add annonces",
                textScaleFactor: 1.5,
              ),
              onTap: () {},
            ),
            MaterialButton(
              height: 50,
              color: const Color(0xFF86C8BC),
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(context,Login.routeName, (route) => false);
                
              },
              child: const Text("Deconnexion"),
            )
          ],
        ),
      ),
    );
  }
}
