import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:schoolclient/screens/administration_screen/create_screen.dart';
import 'package:schoolclient/screens/administration_screen/delete_screen.dart';
import 'package:schoolclient/screens/administration_screen/update_screen.dart';
import 'package:schoolclient/screens/login_screen/login.dart';

class AdminPage extends StatelessWidget {
  const AdminPage({Key? key}) : super(key: key);
  static String routeName = "AdminPage";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              backgroundColor: Color(0xFF222831),
              expandedHeight: 300.0,
              floating: false,
              pinned: true,
              stretch: true,
              automaticallyImplyLeading: false,
              flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  collapseMode: CollapseMode.parallax,
                  title: const Text("Espace Administration",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                      )),
                  background: Lottie.asset("video/bgadmin.json",
                    fit: BoxFit.cover,
                  )),
            ),
          ];
        },
        body: Column(
          children: [
            const SizedBox(height: 10),
            const SizedBox(height: 10),
            ListTile(
              leading: Lottie.asset("video/create.json"),
              title: const Text("Creation"),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                size: 14.0,
                color: Color(0xFFEEEEEE),
              ),
              onTap: () {
              Navigator.pushNamed(context, CreateScreen.routeName);
              },
            ),
            const SizedBox(height: 10),
            ListTile(
              leading: Lottie.asset("video/delete.json"),
              title: const Text("Suppresion"),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                size: 14.0,
                color: Color(0xFFEEEEEE),
              ),
              onTap: () {
                Navigator.pushNamed(context, DeleteScreen.routeName);
              },
            ),
            const SizedBox(height: 10),
            ListTile(
              leading: Lottie.asset("video/update.json"),
              title: const Text("Mettre a jour"),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                size: 14.0,
                color: Color(0xFFEEEEEE),
              ),
              onTap: () {
                Navigator.pushNamed(context, UpdateScreen.routeName);
              },
            ),
             const SizedBox(height: 100),
            ListTile(
              leading: Lottie.asset("video/logoutadmin.json"),
              title: const Text("Deconnexion"),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                size: 14.0,
                color: Color(0xFFEEEEEE),
              ),
              onTap: () {
                signOut();
               Navigator.pushNamedAndRemoveUntil(
                    context, Login.routeName, (route) => false);
              },
            ),
            
            
          ],
        ),
      ),
    );
  }
  Future<void> signOut() async {
  await FirebaseAuth.instance.signOut();
  FirebaseAuth.instance.userChanges().listen((User? user) {
    if (user == null) {
      print('User is currently signed out!');
    } else {
      print('User is signed in!');
    }
  });
}
}
