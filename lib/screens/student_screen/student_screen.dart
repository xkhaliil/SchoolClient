import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:schoolclient/data/annonce-source.dart';
import 'package:schoolclient/data/matiere-source.dart';
import 'package:schoolclient/data/shared_preferences.dart';
import 'package:schoolclient/data/student-source.dart';
import 'package:schoolclient/model/Classe.dart';
import 'package:schoolclient/model/annonce.dart';
import 'package:schoolclient/model/matiere.dart';
import 'package:schoolclient/model/travail.dart';
import 'package:schoolclient/screens/student_screen/cours_et_travaux/cours_et_travaux.dart';
import 'package:schoolclient/screens/student_screen/annonces.dart';
import 'package:schoolclient/screens/student_screen/profile.dart';

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
        .then((student) => MatiereSource().getMatiereListByClasse(student.classeID))
        .then((matiereList) {
      setState(() {
        this.matiereList = matiereList;
      });
    });
  }

  @override
  Widget build(BuildContext context) => SafeArea(
        child: DefaultTabController(
          length: 3,
          child: Scaffold(
            body: NestedScrollView(
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                return <Widget>[
                  SliverAppBar(
                    backgroundColor: Color(0xFFEAC7C7),
                    expandedHeight: 300.0,
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
                          children: <Widget>[
                            Image.asset('images/logo-eliteee.png', height: 150)
                          ],
                        ),
                        background: Lottie.asset(
                          "video/homebg.json",
                          fit: BoxFit.cover,
                        )),
                  ),
                  SliverPersistentHeader(
                    delegate: _SliverAppBarDelegate(
                      const TabBar(
                        indicatorSize: TabBarIndicatorSize.label,
                        labelColor: Color(0xFFA0C3D2),
                        unselectedLabelColor: Color.fromARGB(255, 0, 0, 0),
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
  Tab(icon: Icon(Icons.person), text: "Profile"),
  Tab(icon: Icon(Icons.assignment_outlined), text: "Cours et travaux"),
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
    return _tabBar;
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
