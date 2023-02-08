import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:schoolclient/data/annonce-source.dart';
import 'package:schoolclient/data/matiere-source.dart';
import 'package:schoolclient/data/shared_preferences.dart';
import 'package:schoolclient/data/student-source.dart';
import 'package:schoolclient/data/travail-source.dart';
import 'package:schoolclient/model/Classe.dart';
import 'package:schoolclient/model/annonce.dart';
import 'package:schoolclient/model/matiere.dart';
import 'package:schoolclient/model/travail.dart';
import 'package:schoolclient/screens/student_screen/cours_et_travaux/coursScreen.dart';
import 'package:schoolclient/screens/student_screen/annoncesScreen.dart';
import 'package:schoolclient/screens/student_screen/profileScreen.dart';
import 'package:schoolclient/screens/student_screen/travauxScreen.dart';

class StudentScreen extends StatefulWidget {
  static String routeName = (StudentScreen).toString();

  const StudentScreen({super.key});

  @override
  State<StudentScreen> createState() => _StudentScreenState();
}

class _StudentScreenState extends State<StudentScreen> {
  List<Annonce> annonceList = List.empty();
  Classe? studentClasse;
  List<Travail> travailList = List.empty();
  List<Matiere> matiereList = List.empty();

  @override
  @mustCallSuper
  void initState() {
    super.initState();
    getAnnonces();
    getMatieres();
    getTravaux();
  }

  void getAnnonces() {
    AnnonceSource().getAnnonceList().then((annonceList) {
      setState(() {
        this.annonceList = annonceList;
      });
    });
  }

  void getMatieres() {
    SharedPreferencesHelper.getSelectedStudentId()
        .then((studentId) => StudentSource().getStudentById(studentId))
        .then((student) =>
            MatiereSource().getMatiereListByClasse(student.classeID))
        .then((matiereList) {
      setState(() {
        this.matiereList = matiereList;
      });
    });
  }

  void getTravaux() {
    SharedPreferencesHelper.getSelectedStudentId()
        .then((studentId) => StudentSource().getStudentById(studentId))
        .then((student) =>
            TravailSource().getTravailListByClasse(student.classeID))
        .then((travailList) {
      setState(() {
        this.travailList = travailList;
      });
    });
  }

  @override
  Widget build(BuildContext context) => SafeArea(
        child: DefaultTabController(
          length: 4,
          child: Scaffold(
            body: NestedScrollView(
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                return <Widget>[
                  SliverAppBar(
                    backgroundColor: Color(0xFFEEEEEE),
                    expandedHeight: 50.0,
                    centerTitle: true,
                    floating: false,
                    pinned: true,
                    automaticallyImplyLeading: false,
                    stretch: true,
                    flexibleSpace: FlexibleSpaceBar(
                        collapseMode: CollapseMode.parallax,
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                        ),
                        background: Lottie.asset("video/homebg.json",
                            fit: BoxFit.fill)),
                  ),
                  SliverPersistentHeader(
                    delegate: _SliverAppBarDelegate(
                      const TabBar(
                        indicatorSize: TabBarIndicatorSize.label,
                        labelColor: Color(0xFF00ADB5),
                        unselectedLabelColor: Color(0xFFEEEEEE),
                        tabs: _tabs,
                      ),
                    ),
                    pinned: true,
                  ),
                ];
              },
              // ignore: prefer_const_constructors
              body: TabBarView(
                children: [
                  const ProfilePage(),
                  Column(
                    children: matiereList
                        .map((matiere) => CoursePage(matiere: matiere))
                        .toList(),
                  ),
                  Column(
                    children: travailList
                        .map((travail) => TravauxPage(travail: travail))
                        .toList(),
                  ),
                  Column(
                    children: annonceList
                        .map((annonce) => NewsFeedPage(annonce: annonce))
                        .toList(),
                  )
                ],
              ),
            ),
          ),
        ),
      );
}

const _tabs = [
  Tab(
    icon: Icon(Icons.person),
    text: "Profile",
  ),
  Tab(icon: Icon(Icons.assignment_outlined), text: "Cours"),
  Tab(icon: Icon(Icons.home), text: "Travail a faire"),
  Tab(icon: Icon(Icons.newspaper), text: "Annonces"),
];

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;

  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new Container(
      color: Color(0xFF222831), // ADD THE COLOR YOU WANT AS BACKGROUND.
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
