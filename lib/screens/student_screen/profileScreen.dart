import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
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

  void showAdmininfo() {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: const Color(0xFF393E46),
        content: SizedBox(
          height: 220,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "images/logo-eliteee.png",
                height: 100,
              ),
              const SizedBox(height: 16),
              const Text("Email : elite.mahdia@gmail.com"),
              const Text("Site web : ecole-elite.tn"),
              const Text("Numéro de téléphone: 97 277 372"),
              const Text("Adresse : Rue Kortoba cité Andalous"),
               const Text("derrière carrefour Mahdia, Mahdia, Tunisia",),
            ],
          ),
        ),
      );
    },
  );
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
                            colors: [Color(0xFFEEEEEE), Color(0xff222831)]),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        )),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: SizedBox(
                      width: 500,
                      height: 500,
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          Container(
                            decoration: const BoxDecoration(
                              color: Color.fromARGB(0, 0, 0, 0),
                              shape: BoxShape.circle,
                            ),
                            child: ClipOval(
                              child: Lottie.asset('video/profileIcon.json',
                              width: double.infinity,
            height: double.infinity,
                                  ),
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
                                    color: Color.fromARGB(0, 76, 175, 79),
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
                      "  ${student?.nom} ${student?.prenom} ",
                      style: Theme.of(context)
                          .textTheme
                          .headline6
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 16),
                    Text(studentClasse == null
                        ? ""
                        : "Classe : ${studentClasse?.nom}"),
                    Text(studentClasse == null
                        ? ""
                        : "Niveau : ${studentClasse?.niveau}"),
                    const SizedBox(height: 16),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FloatingActionButton.extended(
                          backgroundColor: const Color(0xFF00ADB5),
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              PageRouteBuilder(
                                transitionDuration: const Duration(milliseconds: 500),
                                pageBuilder: (_, animation, __) =>
                                    const StudentList(),
                                transitionsBuilder: (_, animation, __, child) =>
                                    SlideTransition(
                                  position: Tween<Offset>(
                                    begin: const Offset(1, 0),
                                    end: Offset.zero,
                                  ).animate(animation),
                                  child: child,
                                ),
                              ),
                            );
                          },
                          heroTag: "Changer l'étudiant ",
                          elevation: 0,
                          label: const Text("Changer l'étudiant"),
                          icon: const Icon(Icons.change_circle_rounded),
                        ),
                        const SizedBox(width: 16.0),
                        FloatingActionButton.extended(
                          onPressed: () {
                            signOut();
                            Navigator.pushNamedAndRemoveUntil(
                                context, Login.routeName, (route) => false);
                          },
                          heroTag: 'Déconnexion',
                          elevation: 0,
                          backgroundColor: Colors.red,
                          label: const Text("Déconnexion"),
                          icon: const Icon(Icons.logout),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30.0),
                    FloatingActionButton.extended(
                      onPressed: () {
                        showAdmininfo();
                      },
                      heroTag: "Contacter l'administration",
                      elevation: 0,
                      backgroundColor: const Color(0xFF03C988),
                      label: const Text("Contacter l'administration"),
                      icon: const Icon(Icons.contact_page),
                    ),
                    const SizedBox(height: 16),
                    Image.asset("images/logo-eliteee.png",height: 100,),
                    const Text("ELITE école primaire & collège pilote privé Mahdia")
                    
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
