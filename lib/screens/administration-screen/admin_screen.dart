import 'package:flutter/material.dart';

class AdminPage extends StatelessWidget {
  const AdminPage({Key? key}) : super(key: key);
  static String routeName=(AdminPage).toString();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ListTile(
            leading: const Icon(
              Icons.supervisor_account,
              size: 55,
            ),
            subtitle: const Text("ss"),
            iconColor: const Color(0xFFEAC7C7),
            tileColor: const Color(0xFFA0C3D2),
            title: Text(
              "add account",
              textScaleFactor: 1.5,
            ),
            onTap:() {
              
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.manage_accounts,
              size: 55,
            ),
            subtitle: const Text("ss"),
            iconColor: const Color(0xFFEAC7C7),
            tileColor: const Color(0xFFA0C3D2),
            title: Text(
              "add account",
              textScaleFactor: 1.5,
            ),
            onTap:() {
              
            },
          ),
        ],
      ),
      

      
    );
  }
}
