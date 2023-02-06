import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:schoolclient/data/classe-source.dart';
import 'package:schoolclient/data/shared_preferences.dart';
import 'package:schoolclient/data/student-source.dart';
import 'package:schoolclient/model/Classe.dart';
import 'package:schoolclient/model/student.dart';
import 'package:schoolclient/screens/login_screen/login.dart';
import 'package:schoolclient/screens/student_list_screen/student_list.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Classe? studentClasse;
  Student? student;

  @override
  void initState() {
    super.initState();
    SharedPreferencesHelper.getSelectedStudentId()
        .then((studentId) => StudentSource().getStudentById(studentId))
        .then((student) {
      this.student = student;
      return ClasseSource().getClasseByStudent(student.classeID);
    }).then((studentClasse) {
      setState(() {
        this.studentClasse = studentClasse;
      });
    }, onError: (e) {
      print("erreur = $e");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              flex: 2,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 50),
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [Color(0xffA0C3D2), Color(0xffF7F5EB)]),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(50),
                          bottomRight: Radius.circular(50),
                        )),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: SizedBox(
                      width: 150,
                      height: 150,
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          Container(
                            decoration: const BoxDecoration(
                              color: Color.fromARGB(0, 160, 195, 210),
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage("images/login2.png")),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: CircleAvatar(
                              radius: 20,
                              backgroundColor:
                                  Theme.of(context).scaffoldBackgroundColor,
                              child: Container(
                                margin: const EdgeInsets.all(8.0),
                                decoration: const BoxDecoration(
                                    color: Colors.green,
                                    shape: BoxShape.circle),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      "${student?.nom} ${student?.prenom} ",
                      style: Theme.of(context)
                          .textTheme
                          .headline6
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 16),
                    Text(studentClasse == null
                        ? ""
                        : "Classe : ${studentClasse?.nom}"),
                    Text(studentClasse == null
                        ? ""
                        : "Niveau : ${studentClasse?.niveau}"),
                    SizedBox(height: 16),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FloatingActionButton.extended(
                          backgroundColor: Color(0xFFA0C3D2),
                          onPressed: () {
                            Navigator.pop(context, StudentList.routeName);
                          },
                          heroTag: 'Changer eleve ',
                          elevation: 0,
                          label: const Text("Changer eleve"),
                          icon: const Icon(Icons.change_circle_rounded),
                        ),
                        const SizedBox(width: 16.0),
                        FloatingActionButton.extended(
                          onPressed: () {
                            signOut();
                            Navigator.pushNamedAndRemoveUntil(
                                context, Login.routeName, (route) => false);
                          },
                          heroTag: 'deconnexion',
                          elevation: 0,
                          backgroundColor: Color(0xFFEAC7C7),
                          label: const Text("deconnexion"),
                          icon: const Icon(Icons.logout),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    // Text(studentClasse!.nom),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
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
