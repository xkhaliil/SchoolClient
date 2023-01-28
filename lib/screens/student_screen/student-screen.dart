import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:schoolclient/data/annonce-list.dart';
import 'package:schoolclient/model/annonce.dart';
import 'package:schoolclient/model/student.dart';
import 'package:schoolclient/screens/student_screen/CoursEtTravaux.dart';
import 'package:schoolclient/screens/student_screen/Profile.dart';
import 'package:schoolclient/screens/student_screen/annonces.dart';

class StudentScreen extends StatefulWidget {
  static String routeName = (StudentScreen).toString();

  const StudentScreen({super.key});

  @override
  State<StudentScreen> createState() => _StudentScreenState();
}

class _StudentScreenState extends State<StudentScreen> {
  List<Annonce> annonceList = List.empty();


  @override
  @mustCallSuper
  void initState() {
    super.initState();
    AnnonceSource().getAnnonceList().then((annonceList) {
      for (var annonce in annonceList) {
        print(annonce.toString());
      }
      setState(() {
        this.annonceList = annonceList;
      });
    });
  }


  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
                        children: <Widget>[
                          Image.asset('images/logo-eliteee.png',height: 200,),
                          SizedBox(width: 50),
                          
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
              children:  [
                ProfilePage(),
                CoursePage(),
                Column(
                  children:  annonceList
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
